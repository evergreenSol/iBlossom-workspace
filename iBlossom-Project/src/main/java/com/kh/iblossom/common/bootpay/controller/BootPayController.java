package com.kh.iblossom.common.bootpay.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.iblossom.common.bootpay.Bootpay;
import com.kh.iblossom.common.bootpay.model.vo.request.SubscribePayload;
import com.kh.iblossom.common.bootpay.model.vo.response.ResDefault;
import com.kh.iblossom.subscribe.model.service.SubscribeService;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

@Controller
public class BootPayController {

	@Autowired
	SubscribeService subscribeService;
	
	static Bootpay bootpay = new Bootpay("62b2796de38c30001f5ae532", "Mps7sGIiLQAWaVDx3h2zSbyKuWBB8TTAGyS3l7QtMd8=");
	private int cancelParam = 0;
	
	@ResponseBody
	@RequestMapping(value="goGetToken.do", produces="application/json; charset=UTF-8")
    public static String goGetToken() {
		
		ResDefault<HashMap<String, Object>> res = null;
        try {
            res = bootpay.getAccessToken();
            // System.out.println(res.toJson());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return new Gson().toJson(res);
    }
	
	
	@ResponseBody
	@RequestMapping(value="requestSubscribe.do", produces="application/json; charset=UTF-8")
	public static String requestSubscribe(String billingKey, int totalPrice, String subProductName) {
	    SubscribePayload payload = new SubscribePayload();
	    System.out.println(totalPrice);
	    payload.billingKey = billingKey;
	    payload.itemName = subProductName;
	    payload.price = totalPrice;
	    payload.orderId = "" + (System.currentTimeMillis() / 1000);

	    ResDefault<HashMap<String, Object>> res = null;
	    try {
	    	goGetToken();
	    	res = bootpay.requestSubscribe(payload);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return new Gson().toJson(res);
	}
	
	@ResponseBody
	@RequestMapping("cancelSubscribe.do")
	public void cancelSubscribe() {
		cancelParam++;
	}
	
	@ResponseBody
	@RequestMapping("subscribe.do")
	public void subscribe(String billingKey, Date executeAt, int miliperiod, int totalPrice, String subProductName, Subscribe s, int numOfPay) { 

	int period = 1000*miliperiod;	
		
	Timer timer = new Timer();
	
		TimerTask timerTask = new TimerTask() {
			
			@Override
			public void run() {
				if(cancelParam==0) {	
					goGetToken();
					requestSubscribe(billingKey, totalPrice, subProductName);
					insertSubscribe(s, numOfPay);
					
				}
				else {
					timer.cancel();
				}
			}
			
		};
		timer.schedule(timerTask,executeAt,period);
	 	
	}
	
	@ResponseBody
	@RequestMapping(value="insert.su", produces="text/html; charset=UTF-8")
	public String insertSubscribe(Subscribe s, int numOfPay) {

		int result = 0;
		
		if(numOfPay==1) {
			result =  subscribeService.insertSubscribe(s);
		}
		else {
			for(int i = 0; i < numOfPay; i++) {
			
				result = subscribeService.insertSubscribe(s);
				Calendar cal = Calendar.getInstance();
				cal.setTime(s.getDeliverAt()); // 시간 설정
				cal.add(Calendar.MONTH, 1); // 월 연산
				s.setDeliverAt(cal.getTime());
				
				if (result < 1) {
					break;
				}
			} 
		}
		
		return (result > 0) ? "success" : "fail";

		
	}
	
	

}



	


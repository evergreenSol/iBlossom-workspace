package com.kh.iblossom.common.bootpay.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.iblossom.common.bootpay.Bootpay;
import com.kh.iblossom.common.bootpay.model.vo.request.SubscribePayload;
import com.kh.iblossom.common.bootpay.model.vo.response.ResDefault;

@Controller
public class BootPayController {

	static Bootpay bootpay = new Bootpay("62b2796de38c30001f5ae532", "Mps7sGIiLQAWaVDx3h2zSbyKuWBB8TTAGyS3l7QtMd8=");
	private int cancelParam = 0;
	
	@ResponseBody
	@RequestMapping(value="goGetToken.do", produces="application/json; charset=UTF-8")
    public static String goGetToken() {
		
		ResDefault<HashMap<String, Object>> res = null;
        try {
        	System.out.println("토큰발행 성공");
            res = bootpay.getAccessToken();
            // System.out.println(res.toJson());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return new Gson().toJson(res);
    }
	
	
	@ResponseBody
	@RequestMapping(value="requestSubscribe.do", produces="application/json; charset=UTF-8")
	public static String requestSubscribe(String billingKey) {
	    SubscribePayload payload = new SubscribePayload();
	    payload.billingKey = billingKey;
	    payload.itemName = "아이템04";
	    payload.price = 1000;
	    payload.orderId = "" + (System.currentTimeMillis() / 1000);

	    ResDefault<HashMap<String, Object>> res = null;
	    try {
	    	
	    	res = bootpay.requestSubscribe(payload);
	        System.out.println("결제성공");
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return new Gson().toJson(res);
	}
	
	@ResponseBody
	@RequestMapping(value="reserveSubscribe.do", produces="application/json; charset=UTF-8")
	public static String reserveSubscribe(String billingKey) {
        SubscribePayload payload = new SubscribePayload();

        payload.billingKey = billingKey;
        payload.itemName = "아이템01";
        payload.price = 1000;
        payload.orderId = "" + (System.currentTimeMillis() / 1000);
        payload.executeAt = (System.currentTimeMillis() / 1000); // 결제 승인 시점

	    ResDefault<HashMap<String, Object>> res = null;
        try {
            res = bootpay.reserveSubscribe(payload);
            // System.out.println(res.toJson());
        } catch (Exception e) {
            e.printStackTrace();	
        }

	    return new Gson().toJson(res);
    }
	
	@ResponseBody
	@RequestMapping("cancelSubscribe.do")
	public void cancelSubscribe() {
		cancelParam++;
		System.out.print("구독취소됨");
		// 여기나
	}
	
	@ResponseBody // 필요없어보이는데 없으면 콘솔에 404
	@RequestMapping("subscribe.do")
	public void subscribe(String billingKey, Date executeAt, int miliperiod) { 
		
	int period = 1000*miliperiod;	
		
	Timer timer = new Timer();
	
		TimerTask timerTask = new TimerTask() {
			
			@Override
			public void run() {
				if(cancelParam==0) {
					goGetToken();
					String response = requestSubscribe(billingKey);
					// 여기서 DB로 reponse에 들어있는 값들을 매개변수로 보내줄 수 있는 메소드 호출해 주문정보 저장
				}
				else {
					// 여기서 DB에 저장돼있던 주문정보 + billingKey 삭제 -> DELETE WHERE BILLINGKEY=#{billingKey}
					timer.cancel();
				}
			}
			
		};
		timer.schedule(timerTask,executeAt,period);
	 	
	}
	 
	

}

	


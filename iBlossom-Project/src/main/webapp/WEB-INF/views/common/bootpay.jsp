<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://js.bootpay.co.kr/bootpay-4.1.5.min.js" type="application/javascript"></script>
<title>iBlossom | BootPay</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>


<script>
	function getBillingKey() {
		BootPay.request({
			price: 0, // 0으로 해야 한다.
			application_id: "62b2796de38c30001f5ae52f",
			name: '정기적인 결제', //결제창에서 보여질 이름
			pg: 'nicepay',
			method: 'card_rebill', // 빌링키를 받기 위한 결제 수단
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			user_info: {
				username: '사용자 이름',
				email: '사용자 이메일',
				addr: '사용자 주소',
				phone: '010-1234-4567'
			},
			order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
			extra: {
				start_at: '2022-06-23', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at: '2022-08-24' // 정기결제 만료일 -  기간 없음 - 무제한
			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).done(function (data) {
			console.log(data.billing_key)
			// 여기서 billingKey DB에 저장해주기
			subscribe(data.billing_key);
		});
	}
	
	function subscribe(billingKey) {
		$.ajax({
			url : "subscribe.do",
			type : "post",
			data : {
				billingKey : billingKey,
				executeAt : new Date(),
				miliperiod : 30
				},
			success : function(data) {
				console.log("스케줄러 실행");
				
			}, error : function() {
				console.log("subscribe fail");
			}
		});
	}
	
	function cancelSubscribe() {
		$.ajax({
			url : "cancelSubscribe.do",
			type : "post",
			success : function(data) {
				console.log("스케줄러 중지");
				
			}, error : function() {
				console.log("cancelSubscribe fail");
			}
		});
	}
</script>
</body>
</html>
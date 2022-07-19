<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>iBlossom | OneDayClass</title>
<link href="resources/css/kms.css" rel="stylesheet">
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js" type="application/javascript"></script>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<style type="text/css">

</style>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
   <div id="class-pay-wrap">

    <div id='pay-full' align='center'>
        <div id='pay-left'>
            <h2 id="payTitle">결제하기</h2>
            <div class='pay-info1'>
                <div id="pay-content1">주문 상품 정보</div>
                <div id="pay-image"><img src="resources/images/onedayclass_main.jpg" width="120px" style="float:left;"></div>
                <div id="pay-content1_1">${ oc.className }</div>
                <div id="pay-content1_2">${ oc.classDate }</div>
                <div id="pay-content1_3">${ oc.price }원</div>
                <input type="hidden" id="classNo" value="${ oc.classNo }">
            </div>
            <div class='pay-info2'>
                <div id="pay-content2">주문자 정보</div>
                <div id="pay-content2_1" >${ loginUser.userName }</div>
                
                <div id="pay-content2_3" >${ loginUser.email }</div>     
                <div id="pay-content2_2" >${ loginUser.phone }</div> 
                          
            </div>            
        </div>
         
    <div>
	    <div id='pay-right'>
	        <form id='pay-right' class="pay" action="">
        		<div id="pay-content3">결제수단</div>
				<div id="pay-content3_1"><input type="radio" style="width:15px;height:15px;border:1px;" checked> 카드결제</div>
                <div id="pay-content3_2"><input type="checkbox" id="check_1"  checked />구매조건 확인 및 결제 진행에 동의</div>
                <br><br>
	        </form>
	        
	         <!-- 결제하기 버튼 -->
            <div>
                <button class="order-btn" id="pay-btn" onclick="getBillingKey();">결제하기</button>
            </div>
            <input type="hidden" id="userName" value="${ loginUser.userName }">
            <input type="hidden" id="email" value="${ loginUser.email }">
            <input type="hidden" id="phone" value="${ loginUser.phone }">
            <input type="hidden" id="price" value="${ oc.price }">
            <input type="hidden" id="classDate2" value="${ oc.classDate2 }">
            <input type="hidden" id="className" value="${ oc.className }">
			<input type="hidden" id="userNo" name="userNo" value="${ loginUser.userNo }">
	    </div>
     
    </div> 

    </div>
    
    
</div>




	<script>	
	
	// 빌링키 발급 -> 결제시 필수 아래 user_info 에서 로그인이 필수여서 결제 버튼 누를 때는 꼭 로그인 해야만 가능하다고 선 처리
	function getBillingKey() {
		BootPay.request({
			price: 0, // 0으로 해야 한다.
			application_id: "62b2796de38c30001f5ae52f",
			name: 'iBlossom 원데이클래스', //결제창에서 보여질 이름
			pg: 'nicepay',
			method: 'card_rebill', // 빌링키를 받기 위한 결제 수단
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			user_info: {
				username: $('#userName').val(), 
				email: $('#email').val(),
				phone: $('#phone').val(),
			},
			order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			async : true
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).done(function (data) {
			var price = $('#price').val();
			var onedayclass = "onedayclass";
			
				requestPay(data.billing_key, data.receipt_id, price, onedayclass);

		});
	}
	
	// 결제용 메소드 getBillingKey 에서 호출
	function requestPay(billingKey, receiptId, price, onedayclass) {
		
		$.ajax({
			url : "requestSubscribe.do",
			type : "post",
			data : {
				billingKey : billingKey,
				totalPrice : price,
				subProductName : onedayclass,
			},
			success : function(data) {
				console.log("상품 결제 성공");
				// 여기서 DB INSERT 용 함수 호출
				insertClassRes(receiptId);
				
			}, error : function() {
				console.log("상품 결제 실패");
			}
		});    
	}
	
	// DB에  객체 넣기용 메소드 -> DB에 넘겨줄 변수들을 receiptId와 같이  아래 data에서 보내주기
	// 이 함수는 위에 requestPay 함수 success 단에서 호출
	function insertClassRes(receiptId) {
		$.ajax({
			url : "resInsert.cl",
			type : "post",
			data : {
				classNo : $('#classNo').val(),
				resName : $('#userName').val(),
				resPhone : $('#phone').val(),
				resEmail : $('#email').val(),
				userNo : $('#userNo').val()
				// 그 외 필요한 변수들 세팅
			},
			success : function(result) {
				console.log("DB 넣음");
				alert(result);
				
				console.log($("#classDate").val());
				console.log($("#className").val());
				console.log($("#price").val());
				
				$.ajax({
    				url:"sendOnedayClassMessage.do",
    				data : {
    					classDate2 : $("#classDate2").val(),
    					className : $("#className").val(),
    					price : $("#price").val()
    				},
    				success : function (result) {
    					console.log(result)	
    					
    					location.href='onedayClass.me';
    				},
    				error : function () {
    					
    				}
    				
    			});
				
				
			}, error : function() {
				console.log("DB 넣음 실패")
			}
		});
	}

	</script>
	

	

<!--
     <script type="text/javascript">
        $(document).ready(function(){
    
            $("#pay-btn").click(function(){    
                if($("#check_1").is(":checked") == false){
                    alert("구매조건에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return;
                }else{
                    $("#pay-right").submit();
                }
            });    
        });
    </script>
 -->
        
<!-- 
        <script type="text/javascript">
        function CheckForm(Join){
            
            //체크박스 체크여부 확인 [하나]
            var chk1=document.frmJoin.U_checkAgreement1.checked;
            
            if(!chk1){
                alert('약관1에 동의해 주세요');
                return false;
            } 
    	</script>
 -->    	
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
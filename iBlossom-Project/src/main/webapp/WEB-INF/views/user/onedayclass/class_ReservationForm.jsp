<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/kms.css" rel="stylesheet">
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
                <div id="pay-content1_1">원데이클래스</div>
                <div id="pay-content1_2" name="classDate">${ date }</div>
                <div id="pay-content1_3">60,000원</div>
            </div>
            <div class='pay-info2'>
                <div id="pay-content2">주문자 정보</div>
                <div id="pay-content2_1" name="user_name">${ loginUser.userName }</div>
                <div id="pay-content2_2" name="phone">${ loginUser.phone }</div>
                <div id="pay-content2_3" name="email">${ loginUser.email }</div>                
            </div>            
        </div>
        <!-- 
        <div id='pay-right'>
            <div class='pay'>
                <div id="pay-content3">결제수단</div>
                <div id="pay-content3_1"><input type="radio" style="width:15px;height:15px;border:1px;" checked> 카드결제</div>
                <div id="pay-content3_2"><input type="checkbox" checked>구매조건 확인 및 결제 진행에 동의</div>
            </div>
            
            <button type="submit" id="pay-btn" class="">결제하기</button>
        </div>
         -->
         
    <div>
	    <div id='pay-right'>
	        <form id='pay-right' class="pay" action="">
        		<div id="pay-content3">결제수단</div>
				<div id="pay-content3_1"><input type="radio" style="width:15px;height:15px;border:1px;" checked> 카드결제</div>
                <div id="pay-content3_2"><input type="checkbox" id="check_1"  name="" />구매조건 확인 및 결제 진행에 동의</div>
                <br><br>
                <input type="submit" id="pay-btn"  value="결제하기"/>
	        </form>
	    </div>    
    </div>  


    </div>
</div>
        
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
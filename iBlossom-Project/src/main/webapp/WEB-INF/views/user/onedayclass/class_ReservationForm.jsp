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
                <div id="pay-content2_2" name="phone">${ loginUser.Phone }</div>
                <div id="pay-content2_3" name="email">${ loginUser.Email }</div>                
            </div>            
        </div>
        
        <div id='pay-right'>
            <div class='pay'>
                <div id="pay-content3">결제수단</div>
                <div id="pay-content3_1"><input type="radio" style="width:15px;height:15px;border:1px;" checked> 카드결제</div>
                <div id="pay-content3_2"><input type="checkbox" checked>구매조건 확인 및 결제 진행에 동의</div>
            </div>
            
            <button type="submit" id="pay-btn" class="">결제하기</button>
        </div>
    </div>
</div>
        
    
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
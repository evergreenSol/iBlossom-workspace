<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 장바구니</title>
<link href="resources/css/ldo-user.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- 사용자 장바구니 빈 페이지 -->
	
    <div class="cartEmptyOuter">
    
    	<!-- 장바구니 타이틀 -->
	    <div class="emptyTitle">&nbsp;쇼핑백</div>
	    
	    	<br><br><br>
	    	
	    	<hr>
	    	
			    <div class="emptyWrap">
			    
				    <!-- 이미지 -->
	                <div>
	                    <img src="resources/images/cart_zero_img.png">
	                </div>
				    
				    <!-- 멘트 -->  
				    <div style="font-size:large; margin-bottom:27px;">쇼핑백에 담긴 상품이 없습니다</div>
				    
				    <!-- 버튼 -->  
				    <!-- 220710 : 쇼핑백 구현을 위해 임시로 경로를 쇼핑백으로 정함, 구현이 완료된 후에는 마켓 경로를 연결해줄 예정 -->
				    <div>
				    	<button class="" type="button" onclick="location.href='test.ca'">쇼핑하러가기</button>
				    </div>
			    				    	
			    </div>
			    
		    <hr>	    
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>	


</body>
</html>
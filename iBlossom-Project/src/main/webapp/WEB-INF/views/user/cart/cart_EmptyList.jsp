<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 장바구니</title>
<link href="resources/css/ldo.css" rel="stylesheet">
<style>

	/* 사용자 장바구니 빈 페이지 */
	
	/* 전체 */
	.cartEmptyOuter {
		width: 1200px; 
		height: 760px; 
		margin: auto;
		margin-top: 53px;
	}
	
	/* 장바구니 타이틀 : 쇼핑백 */
	.emptyTitle {
		 font-weight:700; 
		 font-size:34px; 
		 margin-bottom:15px; 
		 float:left;
	}
	
	/* 감싸주는 div */
	.emptyWrap {
		padding:210px; 
		text-align: center;
	}
	
	/* 이미지 */
	.emptyWrap img {
		width:50px; 
		height:50px; 
		margin-bottom: 15px;
	}
	
	/* 쇼핑하러가기 버튼 */
	.emptyWrap button {
		width:320px; 
		height:50px; 
		background-color:black; 
		color:white; 
		border-radius:3px;
	}
	
	/* 쇼핑하러가기 버튼 hover */
	.emptyWrap button:hover {
		cursor: pointer;
	}

</style>

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
				    <div>
				    	<button class="" type="button" onclick="location.href=''">쇼핑하러가기</button>
				    </div>
			    				    	
			    </div>
			    
		    <hr>	    
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>	


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="resources/css/ldo-user.css" rel="stylesheet">
<style>
    
    /* 사용자 장바구니 페이지 레이아웃 */
    
    /* 전체 */
    #cartMainOuter {
    	width: 1200px;
    	height: 3000px;
    	margin: auto;
    }
     
    /* 왼쪽 섹션 */ 
    .cart-left {
        width: 65%;
        height: 100%;
        float: left;
        box-sizing: border-box;
    }

    /* 오른쪽 섹션 */
    .cart-right {
        width: 33%;
        height: 100%;
        float: right;
        box-sizing: border-box;
    }



    /* ----------------------------------------------------------- */   
    /* 사용자 장바구니 페이지 왼쪽 영역 */

    /* 전체선택, 선택삭제 div  */
    .cart-choice { 
        display: flex; 
        justify-content: space-between; 
        margin-bottom: 5px;
        font-weight: 500; 
    }
 
    /* 선택삭제 버튼 */
    .choice-delete-btn { 
        background-color: white;
        border: none; 
        padding: 5px; 
        width: 65px; 
        font-weight: 500;
        font-size: small;
        margin-bottom: 0.1cm;
        border-radius: 3px;
        color: gray;
    }
    
    /* 선택삭제 버튼 호버시 */
    .choice-delete-btn:hover {
    	cursor: pointer;
		font-weight: 600;
		color: black;
    }

    /* 장바구니 메뉴바 */
    .cart-menu { 
        /* 정렬 */
        display: flex; 
        justify-content: space-between;
        
        /* 스타일 */
        background-color: whitesmoke; /*lightgray*/
        padding: 15px;
        font-weight: 500; 
    }

    /* 장바구니 메뉴바 두개 항목 비율 */
    .cart-menu1 { 
	    flex-basis: 38%; 
	    margin:auto; 
	    
    }
    .cart-menu2 { 
    	flex-basis: 16%;
    }

    /* 장바구니 내용 */ 
    .cart-content { 
        display: flex; 
        justify-content: space-between; 
        padding: 45px;
        height: 400px;
    }
    
    /* 라디오 버튼 세로 정렬 */
    .cart-content1 {
	     line-height: 230px;
	     margin-left: -30px;
    }
    
    /* 이미지 감싸는 div */
    .cart-content2 {
     	margin-left: -40px;
    }
    
    /* 상세옵션 내용 */
    .cart-content3 {
    	margin-top: 120px; 
    	line-height: 20px;
    	margin-left: -40px;
    	font-size: 19px;
    }  
        
    /* 수량 버튼 */
    .cart-num-btn { 
	    background-color: whitesmoke; 
	    border:0; 
	    font-weight: 600; 
	    width:25px; 
	    height: 25px;
	    border-radius: 3px;
    }
    
    /* 총주문금액 X 마우스 hover */
    .cart-content4>a:hover { 
    	font-weight: 600;
    	/* color: #ff2393; */ 
    }

	/* 총주문금액 X a 태그 */
	.cart-content4>a {
		 text-decoration: none;
	}
	
	
	
    /* ----------------------------------------------------------- */
    /* 사용자 장바구니 페이지 오른쪽 영역 */

    /* 결제금액, 배송비 div */
    .cart-price1, .cart-price2 { 
        display: flex; 
        justify-content: space-between; 
        padding: 5px;
        margin: 10px 15px 15px 15px;
    }
      
    /* 총 결제 금액  div */
    .total-price {
    	display: flex; 
        justify-content: space-between;  
        padding: 5px;
        margin: 30px 15px 10px 15px; 
        font-weight: bold; 
    } 

    /* 안내사항 네모박스 div */
    .cart-div { 
        list-style: none; 
        background-color:whitesmoke; 
        padding: 5%;
    }
    
    /* 안내사항 네모박스 div > li */
    .cart-div>li {
     	margin: 6px;
    }
    
    /* 결제하기 버튼 */
    .cart-btn { 
        width:100%; 
        height:40px; 
        background-color: black; 
        color:white;
        border-radius: 3px;
    }
    
    .cart-btn:hover {
    	cursor: pointer;
    }
    
    /*-------------------------------------------------------*/
    
    /* 일단 임시 */
    
    /* 레이아웃 외곽 너비 400px 제한*/

	.wrap{
    max-width: 480px;
    margin: 0 auto; /* 화면 가운데로 */
    background-color: #fff;
    height: 100%;
    padding: 20px;
    box-sizing: border-box;
	}

	.reviewform textarea{
	    width: 100%;
	    padding: 10px;
	    box-sizing: border-box;
	}
	
	.rating .rate_radio {	
	    position: relative;	
	    display: inline-block;	
	    z-index: 20;	
	    opacity: 0.001;	
	    width: 60px;	
	    height: 60px;	
	    background-color: #fff;	
	    cursor: pointer;	
	    vertical-align: top;	
	    display: none;
	}
	
	.rating .rate_radio + label {	
	    position: relative;	
	    display: inline-block;	
	    margin-left: -4px;
	    z-index: 10;	
	    width: 60px;	
	    height: 60px;	
	    background-image: url('./img/starrate.png');	
	    background-repeat: no-repeat;	
	    background-size: 60px 60px;	
	    cursor: pointer;	
	    background-color: #f0f0f0;	
	}
	
	.rating .rate_radio:checked + label {	
	    background-color: #ff8;	
	}
	
	.cmd {	
	    margin-top: 20px;	
	    text-align: right;	
	}
	
	.cmd input[type="button"]{
	    padding: 10px 20px;	
	    border: 1px solid #e8e8e8;	
	    background-color: #fff;	
	    background-color:#000;  	
	    color: #fff;	
	}
		
	.warning_msg {	
	    display: none;	
	    position: relative;	
	    text-align: center;	
	    background: #ffffff;	
	    line-height: 26px;	
	    width: 100%;	
	    color: red;	
	    padding: 10px;	
	    box-sizing: border-box;	
	    border: 1px solid #e0e0e0;
	}


</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- 사용자 장바구니 페이지 왼쪽 영역 -->

	<br>
	
	<div id="cartMainOuter">
	
	    <!-- 장바구니 타이틀 -->
	    <p style="font-weight:700; font-size:34px; margin-bottom:15px;">&nbsp;쇼핑백</p>
	
	    <div class="cart-left">
	
	        <!-- 전체선택, 선택삭제 div -->
	        <div class="cart-choice">
	
	            <div>
	                <input type="radio">&nbsp;전체선택 <span>(1/2)</span>
	            </div>
	            <div>
	                <button type="button" class="choice-delete-btn" onclick="location.href=''">선택삭제</button>
	            </div>
	
	        </div>
	
	        <!-- 장바구니 메뉴바 -->
	        <div>
	
	            <div class="cart-menu">
	                <span class="cart-menu1">상품정보</span>
	                <span class="cart-menu2">총 주문금액</span>
	            </div>
	
	        </div>
	
	        <!-- 장바구니 내용 -->
	        <div> 
				<c:forEach var="p" items="${list}">
				
		            <div class="cart-content">
						
		                <!-- 장바구니 라디오 버튼 -->
		                <p class="cart-content1">
		                    <input type="radio">
		                </p>
		
		                <!-- 장바구니 이미지 -->
		                <span class="cart-content2">
		                    <img src="${p.thumbnail }" style="width:330px; height:350px;">
		                </span>
		
		                <!-- 장바구니 선택항목 상세옵션 -->
		                <span class="cart-content3">
		                    
		                        <!-- 제목 -->
		                        <div> ${p.flowerName}</div><br>
		                        
		                        <div class="num">

					                <!-- 장바구니 수량 변경 -->
					
					                <div class="updown">
					
					                    <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="2">
					
					                    <span><i class="fas fa-arrow-alt-circle-up up"></i></span>
					
					                    <span><i class="fas fa-arrow-alt-circle-down down"></i></span>
					
					                </div>
					
					            </div>
		                       
		                </span>

		                <!-- 장바구니 상품 합계 -->

			            <div class="sum cart-content4"
			             	 class="bigtext right-align box blue summoney" id="sum_p_price" 
			            	 style="line-height: 280px; font-size:19px;">40,000원</div>
						<!-- <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.productPrice}" />원 -->
			            <div class="basketcmd"><a href="#" class="abutton">X</a></div>
		            
		            </div>
	            
	            </c:forEach>
	
				<br>
				
	            <hr>
	
	        </div> 
	        
	        <!-- 
	        	* 로그인이 되지 않은 상태 :  "바구니가 비어있습니다." 페이지
	        	* 로그인 했는데 상품을 담지 않은 상태라면 : "바구니가 비어있습니다." 페이지 
				* 로그인 했고 담은 상품이 있다면 담은 상품 보여주기
	         -->
	        
	        <!------------------------------------------------------------------->    
	
	        <!-- 수량 증가 함수 -->
	        <script language="JavaScript">
	            var sell_price;
	            var amount;
	            
	            function init () {
	                sell_price = document.form.sell_price.value;
	                amount = document.form.amount.value;
	                document.form.sum.value = sell_price;
	                change();
	            }
	            
	            function add () {
	                hm = document.form.amount;
	                sum = document.form.sum;
	                hm.value ++ ;
	            
	                sum.value = parseInt(hm.value) * sell_price;
	            }
	            
	            function del () {
	                hm = document.form.amount;
	                sum = document.form.sum;
	                    if (hm.value > 1) {
	                        hm.value -- ;
	                        sum.value = parseInt(hm.value) * sell_price;
	                    }
	            }
	            
	            function change () {
	                hm = document.form.amount;
	                sum = document.form.sum;
	            
	                    if (hm.value < 0) {
	                        hm.value = 0;
	                    }
	                sum.value = parseInt(hm.value) * sell_price;
	            }  
	            
	        </script> 
	
	    </div>
	    
	    <!------------------------------------------------------------------->
	
	    <div class="cart-right">
	    
		    <!-- 사용자 장바구니 페이지 오른쪽 영역-->
		    <div class="cart-right-price">
		
		        <!-- 총 주문 금액 -->
		        <div class="cart-price1">
		            <span>총 주문 금액</span>
		            <span>31,800원</span>
		        </div>
		
		        <!-- 배송비 -->
		        <div class="cart-price2">
		            <span>배송비</span>
		            <span>+ 3000원</span>
		        </div>
		
		        <!-- 구분선 -->
		        <hr>
		
		        <!-- 총 결제 금액 -->
		        <div class="total-price">
		            <span>총 결제 금액</span>
		            <span>34,800원</span>
		        </div>
		
	        </div>
	
	        <br>
	
	        <!-- 결제 전 안내사항 div -->
	        <div>
	
	            <div class="cart-div">
	            <li>- 장바구니에 담긴 상품이 품절되거나, 수령일에 구매가 불가능한 상태가 되면 장바구니에 상품은 삭제됩니다.</li>
	            <li>- 구매 금액 합산 100,000,000원 이상일 경우, 배송비는 무료입니다. (단, [정기구독], [무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)</li>
	            <li>- [정기구독] 상품의 첫 번째 발송일에 일반 택배 상품을 함께 구매하실 경우, 중복 배송비는 부분 환불 처리해 드립니다.</li>
	            </div>
	
	        </div>
	
	        <!-- 결제하기 버튼 -->
	        <div>
	            <button class="cart-btn" type="submit" onclick="location.href='detail.or'">결제하기</button>
	        </div>
	        
	    </div>
  
    </div>    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>	

</body>
</html>
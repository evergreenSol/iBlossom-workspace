<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_Cart_MainView</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="resources/css/ldo-user.css" rel="stylesheet">
<style>
    
    /* 사용자 장바구니 페이지 레이아웃 */
    
    /* 전체 */
    #cartMainOuter {
    	width: 1200px;
    	height: 800px;
    	margin: auto;
    }
     
    /* 왼쪽 섹션 */ 
    .cart-left {
        width: 60%;
        height: 100%;
        float: left;
        box-sizing: border-box;
    }

    /* 오른쪽 섹션 */
    .cart-right {
        width: 36%;
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
    }
 
    /* 선택삭제 버튼 */
    .choice-delete-btn { 
        background-color: whitesmoke; 
        border: none; 
        padding: 5px; 
        width: 70px; 
        font-weight: bold;
        font-size: small;
        margin-bottom: 0.1cm;
    }

    /* 장바구니 메뉴바 */
    .cart-menu { 
        /* 정렬 */
        display: flex; 
        justify-content: space-between;
        
        /* 스타일 */
        background-color: lightgray;
        padding: 10px; 
    }

    /* 장바구니 메뉴바 두개 항목 비율 */
    .cart-menu1 { 
	    flex-basis: 20%; 
	    margin:auto; 
    }
    .cart-menu2 { 
    	flex-basis: 16%;
    }

    /* 장바구니 내용 */ 
    .cart-content { 
        display: flex; 
        justify-content: space-between; 
        padding: 50px;
        height: 300px; 
    }
    
    /* 수량 버튼 */
    .cart-num-btn { 
	    background-color: whitesmoke; 
	    border:0; 
	    font-weight: 600; 
	    width:25px; 
	    height: 25px;
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

    /* 결제금액 div */
    .cart-right-price>div { 
        display: flex; 
        justify-content: space-between; 
        padding: 5px; /* 너비조정 */
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

    /* 총 결제 금액 div */
    .total-price { 
        padding: 10px; 
        font-weight: bold; 
        margin-top: 25px;
        margin-bottom: 5px;
    } 

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- 사용자 장바구니 페이지 왼쪽 영역 -->

	<br>
	
	<div id="cartMainOuter">
	
	    <!-- 장바구니 타이틀 -->
	    <h1>쇼핑백</h1>
	
	    <div class="cart-left">
	
	        <!-- 전체선택, 선택삭제 div -->
	        <div class="cart-choice">
	
	            <div>
	                <input type="radio">전체선택(1/2)
	            </div>
	            <div>
	                <button type="button" class="choice-delete-btn" onclick="">선택삭제</button>
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
	
	            <div class="cart-content">
	
	                <!-- 장바구니 라디오 버튼 -->
	                <p class="cart-content1" style="line-height: 150px;">
	                    <input type="radio">
	                </p>
	
	                <!-- 장바구니 이미지 -->
	                <span class="cart-content2">
	                    <img src="resources/images/user_cart_main_view.png" style="width:200px; height:200px;">
	                </span>
	
	                <!-- 장바구니 선택항목 상세옵션 -->
	                <span class="cart-content3">
	                    
	                        <!-- 제목 -->
	                        <div>상품 제목</div> <br>
	
	                        <!-- 수령일 -->
	                        <div>수령일 : 2022-06-21(목)</div><br>
	
	                        <!-- 가격 -->
	                        <!-- <div>가격</div> -->
	                        <div>6,900원</div><br>
	
	                        <!-- 수량 -, + 옵션 -->
	                        <form name="form" method="get">
	
	                                                      금액 : <input type="text" name="sum" size="5" readonly>원 <br><br>
	                              <input type= "hidden" name="sell_price" value="6900">
	                              <input type="button" value=" - " onclick="del();" class="cart-num-btn">
	                              <input type="text" name="amount" value="1" onchange="change();" 
	                              	     style="width:25px; height:20px;">
	                              <input type="button" value=" + " onclick="add();" class="cart-num-btn">
	  
	                        </form>
	                        
	                </span>
	
	                <!-- 총 주문 금액 span -->
	                <p class="cart-content4" style="line-height: 150px;">
	                	6,900원 
	                	<a href="">X</a>
	                </p>
	            
	            </div>
	
	            <!-- 1개 선택항목 끝난 후 구분선 -->
	            <hr>
	
	        </div>    
	
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
	
	    <div class="cart-right">
	    
	    <!-- 사용자 장바구니 페이지 오른쪽 영역-->
	    <div class="cart-right-price">
	
	        <!-- 총 주문 금액 -->
	        <div>
	            <span>총 주문 금액</span>
	            <span>31,800원</span>
	        </div>
	
	        <!-- 배송비 -->
	        <div>
	            <span>배송비</span>
	            <span>+ 0원</span>
	        </div>
	
	        <!-- 구분선 -->
	        <hr>
	
	        <!-- 총 결제 금액 -->
	        <div  class="total-price">
	            <span>총 결제 금액</span>
	            <span>31,800원</span>
	        </div>
	
        </div>
	
	        <br>
	
	        <!-- 결제 전 안내사항 div -->
	        <div>
	
	            <div class="cart-div">
	            <li>- 장바구니에 담긴 상품이 품절되거나, 수령일에 구매가 불가능한 상태가 되면 장바구니에 상품은 삭제됩니다.</li>
	            <li>- 구매 금액 합산 30,000원 이상일 경우, 배송비는 무료입니다. (단, [정기구독], [무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)</li>
	            <li>- [정기구독] 상품의 첫 번째 발송일에 일반 택배 상품을 함께 구매하실 경우, 중복 배송비는 부분 환불 처리해 드립니다.</li>
	            </div>
	
	        </div>
	
	        <!-- 결제하기 버튼 -->
	        <div>
	            <button class="cart-btn" type="submit" onclick="location.href='detailView.ord'">결제하기</button>
	        </div>
	        
	    </div>
    
    </div>
    
    <br>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>	

</body>
</html>
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link href="resources/css/ldo-user.css" rel="stylesheet">
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
	                <input type="checkbox">&nbsp;전체선택 <span>(1/2)</span>
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
	        <form action="detail.or">
	        <div>
				<c:forEach var="c" begin="0" end="${ list.size() -1 }">
				
		            <div class="cart-content">
						
		                <!-- 장바구니 라디오 버튼 -->
		                <p class="cart-content1">
		                    <input type="checkbox" name="cartList[${c}].cartNo" value="${list[c].cartNo}">
		                </p>
		
		                <!-- 장바구니 이미지 -->
		                <span class="cart-content2">
		                    <img src="${ list[c].thumbnail }" style="width:330px; height:350px;">
		                </span>
		
		                <!-- 장바구니 선택항목 상세옵션 -->
		                <span class="cart-content3">
		                    
		                        <!-- 제목 -->
		                        <div> ${ list[c].flowerName }</div><br>
		                            
		                        <div class="basketprice"><input type="hidden" name="" id="p_price1" class="p_price" value="${ list[c].productPrice }">${ list[c].productPrice }원</div>

					            <!-- 장바구니 수량 변경 -->		                        
		                        <div class="num">
					                <div class="updown">
					                	<br>
					                	<span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>		
					                    <input type="text" name="" id="p_num1" size="1" maxlength="5" class="p_num" value="${ list[c].productCount }" 
					                           onkeyup="javascript:basket.changePNum(1);">
					                    <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>				
					                </div>					
					            </div>     
		                </span>

		                <!-- 장바구니 상품 합계 -->
			            <div class="sum cart-content4"
			             	 class="bigtext right-align box blue summoney" id="sum_p_price" 
			            	 style="line-height: 280px; font-size:19px;">${ list[c].productCount * list[c].productPrice }원</div>
						<!-- <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.productPrice}" />원 -->
			            <div class="basketcmd"><a href="#" class="abutton">X</a></div>
		            
		            </div>
	            </c:forEach>
	            	<button type="submit" id="real-submit-button" style="display:none"></button><!--  -->
				</form>
				<br>
				
	            <hr>
	
	     </div> 
	        
	        <!-- 
	        	* 로그인이 되지 않은 상태 :  "바구니가 비어있습니다." 페이지
	        	* 로그인 했는데 상품을 담지 않은 상태라면 : "바구니가 비어있습니다." 페이지 
				* 로그인 했고 담은 상품이 있다면 담은 상품 보여주기
	         -->
	
	    </div>
	    
	    <!------------------------------------------------------------------->
	
	    <div class="cart-right">

		    <!-- 사용자 장바구니 페이지 오른쪽 영역-->
		    <div class="cart-right-price">
		
		        <!-- 총 주문 금액 -->
		        <div class="cart-price1">
		            <span>총 주문 금액</span>
	            	<c:set var = "total" value = "0" />
					<c:forEach var="i" items="${ list }" varStatus="status">     
					<c:set var="total" value="${ total + (i.productPrice * i.productCount) }"/>
					</c:forEach>
		            <span>${ total } 원</span>
		            
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
			        <span>${ total }원</span>
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
	            <button class="cart-btn" type="button">결제하기</button>
	        </div>
	        
	        
	    </div>
	    
  
    </div>    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>	

	<script>
		$(function () {
			$(".cart-btn").click(function () {
				$("#real-submit-button").trigger("click");
			});
		});
	</script>

</body>
</html>
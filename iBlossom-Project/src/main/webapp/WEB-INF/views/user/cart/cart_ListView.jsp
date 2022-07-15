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
<body  onload="init();">

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
	        	
	        	<div style="border:1px solid; padding:30px;">
	        		        
					<c:forEach var="c" begin="0" end="${ list.size() -1 }" varStatus="status">
					<input type="hidden" value="${ list.size() }" id="listSize">
					
			            <div class="cart-content">
							
			                <!-- 장바구니 라디오 버튼 -->
			                <p class="cart-content1">
			                    <input type="checkbox" name="cartList[${c}].cartNo" value="${list[c].cartNo}">
			                </p>
			
			                <!-- 장바구니 이미지 -->
			                <div class="cart-content2">
			                    <img src="${ list[c].thumbnail }" style="width:280px; height:320px;">
			                </div>
			
			                <!-- 장바구니 상세옵션 -->
			                <div class="cart-content3" style="border:1px solid;">
			                    
			                        <!-- 제목 -->
			                        <div style="border:1px solid;"> ${ list[c].flowerName }</div><br><br><br>
			                         
			                        <!-- 가격 -->   
			                        <div class="basketprice" style="border:1px solid;">
			                        	<input type="hidden" id="price${ status.count }" value="${ list[c].productPrice }">
			                        	<fmt:formatNumber value="${ list[c].productPrice }" pattern="###,###"/>원
			                        </div><br><br>
	
						            <!-- 장바구니 수량 변경 -->
				                    <input type="button" value="-" onclick="count('minus',${ status.count })">
			                        <input type="number" id="productCount${ status.count }" value="${ list[c].productCount }" size="1">
			                        <input type="button" value="+" onclick="count('plus',${ status.count })">
			                        
			                        <!--  
				                	<input type="hidden" name="sell_price" value="${ list[c].productCount }">
				                	<input class="cart-num-btn" type="button" value=" - " onclick="del();">	
				                    <input type="text" name="amount" size="1" onchange="change();" value="${ list[c].productCount }"
				                           style="width:20px; height:20px; text-align:center;">
				                    <input class="cart-num-btn" type="button" value=" + " onclick="add();">
				                   -->						    
			                </div>
	
			                <!-- 장바구니 상품 금액 -->
				            <div class="cart-content4"style="border:1px solid;">
						        <input type="text" id="sum${ status.count }" name="sum" size="3" readonly style="border:none; font-size:18px; text-align:center;"
						               value="<fmt:formatNumber value="${ list[c].productCount * list[c].productPrice }" pattern="###,###"/>" />
						               <!-- ${ list[c].productCount * list[c].productPrice }원 -->
				            </div>
							
				            <div class="cart-content5">
				            	<a href="#" class="abutton">X</a>
				            </div>
			            
			            </div>
			            
		            </c:forEach> <button type="submit" id="real-submit-button" style="display:none"></button>
			
				</div>
			
			</form>
				
			<br><hr>

	    </div> <!-- class="cart-left" -->
	    
	    <script>
	    
	 		// 수량 더하기, 빼기용 함수
		    function count(type,index)  { 
		        
		        const productCount = document.getElementById('productCount'+index+''); // id="productCount1, productCount2..."
		        
		        // 현재 화면에 표시된 값
		        let count = productCount.value; // 변수 선언 및 값을 productCount input의 value로 초기화
		        
		        let price = document.getElementById('price'+index+'').value;
		        
		        const sum = document.getElementById('sum'+index+'');
	 			var sumAll = document.getElementById('sumAll');
	 			
		        
		        // 더하기/빼기
		        if(type === 'plus') { // 매개변수로 plus type이 넘어오면
		          productCount.value = parseInt(count) + 1; // count++
		          
		          sum.value = price * productCount.value;
		         
	
		        } else if(type === 'minus' && count > 1)  { // 매개변수로 minus type 이 넘어오고 1보다 크다면
		          productCount.value = parseInt(count) - 1; // count--
	
		          sum.value = price * productCount.value;
		          
		        }
		        else { // 그 외에는
		          productCount.value = parseInt(count); // 현상 유지
		          
		          sum.value = price * productCount.value;
		          
		        }
		        

	 			console.log(sum);
	 			console.log(sumAll);
				
		        //getSum();
		    }
	 		
	 		/*
	 		function getSum() {
	 			
	 			
	 			var sumAll = document.getElementById('sumAll');
	 			
	 			
	 		}

	 		*/

	 		
		</script>
	    
	    <!------------------------------------------------------------------->
	
	    <div class="cart-right">

		    <!-- 사용자 장바구니 페이지 오른쪽 영역-->
		    <div class="cart-right-price">
		
		        <!-- 총 주문 금액 -->
		        <div class="cart-price1">
		            <span>총 주문 금액</span>
		            
		            <span id="sumAll">원</span>
		            
		            <!--  
	            	<c:set var = "total" value = "0" />
						<c:forEach var="i" items="${ list }" varStatus="status">     
							<c:set var="total" value="${ total + (i.productPrice * i.productCount) }"/>
						</c:forEach>
		            <span id="sumAll"><fmt:formatNumber value="${ total }" pattern="###,###"/>원</span>
		            -->

		        </div>
		        
		        <!-- 배송비 -->
		        <div class="cart-price2">
		            <span>배송비</span>
		            <span><fmt:formatNumber value="3000" pattern="###,###"/>원</span>
		        </div>

		        <hr>
		
		        <!-- 총 결제 금액 -->
		        <div class="total-price">
		            <span>총 결제 금액</span>
			        <span><fmt:formatNumber value="${ total + 3000 }" pattern="###,###"/>원</span>
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

	    </div> <!-- class="cart-right" -->
	    
    </div> <!-- id="cartMainOuter" -->
    
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
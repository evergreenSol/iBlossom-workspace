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
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- 사용자 장바구니 페이지 왼쪽 영역 -->

	<br>
	
	<div id="cartMainOuter">
	
	    <!-- 장바구니 타이틀 -->
	    <p id="CartTitle">&nbsp;쇼핑백</p>
	
	    <div class="cart-left">
	
	        <!-- 전체선택, 선택삭제 div -->
	        <div class="cart-choice">
	            <div>
	                <input type="checkbox" checked onclick="checkFalse">&nbsp;전체선택 <span>(1/2)</span>
	            </div>
	            
	            <!-- 현재 페이지 들어오면 전체선택 되게끔 -->
	            <script>
		            $(document).ready(function(){
		                var link =  document.location.href; // 현재 페이지 url 를 가지고 옵니다.    
	                        $( "input[type=checkbox]" ).each(function(){ // 확인됐으면 모든 체크박스에 체크를 해줍니다.
	                        	$(this).attr('checked', true);
	                        });
		        	});
		            
		            function
	            </script>
	            
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
	        	
	        	<div style="border:1px solid; padding:0px;">
	        		        
					<c:forEach var="c" begin="0" end="${ list.size() -1 }" varStatus="status">
					<input type="hidden" value="${ list.size() }" id="listSize">
					
			            <div class="cart-content">
							
			                <!-- 장바구니 라디오 버튼 -->
			                <p class="cart-content1">
			                    <input type="checkbox" name="cartList[${c}].cartNo" value="${list[c].cartNo}">
			                </p>
			
			                <!-- 장바구니 이미지 -->
			                <div class="cart-content2">
			                    <img src="${ list[c].thumbnail }" style="width:280px; height:280px;">
			                </div>
			
			                <!-- 장바구니 상세옵션 -->
			                <div class="cart-content3" style="border:1px solid;">
			                    
			                        <!-- 제목 -->
			                        <div style="border:1px solid;"> ${ list[c].flowerName }</div><br><br><br>
			                         
			                        <!-- 가격 -->   
			                        <div class="basketprice" style="border:1px solid;">
			                        	<input type="text" id="price${ status.count }" value="${ list[c].productPrice }">원
			                        </div><br><br>
	
						            <!-- 장바구니 수량 변경 -->
				                    <input type="button" value="-" onclick="count('minus',${ status.count })">
			                        <input type="text" id="productCount${ status.count }" value="${ list[c].productCount }" size="1">
			                        <!-- 0715 PM 5:45 type="number" 에서 text 로 변경 - 다온 -->
			                        <input type="button" value="+" onclick="count('plus',${ status.count })">
			                        					    
			                </div>
	
			                <!-- 장바구니 상품 금액 -->
				            <div class="cart-content4" style="border:1px solid;">
						        <input type="text" id="sum${ status.count }" name="sum" size="3" readonly style="border:none; font-size:18px; text-align:center;">
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
	    
	    	$(function() { // 페이지 로딩시 바로 실행되는 아이 
	    		
	    		var listSize = $('#listSize').val(); // 상품 리스트 사이즈 (상품이 3개면 3개)
	    		var sumAll = 0;
	    		for(var i = 0; i < listSize; i++) { // 상품 리스트를 돌면서
	    			var price = $('#price'+(i+1)+'').val(); // 각 상품 가격
	    			var productCount = $('#productCount'+(i+1)+'').val(); // 각 상품 수량
	    			$('#sum'+(i+1)+'').attr("value",price*productCount); // sum1, sum2, ... 에 전달
	    			
	    			sumAll += parseInt($('#sum'+(i+1)+'').val()); // sumAll = sum1 + sum2 + ...
	    		}
				$('#sumAll').attr("value",sumAll); // sumAll input에 sumAll 값 전달
				$('#totalPrice').text(sumAll + 3000);
	    	});
	    	
	    	// 체크가 됐을 때 : 체크된 애가 몇번째 박스인지 가져오고 그 값을 이용해서 price + 그값 
	    	// 체크가 풀리면 체크된 애가 몇번째 박스인지 가져오고 그 "몇번쨰" 인지 값을 이용해서 $('#price'+(그값)+'').val() 을 0으로 바꿔주기
	    	// 체크가 안됐을 때는 아이디를 다르게 주면 된다. notPrice/ notProductCount
	    	
	    	function checkPrice() { // 이름을 주게 되면 그 실행해달라고 하는 곳에서 실행됨
	    		
	    	}
	    	
	    	
    		function getSum() { // 이름을 주게 되면 그 실행해달라고 하는 곳에서 실행됨
    			
    			var listSize = $('#listSize').val(); // 상품 리스트 사이즈 (상품이 3개면 3개)
	    		var sumAll = 0;
	    		for(var i = 0; i < listSize; i++) { // 상품 리스트를 돌면서
	    			var price = $('#price'+(i+1)+'').val(); // 각 상품 가격
	    			var productCount = $('#productCount'+(i+1)+'').val(); // 각 상품 수량
	    			$('#sum'+(i+1)+'').attr("value",price*productCount); // sum1, sum2, ... 에 전달
	    			
	    			sumAll += parseInt($('#sum'+(i+1)+'').val()); // sumAll = sum1 + sum2 + ...
	    		}
				$('#sumAll').attr("value",sumAll); // sumAll input에 sumAll 값 전달
				$('#totalPrice').text(sumAll + 3000);
    		}
	    	    
	 		// 수량 더하기, 빼기용 함수
		    function count(type,index)  { 
		        
		        const productCount = document.getElementById('productCount'+index+''); // id="productCount1, productCount2..."
		        
		        // 현재 화면에 표시된 값
		        let count = productCount.value; // 변수 선언 및 값을 productCount input의 value로 초기화
		        
		        let price = document.getElementById('price'+index+'').value;
		        
		        const sum = document.getElementById('sum'+index+'');

		        // 더하기/빼기
		        if(type === 'plus') { // 매개변수로 plus type이 넘어오면
		          productCount.value = parseInt(count) + 1; // count++
		          
		          sum.value = price * productCount.value;
		          getSum();
				  
		        } else if(type === 'minus' && count > 1)  { // 매개변수로 minus type 이 넘어오고 1보다 크다면
		          productCount.value = parseInt(count) - 1; // count--
	
		          sum.value = price * productCount.value;
		          getSum();
		        }
		        else { // 그 외에는
		          productCount.value = parseInt(count); // 현상 유지
		          
		          sum.value = price * productCount.value;
		          getSum();
		        }
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
		
		        <!-- 1. 총 주문 금액 -->
		        <div class="cart-price1">
		            <span>총 주문 금액</span>
		            
		            <input type="text" id="sumAll" name="sumAll">원
		            
		            
		            <!--  
	            	<c:set var = "total" value = "0" />
						<c:forEach var="i" items="${ list }" varStatus="status">     
							<c:set var="total" value="${ total + (i.productPrice * i.productCount) }"/>
						</c:forEach>
		            <span id="sumAll"><fmt:formatNumber value="${ total }" pattern="###,###"/>원</span>
		            -->

		        </div>
		        
		        <!-- 2. 배송비 -->
		        <div class="cart-price2">
		            <span>배송비</span>
		            <!-- <span><fmt:formatNumber value="3000" pattern="###,###"/>&nbsp;원</span> -->
		            <span>3000&nbsp;원</span>
		        </div>

		        <hr>
		
		        <!-- 3. 총 결제 금액 = 1 + 2 -->
		        <div class="total-price">
		            <span>총 결제 금액</span>
			        <span id="totalPrice"></span>원
			        
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
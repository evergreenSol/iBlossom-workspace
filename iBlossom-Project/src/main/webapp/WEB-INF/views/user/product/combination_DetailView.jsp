<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="resources/css/jsa.css" rel="stylesheet">
 <!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
 <style>
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}

</head>
<body>

	<jsp:include page="../../common/header.jsp" />

	<br>
	<br>
	<br>

	<div id="wrap_detail1">
		<div style="width: 1000px; margin: auto;">
			<table>
				<tr class="tr1" valign="top">
					<td rowspan="6"><img src="resources/images/flower3.PNG">
						<select id="select_flower" name="select_flower"
						onchange="selectFlower()">
							<option selected disabled>
								---------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								---------</option>
							<c:forEach var="p" items="${ list }" varStatus="status">
								<option id="option_flower${ status.count }"
									value="${ status.count }">${ p.flowerName }</option>
							</c:forEach>
					</select></td>
					<td class="pp" style="padding-top: 20px;"><b
						style="font-size: 25px;">조합형</b></td>
				</tr>
				<tr>
					<td class="pp"><hr></td>
				</tr>
				<tr>
					<td class="pp"><b>내가 직접 고르고 선물해보세요~ </b> <br> 감동이 2배 <br>
						<hr style="margin-bottom: 10px;"></td>
				</tr>
				<tr>
					<td>
						<form id="cartItems" method="post" action="">
							<div id="countBox1" align="center" style="overflow: auto">
								<c:forEach var="p" items="${ list }" varStatus="status">
									<div class="item${ status.count }" hidden>
										<div onclick="removeItem(${ status.count })" id="removeItem">
											<img src="resources/images/x.png" style="width: 13px;float: right; cursor:pointer;margin: 8px 8px 0px 0px;">
										</div>
										<input type="hidden" id="index" value=${ status.count }>
										<input type="hidden" id="userNo" value="${ loginUser.userNo }">
										<input type="hidden" id="productNo" value="${ p.productNo }">
										<div style="background-color: white;height: 40px;padding-top: 20px;margin-top:10px;" >
											<span>${ p.flowerName }</span>
											<input type="button" value="-" onclick="count('minus',${ status.count })" class="input-button1">
											<input type="number" id="productCount${ status.count }" value="1" class="input-productCount">
											<input type="button" value="+" onclick="count('plus',${ status.count })" class="input-button2">
											<input type="hidden" id="productPrice${ status.count }" value="${ p.price }">
										</div>
									</div>
								</c:forEach>
							</div>
						</form> <br>
						<div style="margin-left: 20px">
							<div>
								배송비: 
								<span style="margin-left:300px">3,000 원</span>
								<br>
								<br>
							</div>
							<div>
								총 주문금액 : <input type="text"
									style="border: none; font-weight: 700; font-size: 15px; background-color: rgba(224, 224, 224, 0.001); padding-left: 60px; width: 50px;"
									name="sum" size="11" id="sum" readonly value=""><span style="margin-left: 200px">원</span>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td><br> <br> <c:choose>
							<c:when test="${ loginUser eq null }">
								<input value="장바구니" type="button" id="btn1"
									onclick="alert('로그인이 필요한 서비스 입니다!'); location.href='loginForm.me';">
							</c:when>
							<c:otherwise>
								<input value="장바구니" id="btn1" type="button"
									onclick="submitForm();">
							</c:otherwise>
						</c:choose></td>
				</tr>

			</table>


			<!--상세 정보 버튼 시작-->
			<div class="categorize review-box"
				style="height: 100px; margin-top: 30px;">
				<div class="reviewBox" id="combination_content"
					onclick="showDetail();">상세정보</div>
				<div class="reviewBox" id="combination_review"
					onclick="showReview();">리뷰</div>
			</div>

			<!-- 상세정보 폼-->

			<div id="flowerDetailList">
				<c:forEach var="p" items="${ list }">
					<table style="overflow: hidden;">
						
						<tr>
							<td>
							<img src="${ p.thumbNail }">
							</td>
						</tr>
						<tr>  
							<td>${ p.flowerName }</td>
						</tr>
					</table>
				</c:forEach>
			</div>

		</div>


    <script>
        $(document).ready(function(){
        	showDetail();
        });
    </script>

		<!-- 리뷰 작성폼-->

		<div id="reviewList" hidden>
		
		</div>


	</div>

	<script>
	// 빈 배열 만들기
	var items = [];
	
	// 특정 상품이 셀렉 되면
	function selectFlower() {
		
		var selectFlower = $("#select_flower").val(); // 해당 상품의 인덱스 가져오기
		$(".item"+ selectFlower +"").removeAttr("hidden"); // class="item + 해당 인덱스" 인 div hidden 제거 
		
		// var index = $(".item"+ selectFlower +"").children("#index").val(); // index
		items.push(selectFlower); // 아까 생성한 빈 배열에 인덱스 밀어넣어주기

		$("#option_flower"+selectFlower+"").attr("disabled", "true"); // 이미 셀렉된 상품은 다시 셀렉 못하게
		
	}
	
	function count(type,index)  { // 수량 더하기, 빼기용 함수
		  
		  const productCount = document.getElementById('productCount'+index+''); // id="productCount1, productCount2..."
		  
		  
		  // 현재 화면에 표시된 값
		  let count = productCount.value; // 변수 선언 및 값을 productCount input의 value로 초기화
		  
		  // 더하기/빼기
		  if(type === 'plus') { // 매개변수로 plus type이 넘어오면
		    productCount.value = parseInt(count) + 1; // count++

		  }else if(type === 'minus' && count > 1)  { // 매개변수로 minus type 이 넘어오고 1보다 크다면
		    productCount.value = parseInt(count) - 1; // count--

		  }
		  else { // 그 외에는
			 productCount.value = parseInt(count); // 현상 유지
		  }
		  
	 }

     function removeItem(num){ // 상품 삭제용 함수

    	 $(".item"+ num +"").attr("hidden","true"); // itemX 다시 hidden
    	 $("#option_flower"+num+"").removeAttr("disabled"); // 해당 상품 다시 셀렉 가능하게

  		var index;
		for(var i = 0; i < items.length; i++) { // 해당 상품들의 인덱스가 담긴 배열을 돌면서
			if(items[i]==num){ // 해당 상품의 인덱스와 매개변수로 넘어온 num이 같다면
				index = i; // index에 i 저장
			}
		}  		
		items.splice(index, 1); // 배열에서 아까 선언한 인덱스에 있는 아이템 삭제
     }
     
     function submitForm() {
		if(items.length==0) { // 셀렉된 아이템이 없다면
			alert("장바구니에 넣으신 물건이 없습니다");
		}
		else {
	    	for(var i = 0; i < items.length; i++) { // 현재까지 남아있는 아이템 리스트 배열을 돌면서 필요한 name 속성 추가
	 				$(".item"+ items[i] + "").children("#userNo").attr("name","cartList[" + i + "].userNo")
	    			$(".item"+ items[i] + "").children("#productNo").attr("name","cartList[" + i + "].productNo")
	    			$(".item"+ items[i] + "").children("#productPrice"+items[i]+"").attr("name","cartList[" + i + "].productPrice")
	    			$(".item"+ items[i] + "").children("#productCount"+items[i]+"").attr("name","cartList[" + i + "].productCount")	
	 		}
	    	 $('#cartItems').attr("action", "insertCo.ca").submit();
		}
     }
     
     function showDetail() { // 상세정보 페이지 열기
    	 $('#reviewList').attr("hidden","true");
    	 $('#flowerDetailList').removeAttr("hidden");
     }
     
     function showReview() { // 리뷰 열기
    	 $('#reviewList').removeAttr("hidden");
    	 $('#flowerDetailList').attr("hidden","true");
    	 
    	 $('#combination_review').css("background-color","rgba(224, 224, 224, 0.29)");
         $('#combination_review').css("color","black");
         $('#combination_content').css("background-color","white");
         $('#combination_content').css("color","rgb(190, 190, 190)");
         
         var combinationreview;

         combinationreview = '<input type="button" id="btn_rv" value="구매평 작성" onclick="modalOn();">';
         combinationreview += ' <br><br>';
         combinationreview += ' <hr>';
         combinationreview += '<div class="reviewbb">';
         combinationreview += '<img class="img2" src="resources/images/flower1.jpg">';
         combinationreview += '<text class="text1">진짜 마음에 들어요</text>';
         combinationreview += '<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
         combinationreview += '</div>';
         $('#reviewList').append(combinationreview);
     }
 	</script>

	<jsp:include page="../../common/footer.jsp" />
</body>

</html>
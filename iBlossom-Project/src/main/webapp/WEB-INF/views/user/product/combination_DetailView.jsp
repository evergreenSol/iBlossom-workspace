<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="resources/css/jsa.css" rel="stylesheet">
 <style>
 	div, span, input, table {
 		border : 1px solid black;
 	}
 
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	#selectFlower {
		width : 420px;
	}
	
	#countBox1 input {
		text-aiign : center;
	}
 
 </style>
 
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
							<select id="select_flower" name="select_flower" onchange="selectFlower()">
									<option selected disabled style="text-align: center;">
										---------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										---------</option>
									<c:forEach var="p" items="${ list }" varStatus="status">
										<option id="option_flower${ status.count }" value="${ status.count }" style="text-align: center;">${ p.flowerName }</option>
									</c:forEach>
							</select>
						</td>
						<td class="pp" style="padding-top: 20px;">
							<b style="font-size: 25px;">조합형</b>
						</td>
					</tr>
					<tr>
						<td class="pp"><hr></td>
					</tr>
					<tr>
						<td class="pp">
							<b>내가 직접 고르고 선물해보세요~ </b>
							<br>
							감동이 2배 
							<br>
							<hr style="margin-bottom: 10px;">
						</td>
					</tr>
					<tr>
						<td>
						<form id="cartItems" method="post" action="">
							<div id="countBox1" align="center"> <!-- overflow : auto -->
								<c:forEach var="p" items="${ list }" varStatus="status">
								<div class="item${ status.count }" hidden>
								<div onclick="removeItem(${ status.count })" id="removeItem"><img src="resources/images/x.png" style="width: 15px; float:right"></div>
								<input type="hidden" id="index" value=${ status.count }>
								<input type="hidden" id="userNo" value="${ loginUser.userNo }">
								<input type="hidden" id="productNo" value="${ p.productNo }">
								${ p.flowerName }
								<input type="button" value="-" onclick="count('minus',${ status.count })">
								<input type="number" id="productCount${ status.count }" value="1">
								<input type="button" value="+" onclick="count('plus',${ status.count })">
								<input type="hidden" id="productPrice${ status.count }" value="${ p.price }">
								</div>
								</c:forEach>		
							</div> 
						</form>
							<br>
							<div style="margin-left: 20px">
								배송비: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								3,000 원<br>
								<br> 총 주문금액 : &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
									style="border: none; font-weight: 700; font-size: 15px; background-color: rgba(224, 224, 224, 0.001); padding-left: 60px; width: 50px;"
									name="sum" size="11" id="sum" readonly value="">&nbsp;&nbsp;원
							</div>
						</td>
					</tr>

					<tr>
						<td>
							<br>
							<br>
							<c:choose>
								<c:when test="${ loginUser eq null }">
									<input value="장바구니" id="btn1" onclick="alert('로그인이 필요한 서비스 입니다!'); location.href='loginForm.me';">
								</c:when>
								<c:otherwise>
									<input value="장바구니" id="btn1" onclick="submitForm();">
								</c:otherwise>
							</c:choose> 
						</td>
					</tr>

				</table>


			<!--상세 정보 버튼 시작-->
			<div class="categorize review-box"
				style="height: 100px; margin-top: 30px;">
				<div class="reviewBox" id="combination_content" onclick="showList();">상세정보</div>
				<div class="reviewBox" id="combination_review" onclick="test4();">리뷰</div>
			</div>

			<!-- 상세정보 폼-->

			<div id="flowerDetailList" >
				<c:forEach var="p" items="${ list }">
				<table>
					<tr>
						<td width="100px" height="150px">
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

    <!-- 리뷰 작성폼-->

			<div>
			
			</div>
			
			
			<script>
/*            $('#combination_review').css("background-color", "rgba(224, 224, 224, 0.29)");
            $('#combination_review').css("color", "black");
            $('#combination_content').css("background-color", "white");
            $('#combination_content').css("color", "rgb(190, 190, 190)");
            var combinationreview;
            $('#combinationPhoto').children().remove();

            combinationreview = '<input type="button" id="btn_rv" value="구매평 작성" onclick="modalOn();">';
            combinationreview += ' <br><br>';
            combinationreview += ' <hr>';
            combinationreview += '<div class="reviewbb">';
            combinationreview += '<img class="img2" src="resources/images/flower1.jpg">';
            combinationreview += '<text class="text1">진짜 마음에 들어요</text>';
            combinationreview += '<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
            combinationreview += '</div>'; */
			</script>
			
		</div>

	<script>
	// 빈 배열 만들기
	var items = [];
	
	// 특정 상품이 셀렉 되면
	function selectFlower() {
		var selectFlower = $("#select_flower").val(); // 해당 상품의 인덱스 가져오기
		$(".item"+ selectFlower +"").removeAttr("hidden"); // class="item + 해당 인덱스" 인 div hidden 제거 
		
		// var index = $(".item"+ selectFlower +"").children("#index").val(); // index
		items.push(selectFlower);
		console.log(items);
		$("#option_flower"+selectFlower+"").attr("disabled", "true");
		
	}
	
	function count(type,index)  {
		  
		  const productCount = document.getElementById('productCount'+index+'');
		  
		  // 현재 화면에 표시된 값
		  let count = productCount.value;
		  
		  // 더하기/빼기
		  if(type === 'plus') {
		    productCount.value = parseInt(count) + 1;

		  }else if(type === 'minus' && count > 1)  {
		    productCount.value = parseInt(count) - 1;

		  }
		  else {
			 productCount.value = parseInt(count);
		  }
		  
	 }

     function removeItem(num){

    	 $(".item"+ num +"").attr("hidden","true");
    	 $("#option_flower"+num+"").removeAttr("disabled");

  		var index;
		for(var i = 0; i < items.length; i++) {
			if(items[i]==num){
				index = i;
				console.log(index);
			}
		}  		
		items.splice(index, 1);
     }
     
     function submitForm() {
		if(items.length==0) {
			alert("장바구니에 넣으신 물건이 없습니다");
			location.href="combinationDetailList.pr"
		}
		else {
	    	for(var i = 0; i < items.length; i++) {
	 				$(".item"+ items[i] + "").children("#userNo").attr("name","cartList[" + i + "].userNo")
	    			$(".item"+ items[i] + "").children("#productNo").attr("name","cartList[" + i + "].productNo")
	    			$(".item"+ items[i] + "").children("#productPrice"+items[i]+"").attr("name","cartList[" + i + "].productPrice")
	    			$(".item"+ items[i] + "").children("#productCount"+items[i]+"").attr("name","cartList[" + i + "].productCount")	
	 		}
	    	 $('#cartItems').attr("action", "insertCo.ca").submit();
		}
     }
 	</script>
    
    <jsp:include page="../../common/footer.jsp" />
</body>

</html>
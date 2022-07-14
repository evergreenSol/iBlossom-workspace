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
</head>
<body>

<jsp:include page="../../common/header.jsp" />
	<br>
	<br>
	<br>

	<div id="wrap_detail1">
		<div style="width: 1000px; margin: auto;">
			<form name="form" method="get" action="insertCo.ca">
				<input type="hidden" name="productNo" value="${ p.productNo }">
				<table>
					<tr class="tr1" valign="top">
						<td rowspan="6"><img src="resources/images/flower3.PNG">
							<select id="select_flower" name="select_flower" onchange="selectFlower()">
									<option selected disabled style="text-align: center;">
										---------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										---------</option>
									<c:forEach var="p" items="${ list }" varStatus="status">
										<option id="option_flower" value="${ status.count }">${ p.flowerName }</option>
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
							<div id="countBox1" align="center">
								<input type="hidden" id="listLength" value="${ fn:length(list) }">
								<c:forEach var="p" items="${ list }" varStatus="status">
								<div class="item${ status.count }" hidden>
								<div onclick="removeItem()" id="removeItem"><img src="resources/images/x.png" style="width: 15px; float:right"></div>
								<input type="text" name="index" id="index" value=${ status.count }>
								<input type="text" name="productNo" id="productNo" value="${ p.productNo }">
								<input type="text" name="flowerName" id="flowerName" value="${ p.flowerName }">
								<input type="button" value="-" onclick="count('minus',${ status.count })">
								<div id="productCount${ status.count }">1</div>
								<input type="button" value="+" onclick="count('plus',${ status.count })">
								<input type="text" id="price" name="price" value="${ p.price }">
								</div>
								</c:forEach>
							</div> 
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
									name="sum" size="11" id="sum" readonly value="0">&nbsp;&nbsp;원
							</div>
							<!-- </form> -->
						</td>
					</tr>

					<tr>

						<td><br>
						<br> <input value="장바구니" id="btn1" onclick="getObject();"></td>

					</tr>

				</table>
			</form>

			<!--상세 정보 버튼 시작-->
			<div class="categorize review-box"
				style="height: 100px; margin-top: 30px;">
				<div class="reviewBox" id="combination_content" onclick="showList();">상세정보</div>
				<div class="reviewBox" id="combination_review" onclick="test4();">리뷰</div>
			</div>

			<!-- 상세정보 폼-->

			<div id="cobinationContent">
				<c:forEach var="p" items="${ list }">
				<div id="combinationPhoto" style="overflow: hidden;">
					<img src="${ p.thumbNail }">
				</div>
				</c:forEach>
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



	</div>
	
	<script>
	var items = [];
	var itemArr = [];
	
	function selectFlower() {
		var selectFlower = $("#select_flower").val();
		$(".item"+ selectFlower +"").removeAttr("hidden");
		var index = $(".item"+ selectFlower +"").children("#index").val();
		items.push(index);
	}
	
	function count(type,index)  {
		  
		  const resultElement = document.getElementById('productCount'+index+'');
		  
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;
		  
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus' && number > 1)  {
		    number = parseInt(number) - 1;
		  }
		  else {
			  number = number;
		  }
		  
		  // 결과 출력
		  resultElement.innerText = number;
		
	 }

     function removeItem(){

     }
     
     function getObject() {
    	 for(var i = 0; i < items.length; i++) {
    		 var object = { 
    				 productNo : $(".item"+items[i]+"").children("#productNo").val(),
    				 productCount : $(".item"+items[i]+"").children("#productCount").text()
    		 }
    		 itemArr.push(object)
    	 }
    	 console.log(itemArr);
     }
 	</script>
    
    <jsp:include page="../../common/footer.jsp" />
</body>

</html>
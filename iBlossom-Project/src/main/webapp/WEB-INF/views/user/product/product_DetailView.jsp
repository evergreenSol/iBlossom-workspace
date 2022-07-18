<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/jsa.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico"
	type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico"
	type="image/x-icon">
<style>
#price:focus {
	outline: none;
}
</style>

</head>
<body onload="init();">
	<jsp:include page="../../common/header.jsp" />

	<br>
	<br>
	<br>

	<div id="wrap_detail">
		<div style="width: 1000px; margin: auto;">
			<br>


			<table>

				<tr>
					<td rowspan="6"><img src="${p.thumbNail }" width="500px"></td>
					<td class="pp"><b
						style="font-size: 25px; margin-bottom: -30px"><c:out
								value="${p.flowerName}">
							</c:out></b></td>

				</tr>

				<tr>
					<td class="pp"><input type="text" name="productPrice"
						id="price" style="border: none; font-size: 20px;" size="1"
						readonly value="${ p.price }">원

						<hr></td>
				</tr>
				<tr>
					<td class="pp" style="font-size: 15px; font-weight: 700px;">"${p.flowerInfo}"
						<br> <br>
						<hr style="margin-bottom: 10px;">
					</td>
				</tr>
				<tr>
					<td class="pp">
						<!-- <p>수령일 : <input type="text" class="datepicker" id="datepicker"></p>
 -->

						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div id="countBox">
							<div id="countWrite">
								<form name="form" method="post" action="insert.ca" id="cartInfo">
									<input type="hidden" name="productNo" value="${ p.productNo }">
									<input type="hidden" name="userNo"
										value="${ loginUser.userNo }"> <input type="text"
										value="${p.flowerName }"
										style="border: none; padding-left: 10px; outline: none; padding-top: 5px;"><br>
									<br> <input type=hidden id="sell_price"
										value="${ p.price }"> <input type="button" value=" - "
										onclick="del();" style="margin-left: 10px;" class="detailBtn">
									<input type="text" name="amount" value="1" size="1"
										disabled="disabled"
										style="background-color: white; border: 1px solid gray; height: 20px; text-align: center"
										onchange="change();"> <input type="button" value=" + "
										onclick="add();" class="detailBtn"><br> <br>
									<br> 배송비: <span style="padding-left: 200px"> 3,000
										원</span><br> <br> 총 주문금액 : <input type="text"
										style="border: none; outline: none; background-color: rgba(224, 224, 224, 0.001); padding-left: 150px; width: 60px;"
										name="sum" size="11" readonly>원
								</form>

							</div>


						</div>

					</td>

				</tr>

				<tr>
					<c:choose>
						<c:when test="${empty loginUser}">
							<td>
								<button
									onclick="alert('로그인이 필요한 서비스!'); location.href='loginForm.me';"
									id="btn1">장바구니</button>
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<button onclick="cartbtn" id="btn1">장바구니</button> <!-- <input type="submit" value="장바구니" id="btn1"> -->
							</td>
						</c:otherwise>
					</c:choose>

				</tr>

			</table>
			</form>
			<!--상세 정보 버튼 시작-->
			<div class="categorize review-box"
				style="height: 100px; margin-top: 30px;">
				<div class="reviewBox" id="detail_content" onclick="test();">상세정보</div>
				<div class="reviewBox" id="detail_review" onclick="test1();">리뷰</div>
			</div>

			<!-- 상세정보 폼-->

			<div id="detailContent">


				<br>


			</div>

			<!-- 리뷰 폼 -->
			<div>
				<input type='button' id='btn_rv' value='구매평 작성' class="insertReview">
				<div id="detailReview"></div>
			</div>


		</div>
	</div>
	<script>
		function cartbtn(){
			$('#cartInfo').submit();
		}
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
		integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- 수량 올릴 시 가격 변동-->
	<script>
        var sell_price;
        var amount;

        function init() {
            sell_price = document.form.sell_price.value;
            amount = document.form.amount.value;
            document.form.sum.value = sell_price;
            change();
        }

        function add() {
            hm = document.form.amount;
            sum = document.form.sum;
            if(hm.value < 15){
           	 hm.value++;
           	sum.value = (parseInt(hm.value) * sell_price) + 3000;
            }else{
            	 alert("개당 최대 15개까지 구매 가능합니다.");
            }
            
        }

        function del() {
            hm = document.form.amount;
            sum = document.form.sum;
            if (hm.value > 1) {
                hm.value--;
                sum.value = parseInt(hm.value) * sell_price + 3000;
            }
        }

        function change() {
            hm = document.form.amount;
            sum = document.form.sum;

            if (hm.value < 0) {
                hm.value = 0;
            }
            sum.value = parseInt(hm.value) * sell_price + 3000;
        }  
    </script>
	<!-- <script>
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '<',
            nextText: '>',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년',
            minDate: "+1D", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            maxDate: "+1M"
        });

        $(function () {
            $('.datepicker').datepicker();
        });
    </script> -->

	<script>
        $(document).ready(function(){
            test();
        });
    </script>

	<script>
 
        function test(){

            $('#detail_content').css("background-color","rgba(224, 224, 224, 0.29)");
          $('#detail_content').css("color","black");
          $('#detail_review').css("background-color","white");
          $('#detail_review').css("color","rgb(190, 190, 190)");
          $('#detailReview').children().remove();
          $('#btn_rv').css("display","none");

            var html;
         
          html = '<img src="'+'${p.contentPhoto}'+'" style="width:970px;">';
          html += '<div id="exchange_info" style="height: 1000px;">';
          html +=  '<b>유의사항</b>';
          html +=     '<div>';
          html +=          '<table>';
          html +=                '<tr>';
          html +=                    '<td>상품정보</td>';
          html +=                       '<td>꽃을 더 오래 보실 수 있도록 일부 꽃은 꽃봉오리 상태로 보내드립니다꽃 시장 수급 상황에 따라 일부 구성이 공지없이 변경될 수 있습니다.<br>';
          html +=                      '<text style="font-weight:50; font-size:20px;">';
          html +=                           '(구성된 꽃의 수급이 일시적으로 불가하여 대체되거나 수급된 꽃의 검수 과정에서 대체되는 상황 발생 시 기존 단가에서 크게 벗어나지 않는 범위를 철저히 고려하여 대체해드리도록 노력하겠습니다.)<br>';
          html +=                       '</text>';
          html +=                  '꽃은 가능한 꽃의 키를 비슷하게 맞춰 보내드립니다. 모니터 사양과 해상도에 따라 색상의 차이가 있을 수 있습니다.';
          html +=               '<br>';
          html +=              '</td>';
          html +=             '</tr>';
          html +=           '</table>';
          html +=    '</div>';
          html +=    '<br><br><br>';
          html +=    '<b>교환 및 환불 정보</b>';
          html +=    '<div>';
          html +=    '<table>';
          html +=    '<tr>';
          html +=    '<td>교환/반품 회수</td>';
          html +=    '<td>';
          html +=    '생화 특성상 변심으로 인한 반품은 불가함 <br>주문후 수작업으로 만들어지는 제품으로주문 확정 후에는 주문취소 불가함<br>홈페이지 1대 1 문의에 남겨주세요';
          html +=    '</td>';
          html +=    '</tr>';
          html +=    '<tr>';
          html +=    '<td>중도해지</td>';
          html +=    '<td>';
          html +=    '중도해지시에서는 총 결제금액에서 <br>';
          html +=    '</td>';
          html +=    '</tr>';
          html +=    '</table>';
          html +=    '</div>';
          
          $('#detailContent').append(html);
        }
    </script>




	<script>
        function test1(){

          $('#detail_review').css("background-color","rgba(224, 224, 224, 0.29)");
          $('#detail_review').css("color","black");
          $('#detail_content').css("background-color","white");
          $('#detail_content').css("color","rgb(190, 190, 190)");
          $('#detailContent').children().remove();
          $('#btn_rv').css("display","block");
          
          
          $.ajax({
        	  url: "reviewList.re",
        	  data : {productNo : ${ p.productNo }},
        	  success : function(result){
        		  
        		  console.log(result);
        		  var review = "";
        		  
        		  
        		  for(var i in result){
        			  
                      review += "<br><br>";
                      review += "<hr>";
                      review += "<div class='reviewbb'>";
                      review += "<input type='hidden' value="+ result[i].reviewNo +">"
                      review +="<div class='divBox'>"
                      review += "<img class='img1' src='" + result[i].reviewPhoto + "' style='width: 190px; height:190px;  margin-left: 20px;margin-top: 10px; float: left;'>";
                      review += "<p class='text3'>" + result[i].userId + "</p>";
                      review += "<p class='text4'>" + result[i].createDate + "</p>";
                      review += "<p class='text1'>" + result[i].reviewTitle + "</p>";
                      review += "<p class='text2'>" + result[i].reviewContent + "</p>";
                      review += "</div>";
                      review += "</div>";
        		  }
        		  review += "<br><br><br><br><br>";
        		  
        		  $("#detailReview").html(review);
        	  },
        	  error:function(){
        		  console.log("에러발생");
        	  }
         		
        	 
          });
        }
    </script>




	<div id="modal" class="modal-overlay">
		<div class="modal-window" style="height: 550px">
			<form action="insert.re" method="post" enctype="multipart/form-data">



				<div class="title">
					<br> <span
						style="font-size: 20px; margin-top: 10px; margin-left: 10px">
						구매평 작성</span>
				</div>
				<div class="close-area">
					<img src="resources/images/x.png" style="width: 15px;">
				</div>

				<div class="content">
					<hr>

					<div
						style="height: 50px; border: 1px solid gainsboro; margin-top: 40px; text-align: center;">
						<p>${p.flowerName}</p>
					</div>
					<br>
					<div>
						<input type="text" name="reviewTitle"
							style="width: 370px; height: 30px; border: 1px solid gainsboro;"
							placeholder="제목을 작성해주세요.">
					</div>
					<br>
					<textarea rows="2" cols="10" onkeyup="counter(this,150)"
						name="reviewContent"
						placeholder="꽃 파손이나 배송등 문제사항은 구매평에 남겨주시면 확인이 어렵습니다."></textarea>
					<div style="text-align: right;">
						<span id="reCount">0 / 150</span>
					</div>

					<br> <br> <input type="file" name="upReviewPhoto">
					<input type="hidden" name="productNo" value="${ p.productNo }">
					<input type="hidden" name="userNo" value="${loginUser.userNo}">
			
		</div>
		<div class="modal-button-area" align="center">
			<c:choose>
				<c:when test="${empty loginUser}">
					<button type="reset"
						onclick="alert('로그인이 필요한 서비스!'); location.href='loginForm.me';"
						id="sign">등록</button>
				</c:when>
				<c:otherwise>
					<!--<button onclick="modalOff()">취소</button>-->
					<button type="submit" id="sign">등록</button>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
	</div>

	</div>

	<script>
            function counter(text,length){
                var limit = length;
                var str = text.value.length;
                if(str>limit){
                    alert("최대 150자까지 입력 가능합니다.");
                    text.value = text.value.substring(0,limit);
                    text.focus();
                }
                document.getElementById("reCount").innerHTML = text.value.length + " / " + limit;
            }
        </script>
	<script>
    const btnModal = document.querySelector('.insertReview');
	
    function modalOn() {
    modal.style.display = "flex"
    }
    function isModalOn() {
        return modal.style.display === "flex"
    }
    function modalOff() {
        modal.style.display = "none"
    }
    
    btnModal.addEventListener("click", e => {
        modal.style.display = "flex"
    })

    const closeBtn = modal.querySelector(".close-area")
    closeBtn.addEventListener("click", e => {
        modal.style.display = "none"
    })
    
</script>

	<jsp:include page="../../common/footer.jsp" />
</body>
</html>
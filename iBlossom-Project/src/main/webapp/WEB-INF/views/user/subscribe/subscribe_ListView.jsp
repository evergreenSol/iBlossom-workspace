<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Subscription</title>
<link href="resources/css/kdh.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
    
    <div class="wrap">
        <!-- 사진 영역 -->
        <div align="center" class="banner">
	       <span class="banner_title">SUBSCRIBE</span>
	    </div>
        <!-- 이용 안내 영역 -->
        <div class="info">
	        <br>
	        <h1 style="text-align: center; ">이용안내</h1>
	        <br>
	            <table class="info_table">
	                <tr>
	                    <td height="150px" width="250px"><img src="resources/images/step1.png" id="info_img"></td>
	                    <td width="200/3px"></td>
	                    <td width="250px"><img src="resources/images/step2.png" id="info_img"></td>
	                    <td width="200/3px"></td>
	                    <td width="250px"><img src="resources/images/step3.png" id="info_img"></td>
	                    <td width="200/px%"></td>
	                    <td width="250px"><img src="resources/images/step4.png" id="info_img"></td>
	                </tr>
	                <tr> <!-- 글씨체 변경 -->
	                    <td><b>STEP1.</b><br> 구독할 꽃다발을<br> 선택해주세요.</td>
	                    <td></td>
	                    <td><b>STEP2.</b><br> 구독기간을<br> 선택해주세요.</td>
	                    <td></td>
	                    <td><b>STEP3.</b><br> 첫 결제를 완료하고<br> 구독을 등록해주세요.</td>
	                    <td></td>
	                    <td><b>STEP4.</b><br> 고르신 꽃다발을<br> 받아보세요!</td>
	                </tr>
	            </table>
        </div>
        
        <hr style="width:1200px; margin-bottom : 30px; border-width: 1px 0px 0px 0px;" >
        
		<div class="subscription">
		
	        <!-- 구독 상품 목록 -->
	        <div class="sub_list">
	            <br>
	            <h1 style="text-align: center; margin-bottom : 50px;">정기구독</h1>
	
	            <h2 style="text-align: center;">STEP1. 구독할 꽃다발을 선택해주세요.</h2>
	            
	            <!-- 구독 상품 전체 리스트 조회-->
	            <br>
	            <a style="float:right;" href="listView.sp">구독 상품 목록 수정</a>
	            <br>
            

	            <!-- SUB_PRODUCT 테이블로부터 읽어오기-->
	            <table class="sub_list_table"> 
	                <c:forEach var="sp" items="${ list }">    
		                <tr class="sub_list_product">
		                	<td class="spno">${ sp.subProductNo }</td>
		                    <td height="250px" width="250px" class="sub_list_img" id="sub_list_img">
		                    	<img src="${ sp.subChangeName }" id="list_img">
		                    </td>
		                    <td id="subproduct_name" style="margin-top:30px;">${ sp.subProductName }</td>
		                    <td id="subproduct_description">${ sp.subProductDescription }</td>
		                </tr>
	                </c:forEach>
	            </table>
	            <br><br>
	        </div>


	        
	        <!-- 구독 기간 설정 -->
	        <div class="sub_period" hidden>
	            <h2 style="text-align: center; margin-top : 120px; margin-bottom : 60px;">STEP2. 구독기간을 선택해주세요.</h2>
	

	            <table class="sub_period_table">
	                <tr>
	                    <td rowspan="6" width="360px;" height="400;"><img id="period_img"></td>
	                    <td colspan="2" height="50"><br><br>첫 수령일을 선택하세요.<br>
	                        <input type="text" class="datepicker" id="datepicker" name="deliverAt" required>
	                    </td>
	                </tr>
	
	                <tr>

	                    <td colspan="2" height="50"><br><br>구독기간을 선택해주세요.</td>
	                </tr>
	                <tr>
	                    <td height="90px" width="250px"><button class="sub_level" value="1">정기결제</button></td>
	                    <td height="90px" width="250px"><button class="sub_level" value="6">6개월</button></td>
	                </tr>
	                <tr>
	                    <td height="90px"><button class="sub_level" value="3">3개월</button></td>
	                    <td height="90px"><button class="sub_level" value="12">12개월</button></td>
	                </tr>
	                <tr>
	                    <td><input type="hidden" id="spno"></td>
	                    <td id="totalPriceHidden"></td>
	                </tr>
	
	            </table>
	        </div>
	        <br><br>
	

	        <!-- hidden 으로 숨겼다가 정기구독 상품 수령일+구독일 선택시 hidden 제거 -->

	        <!-- SUBSCRIBE 테이블로부터 읽어오기-->
	        <!-- 구독한 상품 정보 -->
	        <div class="sub_product" hidden>
	            <h2 style="text-align: center; margin-top : 100px;">내가 고른 상품 정보</h2>

	            <table class="sub_product_table">
	                <tr>
	                    <td height="500px" width="500px" colspan="2" style="border-bottom:2px solid black">
	                    	<img src="resources/images/test.png" id="product_img">
	                    </td>
	                </tr>
	                <tr>
	                    <th height="50px" width="250px">구독상품</th>
	                    <td width="250px" id="subProductName"></td>
	                </tr>
	                <tr>
	                    <th height="50px">첫수령일</th>
	                    <td id="deliverAt"></td>
	                </tr>
	                <tr>
	                    <th height="50px">구독기간</th>
	                    <td id="subLevel"></td>
	                </tr>
	                <tr>
	                    <th height="50px">구독 상품 금액</th>
	                    <td id="totalPrice"></td>
	                </tr>
	                <tr>
	                    <td height="50px"><button onclick="location.href='listView.su'">이전</button></td>
	                    <c:choose>
	                    	<c:when test="${ empty loginUser }"> <!-- 로그인 안했으면 -->
		                    	<td height="50px"><button onclick="alert('로그인이 필요한 서비스입니다!'); location.href='loginForm.me';">결제</button></td>
		                    </c:when>
		                    <c:otherwise> <!-- 로그인 했으면 -->
		                    	<td height="50px"><button onclick="pay();">결제</button></td>
		                    </c:otherwise>
	                    </c:choose>
	                </tr>
	            </table>
	        </div>   
	        <br><br><br>
			<form id="payInfo" method="post" action="orderView.su">
           		<input type="hidden" name="spno" id="spno">
           		<input type="hidden" name="subLevel" id="subLevel">
           		<input type="hidden" name="deliverAt" id="deliverAt">
           	</form>
	        
	    </div>
    </div>

<!-- datepicker CDN -->    
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
 
	<script>
	var subPrice = 0;

	$('.sub_list_product').click(function() { // 정기구독 상품 클릭 시
		$('#sub_list_img').css("border","2px solid rgb(243,243,243)"); // 테두리가 핑크였던 상품이 있다면
		var spno = $(this).children(".spno").text(); // 클릭된 상품 subProductNo 가져오기
        showSubPeriod(spno); // showSubPeriod 호출
		$(this).children('#sub_list_img').css("border","1px solid rgb(255,35,147)")  // 이미지에 핑크색 테두리 추가
	});
	
	// 정기구독 기간 설정 창 히든 제거
	function showSubPeriod(spno) {
		
		// 넘겨 받은 subProductNo으로 해당 상품 객체 읽어오기
		$.ajax({
			url : "getSubProduct.su",
			type : "post",
			data : { spno : spno },
			success : function(response) { // 객체 가져오기 성공시
				$('.sub_period').removeAttr("hidden"); // 정기구독 기간 설정 창 히든 제거
				$('#period_img').attr('src', response.subChangeName); // 해당 상품 이미지 화면으로 보내주기
				$('#product_img').attr('src', response.subChangeName); // 아래 선택 상품에도 미리
				$('#subProductName').html(response.subProductName) // 해당 상품 이름 
				$('#totalPrice').html("매월	" + (response.subPrice) + "원 씩") // 해당 상품 가격
				$('#spno').attr('value', spno); // 상품 번호 (form 안에 있는 input)
				$('#payInfo>#spno').attr('value', spno); // 상품 번호 (form 안에 있는 input)
			},
			error : function() {
				console.log("ajax 통신 실패");
			}
		});
	}
	
	// 구독 개월 수 클릭 시
	$('.sub_level').click(function() {
		
		if($('#datepicker').val().length > 1) { // 수령일을 선택하고 구독 개월수를 클릭하면
			$('.sub_level').css("border","2px solid rgb(243,243,243)") // 핑크였던 애가 있다면 회색 테두리로
			$(this).css("border","2px solid rgb(255,35,147)") // 선택된 애만 핑크색 테두리
			$('.sub_product').removeAttr("hidden")
			var spno = $('#spno').val(); // 상품 번호 저장
			var deliverAt = $('#datepicker').val(); // 수령 날짜 저장
			var subLevel = $(this).val(); // 구독기간 저장
			selectSubProduct(spno, deliverAt, subLevel); // selectSubProduct 호출
		}
		else { // 구독 개월을 선택했으나 수령일을 아직 선택하지 않았다면
			alert("첫 수령일을 먼저 선택해주세요");
		}
		
	});

	// 구독 개월수 클릭 시 해당 구독상품 번호를 가진 구독 상품 객체 불러오기
	function selectSubProduct(spno, deliverAt, subLevel) {
		
		$.ajax({
			url : "getSubProduct.su",
			type : "post",
			data : { spno : spno },
			success : function(response) {
				$('#deliverAt').html(deliverAt)
				if(subLevel!=1){
					$('#subLevel').html(subLevel + "개월")
					$('#payInfo>#subLevel').attr('value', subLevel);
					$('#payInfo>#deliverAt').attr('value', deliverAt);
				}
				else {
					$('#subLevel').html("정기구독")
					$('#payInfo>#subLevel').attr('value', subLevel);
					$('#payInfo>#deliverAt').attr('value', deliverAt);
				}
			},
			error : function() {
				console.log("ajax 통신 실패");
			}
		});
	}
	
	// 지금까지 유저가 입력한 정보 모아서 결제페이지로 보내주기
	function pay() {
		$('#payInfo').submit();
	}
	
	// datepicker 용 jQuery
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
	</script>
    
    <jsp:include page="../../common/footer.jsp" />
</body>
</html>
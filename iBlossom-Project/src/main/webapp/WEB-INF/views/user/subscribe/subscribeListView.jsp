<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>subscribeListView</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>
<link href="resources/css/kdh.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
    
    <div class="wrap">
        <!-- 사진 영역 -->
        <div class="banner">
            <span class="banner_title">정기구독</span>
        </div>


        <!-- 이용 안내 -->
        <div class="info">
        <br>
        <h1>이용안내</h1>
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
                    <td>STEP1.<br> 구독할 꽃다발을 선택해주세요</td>
                    <td></td>
                    <td>STEP2.<br> 구독기간을 선택해주세요</td>
                    <td></td>
                    <td>STEP3.<br> 첫 결제를 완료하고 구독을 등록해주세요</td>
                    <td></td>
                    <td>STEP4.<br> 고르신 꽃다발을 받아보세요!</td>
                </tr>
            </table>
        </div>
		<div class="subscription">
	        <!-- 구독 상품 목록 -->
	        <div class="sub_list">
	            <br>
	            <h1>정기구독</h1>
	
	            <h2>STEP1. 구독할 꽃다발을 선택해주세요</h2>
	            
	            <!-- 구독 상품 전체 리스트 조회-->

	            <br>
	            <a style="float:right;" href="updateForm.su">구독 상품 목록 수정</a>
	            <br>
            

	            <!-- tr 마다 따로 c:forEach 로 -->
	            <table class="sub_list_table"> 
	                <c:forEach var="sp" items="${ list }"> <!-- SUB_PRODUCT 테이블로부터 읽어오기-->   
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
	            <h2>STEP2. 구독기간을 선택해주세요</h2>
	

	            <table class="sub_period_table">
	                <tr>
	                    <td rowspan="6" width="360px;" height="400;"><img src="resources/images/test.png" id="period_img"></td>
	                    <td colspan="2" height="50"><br><br>첫 수령일을 선택하세요.<br>
	                        <input type="text" class="datepicker" id="datepicker" name="deliverAt" required>
	                    </td>
	                </tr>
	
	                <tr>

	                    <td colspan="2" height="50"><br><br>구독기간을 선택해주세요.</td>
	                </tr>
	                <tr>
	                    <td height="90px" width="250px"><button class="sub_level" name="1">정기결제</button></td>
	                    <td height="90px" width="250px"><button class="sub_level" name="6">6개월</button></td>
	                </tr>
	                <tr>
	                    <td height="90px"><button class="sub_level" name="3">3개월</button></td>
	                    <td height="90px"><button class="sub_level" name="12">12개월</button></td>

	                </tr>
	                <tr>
	                    <td colspan="2"></td>
	                </tr>
	
	            </table>
	        </div>
	        <br><br>
	

	        <!-- hidden 으로 숨겼다가 정기구독 상품 수령일+구독일 선택시 hidden 제거 -->

	        <!-- SUBSCRIBE 테이블로부터 읽어오기-->
	        <!-- 구독한 상품 정보 -->
	        <div class="sub_product" hidden>
	            <h2>내가 고른 상품 정보</h2>

	            <table class="sub_product_table">
	                <tr>
	                    <td height="500px" width="500px" colspan="2" style="border-bottom:2px solid black">
	                    	<img src="resources/images/test.png" id="product_img">
	                    </td>
	                </tr>
	                <tr>
	                    <th height="50px">구독상품</th>
	                    <td>구독상품<!--${ s.subProductNo }--></td>
	                </tr>
	                <tr>
	                    <th height="50px">첫수령일</th>
	                    <td>첫 수령일<!--${ s.deliverAt }--></td>
	                </tr>
	                <tr>
	                    <th height="50px">구독기간</th>
	                    <td>구독기간<!--${ s.subLevel }개월--></td>
	                </tr>
	                <tr>
	                    <th height="50px">구독 상품 금액</th>
	                    <td>구독 상품금액<!--${ s.subPrice * s.subLevel }--></td>
	                </tr>
	                <tr>
	                    <td height="50px"><button onclick="location.reload();">이전</button></td>
	                    <td height="50px"><button onclick="">결제</button></td>
	                </tr>
	            </table>
	        </div>   
	        <br><br><br>
	        
	    </div>
    </div>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
 
	<script>
	// 정기구독 상품 클릭 시
	$('.sub_list_product').click(function() {
		$('.sub_list_img').css("border","1px solid rgb(243,243,243)")
		var spno = $(this).children(".spno").text();
        showSubPeriod(spno);
		$(this).children('#sub_list_img').css("border","1px solid rgb(255,35,147)")
	});
	
	function showSubPeriod(spno) {
		$.ajax({
			url : "getSubProduct.su",
			type : "post",
			data : { spno : spno },
			success : function(response) {
				$('.sub_period').removeAttr("hidden")
				$('#period_img').attr('src', response.subChangeName);
				$('#product_img').attr('src', response.subChangeName);
			},
			error : function() {
				console.log("ajax 통신 실패");
			}
		});
	}
	
	// 구독 개월 수 클릭 시
	$('.sub_level').click(function() {
		
		if($('#datepicker').val().length > 1) {
			$('.sub_level').css("border","1px solid lightgrey")
			$(this).css("border","2px solid rgb(255,35,147)")
			$('.sub_product').removeAttr("hidden")
		}
		else {
			alert("첫 수령일을 먼저 선택해주세요");
		}
		
	});

	// datepicker 용 jQuery
	$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
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
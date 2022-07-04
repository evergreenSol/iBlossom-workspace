<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SubscribeListView</title>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="resources/css/kdh.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../common/header.jsp" />
    
    <div class="wrap">
        <!-- 사진 영역 -->
        <div class="banner">
            <span class="banner_title">정기구독</span>
        </div>


        <!-- 이용 안내 -->
        <div class="info">
            <table class="info">
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
                    <td>STEP1. 구독할 꽃다발을 선택해주세요</td>
                    <td></td>
                    <td>STEP2. 구독기간을 선택해주세요</td>
                    <td></td>
                    <td>STEP3. 첫 결제를 완료하고 구독을 등록해주세요</td>
                    <td></td>
                    <td>STEP4. 고르신 꽃다발을 받아보세요!</td>
                </tr>
            </table>
        </div>
		<div class="subscription">
	        <!-- 구독 상품 목록 -->
	        <div class="sub_list">
	            <br>
	            <h1>정기구독</h1>
	
	            <h3>STEP1. 구독할 꽃다발을 선택해주세요</h3>
	            
	            <!-- 구독 상품 전체 리스트 조회-->

	            <br>
	            <a style="float:right;" href="updateForm.su">구독 상품 목록 수정</a>
	            <br>
            

	            <!-- tr 마다 따로 c:forEach 로 -->
	            <table class="sub_list"> 
	               <!-- <c:forEach var="s" items="${ list }">--> <!-- SUB_PRODUCT 테이블로부터 읽어오기-->   
	                <!-- </c:forEach>-->
	                <tr id="sub_list_product">

	                    <td height="250px" width="250px" id="sub_list_img"><img src="resources/images/test.png" id="list_img"></td><!--<img src="${ s.subChangeName }"-->
	                    <td id="subproduct_name"><br><br>정기구독 상품명<!-- ${ s.subProductName }--></td>

	                </tr>
	            </table>
	            <br><br>
	        </div>


	        
	        <!-- 구독 기간 설정 -->
	        <div class="sub_period" hidden>
	            <h3>STEP2. 구독기간을 선택해주세요</h3>
	

	            <table class="sub_period">
	                <tr>
	                    <td rowspan="6" width="360px;" height="400;"><img src="resources/images/test.png" id="period_img"></td>
	                    <td colspan="2" height="50"><br><br>첫 수령일을 선택하세요.<br>

	                        <input type="text" class="datepicker" id="datepicker" required>
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
	            <h3>내가 고른 상품 정보</h3>

	            <table class="sub_product">
	                <tr>
	                    <td height="500px" width="500px" colspan="2"><img src="resources/images/test.png" id="product_img"></td>
	                </tr>
	                <tr>
	                    <th height="50px" style="border-top:2px solid black">구독상품</th>
	                    <td style="border-top:2px solid black">구독상품<!--${ s.subProductNo }--></td>
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
	                    <td height="50px"><button onclick="">이전</button></td>
	                    <td height="50px"><button onclick="">결제</button></td>
	                </tr>
	            </table>
	        </div>   
	        <br><br><br>
	        
	    </div>
    </div>
    
 
	<script>
	// 정기구독 상품 클릭 시
	$('#sub_list_product').click(function() {

        $('#sub_list_img').css("border","2px solid rgb(255,35,147)")
		$('.sub_period').removeAttr("hidden")
	});
	
	// 구독 개월 수 클릭 시
	$('.sub_level').click(function() {
		$('.sub_level').css("border","1px solid lightgrey")
		$(this).css("border","2px solid rgb(255,35,147)")
		$('.sub_product').removeAttr("hidden")
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
	  yearSuffix: '년'
	});
		
	$(function () {
	  $('.datepicker').datepicker();
	});
	
	
		
		
	</script>
    
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
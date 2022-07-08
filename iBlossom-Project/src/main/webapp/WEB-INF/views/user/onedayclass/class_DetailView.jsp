<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="resources/css/kms.css" rel="stylesheet">
    <title>Document</title>
    <style>

    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="class-container-wrap">
	    <div class="class-container">
	        <div id="image" style="float: left;">
	            <img src="resources/images/onedayclass_main.jpg" >
	        </div>
	        <div id="title1">
	            <p style="font-size: 25px; font-weight: 700;">원데이 클래스</p>
	            <p style="font-size: 20px; font-weight: 700;">60,000원 </p> <s>80,000원</s> <span id="sale" class="">Sale</span>
	            <hr width="550px">
	            <pre style="font-size: 17px;">
5인 이하 소수 정원 진행합니다.
그 계절 가장 예쁜 꽃을 만나 볼 수 있는 원데이 클래스 수업입니다.
가볍게 배워보실 수 있도록 핸드타이/바스켓/박스 등 여러 과목이 준비되어 있습니다.
	            </pre>
	        </div>
	        <form action="ResForm.cl" method="post">
	        <div>
	            <label for="date" id="res" style="font-size: 15px;">예약일</label><br>
	            	<select name="date" id="date" style="width:170px;height:25px;font-size: 14px;" required >
		                <option value="2022-07-22 14:00" selected>2022-07-22 14:00</option>
		                <option value="2022-07-30 14:00">2022-07-30 14:00</option>
		                <option value="2022-08-06 14:00">2022-08-06 14:00</option>
		            </select>
		        </div>
	        <br><br><br>
	        <div>
	            <button type="submit" id="class-res-btn">예약하기</button>
	        </div>
	        </form>
	    </div>
	    <br><br><br><br><br><br><br><br>
	    <div id="image2">
	        <img src="resources/images/onedayclass_detail-1.png" width="1200px">
	        <img src="resources/images/onedayclass_detail-2.png" width="1200px">
	    </div>     
     </div>
     <br><br>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    
    <script>
    /*
    	$(function() {
    		var classDate = $("#date option:selected").val();
    		$("#date").on("change", function () {
    			var classDate = $("#date option:selected").val();
    			console.log(classDate);
    		});
    		

    		console.log(classDate);
    		
    		function reserve() {
    			
    		}
    		
    		location.href='ResForm.cl'
    		
    	});
    */
    </script>
</body>
</html>
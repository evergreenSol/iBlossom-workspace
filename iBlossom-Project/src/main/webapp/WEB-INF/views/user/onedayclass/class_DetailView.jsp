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
	
    <div class="class-container">
        <div id="image" style="float: left;">
            <img src="resources/images/onedayclass_main.jpg" >
        </div>
        <div id="title1">
            <h1>원데이 클래스</h1>
            <h2>60,000원</h2> <s>80,000원</s> <span id="sale" class="">Sale</span>
            <hr width="550px">
            <pre style="font-size: 16px;">
5인 이하 소수 정원 진행합니다.
그 계절 가장 예쁜 꽃을 만나 볼 수 있는 원데이 클래스 수업입니다.
가볍게 배워보실 수 있도록 핸드타이/바스켓/박스 등 여러 과목이 준비되어 있습니다.
            </pre>
        </div>
        <div >
            <label for="date" id="res">예약일</label><br>
            <select name="date" id="date" required >
                <option value="2022-07-22 14:00">2022-07-22 14:00</option>
                <option value="2022-07-30 14:00">2022-07-30 14:00</option>
                <option value="2022-08-06 14:00">2022-08-06 14:00</option>
            </select>
        </div>
        <br><br><br>
        <div>
            <button type="submit" id="class-res-btn" class="">예약하기</button>
        </div>
    </div>
    <br><br><br><br><br><br><br><br>
    <div id="image2">
        <img src="resources/images/onedayclass_detail-1.png" width="1200px">
        <img src="resources/images/onedayclass_detail-2.png" width="1200px">
    </div>
     <br><br><br><br><br><br><br><br>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
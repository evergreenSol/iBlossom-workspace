<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/kms.css" rel="stylesheet">
    <title>iBlossom | Contact Us</title>
    <!-- 파비콘 -->
	<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
	<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
    <style>
#map{
    margin-bottom: -100px;
    
    }
    </style>    
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
     <div id="content-wrap">
        <div id="content">
            <div id="content_1" style="padding:10px">
                <ul id="leftNavi1">
                    <b style="font-size:25px;">고객센터</b>
                    <br><br>
                    <!-- <hr color="black" style="border: 1px solid black"> -->
                    <li class="left_menu">
                        <a href="listView.no">
                            <span class="category-content">공지사항</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                    <li class="left_menu" >
                        <a href="contactus.no">
                            <span class="category-content" style="font-weight : 700;">Contact Us</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                    <li class="left_menu">
                        <a href="qnaForm.qu">
                            <span class="category-content">1:1 문의</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                    <li class="left_menu">
                        <a href="faq.no">
                            <span class="category-content">FAQ</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                </ul>               
            </div>           
        </div>
        
    <div id="contact">
        <p style="font-size: 23px; font-weight: 700;">Contact Us</p>
        <pre style="font-size: 15px;">
법인명(상호) : (주)아이블러썸 

대표자(성명) : 김한솔

서울특별시 영등포구 선유동2로 57 이레빌딩
사업자등록번호 123-456-78900 
통신판매번호 : 2022-서울당산-3333<br>
OPEN HOURS AM 09:30 - PM 18:20 | LUNCH TIME PM 12:20 - PM 13:30 | OFFICE DAY MON - FRI
        </pre>
	<p id="mapTitle" style="font-size: 20px; font-weight: 700;">찾아오시는 길</p>
	<div id="map" style="width:700px;height:400px;"></div>
    </div>
</div>    

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4dec692125d4be6e05e4143d093b0d4"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.534210337206666, 126.89724512270467),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
	

    
    	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
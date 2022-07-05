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
    <title>Document</title>
    <style>

     </style>    
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <div id="content">
	    <div id="content_1" style="padding:10px">
	        <ul id="leftNavi1">
	            <b style="font-size:30px;">고객센터</b>
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
	                    <span class="category-content">Contact Us</span>
	                    <span class="category-arrow">></span>
	                </a>
	            </li>
	            <br>
	            <li class="left_menu">
	                <a href="">
	                    <span class="category-content">1대1 문의</span>
	                    <span class="category-arrow">></span>
	                </a>
	            </li>
	            <br>
	            <li class="left_menu">
	                <a href="">
	                    <span class="category-content">FAQ</span>
	                    <span class="category-arrow">></span>
	                </a>
	            </li>
	            <br>
	        </ul>
	        
	    </div> 
	    
	</div>
    <div id="contact">
        <h1>Contact Us</h1>
        <pre>
법인명(상호) : (주)나블러썸 

대표자(성명) : 김한솔

서울특별시 영등포구 선유동2로 57 이레빌딩
사업자등록번호 123-456-78900 
통신판매번호 : 2022-서울당산-3333 
OPEN HOURS AM 11:00 - PM 5:00 | LUNCH TIME PM 1:00 - PM 2:00 | OFFICE DAY MON - FRI
        </pre>
    </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
     <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    

    
    	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
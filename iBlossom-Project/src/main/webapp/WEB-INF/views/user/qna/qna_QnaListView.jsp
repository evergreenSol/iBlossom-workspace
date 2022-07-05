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
	                <a href="qnaList.qu">
	                    <span class="category-content">1대1 문의</span>
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
	
   <div id="list-container">
        <h2>1대1 문의게시판</h2>
        <a type=button id="btn-write" href="qnaForm.qu">작성하기</a>
        <table id="list-table">
            <thead>
                <tr>
                    <th width="60">글번호</th>
                    <th width="300">제목</th>
                    <th width="70">작성자</th>
                    <th width="110">작성일</th>
                    <hr width="550" align="left">
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td width="60">3</td>
                    <td width="300">안녕하세요</td>
                    <td width="70">user03</td>
                    <td width="110">2020-12-22</td>
                </tr>
                <tr>
                    <td width="60">2</td>
                    <td width="300">ㅋㅋㅋ재밌네요</td>
                    <td width="70">user01</td>
                    <td width="110">2020-10-02</td>
                </tr>
                <tr>
                    <td width="60">1</td>
                    <td width="300">자유게시판 서비스를 시작합니다/</td>
                    <td width="70">admin</td>
                    <td width="110">2020-03-30</td>
                </tr>
            </tbody>
        </table>
    </div>
    
        <br><br><br><br><br><br><br><br><br><br><br>
    

    
    	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
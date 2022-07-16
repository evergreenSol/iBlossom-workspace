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
    <title>iBlossom | 1:1 Inquiry</title>
    <!-- 파비콘 -->
	<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
	<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
    <style>

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
                            <span class="category-content">Contact Us</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                    <li class="left_menu">
                        <a href="qnaList.qu">
                            <span class="category-content" style="font-weight : 700;">1:1 문의</span>
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
            <p style="font-size: 20px; font-weight: 700;">1:1 문의게시판</p>
      		  <a type=button id="btn-write" href="qnaForm.qu">작성하기</a>
            <table id="list-table">
                <thead>
                    <tr>
                        <th width="100">글번호</th>
                        <th width="450">제목</th>
                        <th width="150">작성자</th>
                        <th width="200">작성일</th>
                        <hr width="800" align="left">
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>6</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>안녕하세요</td>
                        <td>user03</td>
                        <td>2020-12-22</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>ㅋㅋㅋ재밌네요</td>
                        <td>user01</td>
                        <td>2020-10-02</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>자유게시판 서비스를 시작합니다/</td>
                        <td>admin</td>
                        <td>2020-03-30</td>
                    </tr>
                </tbody>
            </table>
        </div>
  </div>  
    

    
    	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
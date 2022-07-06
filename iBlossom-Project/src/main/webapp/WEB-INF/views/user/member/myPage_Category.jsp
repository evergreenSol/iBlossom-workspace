<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="content">
	    <div id="content_1" style="padding:10px">
	        <ul id="leftNavi1">
	            <b style="font-size:25px;">마이페이지</b>
	            <br><br>
	            <!-- <hr color="black" style="border: 1px solid black"> -->
	            <li class="left_menu">
	                <a href="orderListView.me">
	                    <span class="category-content">주문내역 / 배송조회</span>
	                    <span class="category-arrow">></span>
	                </a>
	            </li>
	            <br>
	            <li class="left_menu" >
	                <a href="subscribeView.me">
	                    <span class="category-content">나의 정기구독</span>
	                    <span class="category-arrow">></span>
	                </a>
	            </li>
	            <br>
	            <li class="left_menu">
	                <a href="onedayClass.me">
	                    <span class="category-content">나의 클래스</span>
	                    <span class="category-arrow">></span>
	                </a>
	            </li>
	            <br>
	            <li class="left_menu">
	                <a href="updateForm.me">
	                    <span class="category-content">프로필수정</span>
	                    <span class="category-arrow">></span>
	                </a>
	            </li>
	            <br>
	            <li class="left_menu">
	                <a href="qnaListView.me">
	                    <span class="category-content">나의 1대1문의</span>
	                    <span class="category-arrow">></span>
	                </a>
	            </li>
	            <br>
	            <li class="left_menu">
	                <a href="reviewListView.me">
	                    <span class="category-content">나의 리뷰</span>
	                    <span class="category-arrow">></span>
	                </a>
	            </li>
	            <br>
	        </ul>
	        
	    </div> 
	    
	</div>
	<br>
	<div class="mypage-logout-wrap" align="center">
	    <a class="mypage-logout" href="logout.me">로그아웃</a>
	</div>

</body>
</html>
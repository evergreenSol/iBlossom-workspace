<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/c8ea39d107.js" crossorigin="anonymous"></script>
    <title>header</title>
    <link href="resources/css/header.css" rel="stylesheet">
</head>
<body>
 	<!-- header 헤더 div -->
    <div id="header-div-wrap">

        <!-- 로고 -->
        <div id="header-logo-warp">
            <a href=""><img src="resources/images/iBlossom_logo_black.png" id="header-logo"></a>
        </div>

        <!-- 검색창 -->
        <div id="header-search" style="position: relative;">
            <form action="">
                <button class="btn_search" style="position: absolute;"></button>
                <input class="btn_text" type="text" placeholder="검색어를 입력하세요." style="border:0 solid black; border-radius: 30px; padding-left: 21px;">
            </form>
        </div>

        <!-- 메뉴 -->
        <div id="header-navi-wrap">
            <ul id="header-navi">
                <li><a href="subscribeListView.su" class="header-navi-menu">정기구독</a></li>
                <li><a href="" class="header-navi-menu">마켓</a></li>
                <li><a href="" class="header-navi-menu">클래스</a></li>
                <li><a href="" class="header-navi-menu">고객센터</a></li>
            </ul>
        </div>

        <!-- 로그인 -->
        <div id="header-login">

            <!-- 로그인 아이콘  -->
            <a href="" class="header-login-a">
                <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
            </a>
            
            <!-- 장바구니 아이콘 -->
            <a href="" class="header-login-a">
                <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-bag" viewBox="0 0 16 16">
                    <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                </svg>
             </a>

        </div>

    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/kdh.css" rel="stylesheet">

<style>
    .product {
        margin : auto;
        text-align : left;

    }

    #subproduct_name {
        width : 100%;
        height : 30px;
    }
</style>
</head>
<body>

    <!-- admin 어드민 관리자 메뉴 wrap -->
    <div id="admin-menu-wrap">

        <!-- 메뉴 첫번째줄 div -->
        <div id="admin-menu-1">

            <!-- 로고 -->
            <div id="admin-logo-div">
                <a href="" id="admin-logo-a">
                    <img src="resources/images/iBlossom_logo_black.png">
                 </a>
             </div>

            <!-- 로그인 div -->
            <div id="admin-login-div">

                <span id="admin-login-text">admin</span>

                <!-- 로그인 아이콘  -->
                <a href="" id="admin-login-a">
                    <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-person-fill" viewBox="0 0 16 16">
                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                    </svg>
                </a>

            </div>

        </div>

        <!-- 메뉴 두번째줄 div -->
        <div id="admin-menu-2">

            <!-- 메뉴 div -->
            <div id="admin-navi-div">

                <!-- 메뉴 -->
                <ul id="admin-navi">
                    <li><a href="" class="admin-navi-menu" id="admin-navi-member">회원관리</a></li>
                    <li><a href="" class="admin-navi-menu">주문정보관리</a></li>
                    <li><a href="" class="admin-navi-menu">정기구독관리</a></li>
                    <li><a href="" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="" class="admin-navi-menu">리뷰관리</a></li>
                    <li><a href="" class="admin-navi-menu">클래스관리</a></li>
                    <li><a href="" class="admin-navi-menu">고객센터관리</a></li>
                    <li><a href="" id="admin-navi-chat">채팅관리</a></li>
                </ul>

            </div>

        </div>

    </div>

    <!-- admin 관리자페이지 회원관리 -->
    <div id="admin-member-wrap">

        <span id="admin-member-title">상품 등록</span>
        <hr id="admin-member-hr">

        <!-- 여기서부터는, 훈련생 여러분들 각자 작업 하면 된다 실시 -->
        <div class="wrap">
            <form method="" action="">
                <table class="product">
                    <tr>
                        <th width="1200px" height="30px" colspan="2" width="80%">상품명</th>
                    </tr>
                    <tr>
                        <td><input type="text" id="subproduct_name" name="subproduct_name"></td>
                    </tr>
                    <tr>
                        <td colspan="2">썸네일</td>
                    </tr>
                    <tr>
                        <td><img></td>
                        <td><textarea resize="none" name="subproduct_description"></textarea></td>
                    </tr>
                    <tr>
                        <th colspan="2">가격</th>
                    </tr>
                    <tr>
                        <td><input type="text" id="price" required><span>원</span></td>
                    </tr>
                </table>
            </form>
            <br>
        </div>
        

    </div>
    
</body>
</html>
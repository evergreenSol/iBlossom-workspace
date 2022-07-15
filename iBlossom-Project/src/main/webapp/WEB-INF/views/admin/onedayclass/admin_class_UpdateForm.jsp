<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>member</title>
    <link href="resources/css/shj.css" rel="stylesheet">
    <link href="resources/css/kms.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#add-container{

}

#addClass{

    font-size: 18px;
    font-weight: 800;
}


#addBtn{
    position: absolute;
    margin-left: 270px;
    margin-top: -27px;
    background-color: black;
    border-radius: 3px;
    color: white;
    width: 55px;
    height: 27px;
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
                    <li><a href="" class="admin-navi-menu">회원관리</a></li>
                    <li>
                        <a href="" class="admin-navi-menu">주문정보관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="">전체주문내역</a></li>
                            <li><a href="">개별주문내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="" class="admin-navi-menu">정기구독관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="">구독회원관리</a></li>
                            <li><a href="">구독상품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="" class="admin-navi-menu">리뷰관리</a></li>
                    <li><a href="" class="admin-navi-menu" style="font-weight: 700;">클래스관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="classAddForm.ad">클래스 추가</a></li>
                            <li><a href="classList.ad">클래스 예약내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="" class="admin-navi-menu">고객센터관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="qnaList.ad">1:1 문의</a></li>
                            <li><a href="">공지사항</a></li>
                        </ul>
                    </li>
                    <li><a href="" class="admin-navi-menu" id="admin-navi-chat">채팅관리</a></li>
                </ul>
            </div>
        </div>
    </div>

    <form id="add-container" action="insertClass.ad" method="post">
        <table id="addClassForm" border="1">
            <p id="addClass">클래스 추가하기</p>
            <tr>
                <td><input type="text" id="classAdd" name="className" style="border:none" width="300" maxlength="40" placeholder="클래스명"></td>
            </tr> 
            <tr>
                <td><input type="text" id="classAdd" name="price" style="border:none" width="300" maxlength="40" placeholder="가격"></td>
            </tr>   
            <tr>
                <td><input type="text" id="classAdd" name="classDate" style="border:none" width="300" maxlength="40" placeholder="날짜(yyyy-mm-dd hh:mm 형식)"></td>
            </tr>   
            <tr>
                <td><input type="text" id="classAdd" name="capNo" style="border:none" width="300" maxlength="40" placeholder="정원"></td>
            </tr>   
        </table>
        <button id="addBtn" type="submit">추가</button>
    </form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin | member</title>
    <link href="resources/css/shj.css" rel="stylesheet">
    <link href="resources/css/kms.css" rel="stylesheet">
	<!-- 파비콘 -->
	<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
	<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<style>

</style>
</head>
<body>

    <!-- admin 어드민 관리자 메뉴 wrap -->
    <div id="admin-menu-wrap">

        <!-- 메뉴 첫번째줄 div -->
        <div id="admin-menu-1">

           <!-- 로고 -->
            <div id="admin-logo-div">
                <a href="${ pageContext.request.contextPath }/" id="admin-logo-a">
                    <img src="resources/images/iBlossom_logo_black.png">
                 </a>
             </div>

            <!-- 로그인 div -->
            <div id="admin-login-div">

                <span id="admin-login-text">admin</span>

                <!-- 로그인 아이콘  -->
                <a href="logout.me" id="admin-login-a">
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
                    <li><a href="list.me" class="admin-navi-menu">회원관리</a></li>
                    <li>
                        <a href="adminList.or" class="admin-navi-menu">주문정보관리</a>
                    </li>
                    <li>
                        <a href="subMemberListView.su" class="admin-navi-menu">정기구독관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="subMemberListView.su">구독회원관리</a></li>
                            <li><a href="listView.sp">구독상품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="list.pr" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="reviewList.pr" class="admin-navi-menu">리뷰관리</a></li>
                    <li><a href="classList.ad" class="admin-navi-menu">클래스관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="classAddForm.ad">클래스 추가</a></li>
                            <li><a href="classList.ad">클래스 예약내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="qnaList.ad" class="admin-navi-menu" style="font-weight: 700;">고객센터관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="qnaList.ad">1:1 문의</a></li>
                            <li><a href="noticeList.ad">공지사항</a></li>
                        </ul>
                    </li>
                    <li><a href="https://dashboard.tawk.to/#/monitoring" target="_blank" class="admin-navi-menu" id="admin-navi-chat">채팅관리</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- admin 관리자페이지 회원관리 -->
    <div id="admin-member-wrap">

        <span id="admin-member-title">1대1 문의관리</span>
        <hr id="admin-member-hr">


        <form id="admin-answer-container" method="post" action="answerUpdate.ad">
            <table id="anwcontent" border="1">
                <tr>
                    <th width="70" height="30">제목</th>
                    <td width="250" name="qnaTitle">${ q.qnaTitle }</td>
                    <th width="60" >작성자</th>
                    <td width="100" name="userNo">${ q.userNo }</td>
                    <th width="70" >작성날짜</th>
                    <td width="100" name="qnaDate">${ q.qnaDate }</td>
                    <input type="hidden" name="qnaNo" value="${ q.qnaNo }">
                </tr>
                <tr>
                    <th>내용</th>
                    <td id="qnaContent" height="200px" colspan="5" name="qnaContent">${ q.qnaContent }</td>
                </tr>
                <tr>
                    <th height="140">답변</th>
                    <td colspan="5">
                        <p style="height:80px;"><textarea name="answer" id="answer" cols="75" rows="5"  maxlength="400"
                            style="resize:none; border: none; font-size:16px;" required>${ q.answer }</textarea></p>
                    </td>              
                </tr>           
            </table>
            <button id="adminAnswerBtn" type="submit">확인</button>
        </form> 
    </div>
    
</body>
</html>
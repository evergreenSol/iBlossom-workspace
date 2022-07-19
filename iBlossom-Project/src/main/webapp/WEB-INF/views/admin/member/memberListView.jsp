<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin | 회원관리</title>
<link href="resources/css/shj.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<style>
#pagingArea {
	width: fit-content;
	margin: auto;
}

.page-link {
	font-size : 14px;
	width : 35px;
	height: 25px;
	background-color : white;
	border : 1px solid lightgray;
	color : black;
	display: inline-block;
	margin-left : 10px;
	text-decoration : none;
	text-align : center;
	border-radius : 3px;
	padding-top: 5px;
}

.page-link:hover {
	color : #ff2393;
	font-weight:700;
}

.pagination {
	list-style-type : none;
}

.pagination li {
	float : left;
}

#admin-member-table {
    width: 100%;
    text-align: center;
    border-collapse: collapse;
    border-spacing: 0;
    align: center;
    margin-bottom : 50px;
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
                    <li><a href="list.me" class="admin-navi-menu" style="font-weight: 700;">회원관리</a></li>
                    <li><a href="adminList.or" class="admin-navi-menu">주문정보관리</a></li>
                    
                    <li>
                        <a href="" class="admin-navi-menu">정기구독관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="subMemberListView.su">구독회원관리</a></li>
                            <li><a href="listView.sp">구독상품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="list.pr" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="reviewList.pr" class="admin-navi-menu">리뷰관리</a></li>
                    <li><a href="" class="admin-navi-menu">클래스관리</a>
                       <ul class="admin-navi-ul">
                            <li><a href="classAddForm.ad">클래스 추가</a></li>
                            <li><a href="classList.ad">클래스 예약내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="" class="admin-navi-menu">고객센터관리</a>
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

        <span id="admin-member-title">회원관리</span>
        <hr id="admin-member-hr">

        <div id="admin-memberList-wrap">

            <table id="admin-member-table" border="1">
            	<thead style="background-color : black; color:white; height : 50px; font-weight : 700;">
            
                    <th style="width:60px;">회원번호</th>
                    <th style="width:100px;">아이디</th>
                    <td style="width:80px;">이름</th>
                    <th style="width:135px;">전화번호</th>
                    <th style="width:200px;">이메일</th>
                    <th>주소</th>
                    <th style="width:110px;">가입일</th>
                    <th style="width:40px;">상태</th>
                    <th style="width:80px;">구매액</th>
                    <th style="width:40px;">등급</th>
                
                </thead>
                <tbody>
                <c:forEach var="me" items="${list}">	
                    <tr style="height : 40px;">
                        <td class="mno">${me.userNo}</td>
                        <td>${me.userId}</td>
                        <td>${me.userName}</td>
                        <td>${me.phone}</td>
                        <td>${me.email}</td>
                        <td>${me.address}</td>
                        <td>${me.enrollDate}</td>
                        <td>${me.status}</td>
                        <td>${me.purchase}</td>
                        <td>${me.grLevel}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
            <div id="pagingArea">
	         <ul class="pagination">
	
	            <c:choose>
	               <c:when test="${ pi.currentPage eq 1 }">
	                  <li class="page-item disabled"><a class="page-link" href="#">◀</a></li>
	               </c:when>
	               <c:otherwise>
	                  <li class="page-item"><a class="page-link"
	                     href="list.me?cpage=${ pi.currentPage - 1 }">◀</a></li>
	               </c:otherwise>
	            </c:choose>
	
<%-- 	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	               <li class="page-item"><a class="page-link"
	                  href="list.me?cpage=${ p }">${ p }</a></li>
	            </c:forEach> --%>
	            
	             <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		        <c:choose>
		         <c:when test="${ pi.currentPage eq p }">
		          
		                <li class="page-item"><a class="page-link"  style="color : #ff2393; font-weight:700;"
		             href="list.me?cpage=${ p }">${ p }</a></li>
		            </c:when>
		            <c:otherwise>

		                <li class="page-item"><a class="page-link"
		                    href="list.me?cpage=${ p }">${ p }</a></li>
		          </c:otherwise>
		          </c:choose>
		       </c:forEach>
	
	            <c:choose>
	               <c:when test="${ pi.currentPage eq pi.maxPage }">
	                  <li class="page-item disabled"><a class="page-link" href="#">▶</a></li>
	               </c:when>
	               <c:otherwise>
	                  <li class="page-item"><a class="page-link"
	                     href="list.me?cpage=${ pi.currentPage + 1 }">▶</a></li>
	               </c:otherwise>
	            </c:choose>
	
	         </ul>

   		 </div>
           
      </div>


</body>
</html>
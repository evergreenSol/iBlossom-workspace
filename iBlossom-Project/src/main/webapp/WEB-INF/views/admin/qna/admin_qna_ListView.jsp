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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<style>
 /* 페이징바 */

 #pagingArea {
   width: fit-content;
   margin: auto;
   margin-top : 600px;
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

.page-link:active:focus 
.page-item:active {
   color : #ff2393;
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
    
    <div id="admin-member-wrap">
        <span id="admin-member-title">1대1 문의관리</span>
        <hr id="admin-member-hr">

        <div id="admin-list-container">

            <table id="admin-list-table" style="font-size: 16px;">
                <thead>
                    <tr>
                        <th width="100">글번호</th>
                        <th width="400">제목</th>
                        <th width="130">작성자</th>
                        <th width="180">작성일</th>
                        <th width="150">문의 상태</th>
                    </tr>
                </thead>
                <tbody>
	                <c:forEach var="q" items="${ list }">
	                    <tr>
	                        <td>${ q.qnaNo }</td>
	                        <td>${ q.qnaTitle }</td>
	                        <td>${ q.userNo }</td>
	                        <td>${ q.qnaDate }</td>
                      	<c:choose>
                            <c:when test="${ q.answerStatus eq 'Y'}">
                                <td>답변완료</td>
                            </c:when>
                           <c:otherwise>
                           		<td>답변대기</td>
                           </c:otherwise>
                        </c:choose>
                  	  </tr>
	                </c:forEach>  
                </tbody>
            </table>
        </div>
    </div>

		<script>
        	$(function() {
        		
        		$("#admin-list-table>tbody>tr").click(function(){
        			console.log("클릭됨");
        			console.log($(this).children().eq(0).text());
        			location.href = "qnaDetail.ad?qnaNo=" + $(this).children().eq(0).text();
        			
        		});
        	});
        </script>

    <div id="pagingArea">
        <ul class="pagination">

            <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                    <li class="page-item disabled"><a class="page-link" href="#">◀</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link"
                        href="qnaList.ad?cpage=${ pi.currentPage - 1 }">◀</a></li>
                </c:otherwise>
            </c:choose>
			
			<%-- 
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <li class="page-item"><a class="page-link"
                    href="qnaList.ad?cpage=${ p }">${ p }</a></li>
            </c:forEach>
			--%>
			
	             <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		        <c:choose>
		         <c:when test="${ pi.currentPage eq p }">
		          
		                <li class="page-item"><a class="page-link"  style="color : #ff2393; font-weight:700;"
		             href="qnaList.ad?cpage=${ p }">${ p }</a></li>
		            </c:when>
		            <c:otherwise>

		                <li class="page-item"><a class="page-link"
		                    href="qnaList.ad?cpage=${ p }">${ p }</a></li>
		          </c:otherwise>
		          </c:choose>
		       </c:forEach>
	
	            <c:choose>
	               <c:when test="${ pi.currentPage eq pi.maxPage }">
	                  <li class="page-item disabled"><a class="page-link" href="#">▶</a></li>
	               </c:when>
	               <c:otherwise>
	                  <li class="page-item"><a class="page-link"
	                     href="qnaList.ad?cpage=${ pi.currentPage + 1 }">▶</a></li>
	               </c:otherwise>
	            </c:choose>	
	         </ul>
   		 </div>

</body>
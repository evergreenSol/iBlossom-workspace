<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin | 구독회원</title>
<link href="resources/css/kdh.css" rel="stylesheet">
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

.page-link:active:focus 
.page-item:active {
	color : #ff2393;
}

.page-link:hover {
	color : #ff2393;
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
                        <a href="" class="admin-navi-menu" style="font-weight: 700;">정기구독관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="">구독회원관리</a></li>
                            <li><a href="listView.sp">구독상품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="" class="admin-navi-menu">리뷰관리</a></li>
                    <li><a href="" class="admin-navi-menu">클래스관리</a></li>
                    <li>
                        <a href="" class="admin-navi-menu">고객센터관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="">1:1 문의</a></li>
                            <li><a href="">FAQ</a></li>
                        </ul>
                    </li>
                    <li><a href="" class="admin-navi-menu" id="admin-navi-chat">채팅관리</a></li>
                </ul>

            </div>

        </div>

    </div>

    <!-- admin 관리자페이지 리뷰 관리 -->
    <div id="admin-member-wrap">

        <span id="admin-member-title">구독회원 관리</span>
        <hr id="admin-member-hr">

        <!-- 여기서부터는, 훈련생 여러분들 각자 작업 하면 된다 실시 -->
        <div style="padding-top:40px;" align="center">
            <form method="post" action="search.su">
 				<input type="hidden" name="currentPage" value="1">
                <select name="condition">
                    <option value="USER_ID">아이디</option>
             
                    <option value="USER_NAME">이름</option>
             
                    <option value="SUBPRODUCT_NAME">상품 이름</option>
                </select>
                <input type="text" name="keyword" value="${ keyword }">
                <input type="submit" id="selectbtn" value="검색">
            </form>
        </div>
		<a href="review.do">테스트</a>
        <div style="padding-top: 100px;">
            <table id="productTable" border="1px solid" align="center">
                <thead>
                	<tr>
	                    <th>주문번호</th>
	                    <th>아이디</th>
	                    <th>주문자명</th>
	                    <th>주문상품</th>
	                    <th>배송지</th>
	                    <th>구독시작일</th>
	                    <th>정기구독기간</th>
	                    <th>회원등급</th>
	                    <th>결제금액</th>
	                    <th>배송상태</th>
                    <tr>
                </thead>
                <tbody>
                <c:choose>
		            <c:when test="${ empty list }">
		                 <h4>아직 진열된 상품이 없습니다.</h4>
		            </c:when>
		            <c:otherwise>
		            	<c:forEach var="s" items="${ list }">
		                    <tr>
		                        <td>${ s.subscribeNo }</td>
		                        <td>${ s.userId }</td>
		                        <td>${ s.userName }</td>
		                        <td>${ s.subProductName }</td>
		                        <td>${ s.deliverTo }</td>
		                        <td>${ s.subDate }</td>
		                        <td>${ s.subLevel }개월</td>
		                        <td>${ s.grLevel }</td>
		                        <td>${ s.subPrice }</td>
		                        <td>${ s.deliverStatus }</td>
		                    </tr>
	                    </c:forEach>                 
	                </c:otherwise>   
                </c:choose>
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
	               <c:choose>
	            	   <c:when test="${ empty condition }">
		                	<li class="page-item"><a class="page-link" href="subMemberListView.su?currentPage=${ pi.currentPage - 1 }">◀</a></li>
		               </c:when>
		               <c:otherwise>
		                	<li class="page-item"><a class="page-link" href="search.su?currentPage=${ pi.currentPage - 1 }&condition=${ condition }&keyword=${ keyword }">◀</a></li>
		               </c:otherwise>
            	   </c:choose>
	               </c:otherwise>
	            </c:choose>
	
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	               <li class="page-item"><a class="page-link"
	                  href="subMemberListView.su?cpage=${ p }">${ p }</a></li>
	            </c:forEach>
	
	            <c:choose>
	               <c:when test="${ pi.currentPage eq pi.maxPage }">
	                  <li class="page-item disabled"><a class="page-link" href="#">▶</a></li>
	               </c:when>
	               <c:otherwise>
		               <c:choose>
		            	   <c:when test="${ empty condition }">
			                   <li class="page-item"><a class="page-link"
			                   href="subMemberListView.su?cpage=${ pi.currentPage + 1 }">▶</a></li>
		            	   </c:when>
		            	   <c:otherwise>
		            	   	   <li class="page-item"><a class="page-link" href="search.su?currentPage=${ pi.currentPage + 1 }&condition=${ condition }&keyword=${ keyword }">▶</a></li>
		           		   </c:otherwise>
			           </c:choose>
		           </c:otherwise>
	            </c:choose>
	         </ul>
	    </div>
       	
    </div>
    
    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
    (function(){
    var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
    s1.async=true;
    s1.src='https://embed.tawk.to/62caa404b0d10b6f3e7b9fdb/1g7jp1cp0';
    s1.charset='UTF-8';
    s1.setAttribute('crossorigin','*');
    s0.parentNode.insertBefore(s1,s0);
    })();
    </script>
    <!--End of Tawk.to Script-->
    
</body>
</html>
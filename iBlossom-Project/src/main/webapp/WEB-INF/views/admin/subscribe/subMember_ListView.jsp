<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin | 구독회원</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="resources/css/kdh.css" rel="stylesheet">
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

	.admin-product-list-table {
	    margin: auto; /* 표 중간 */
	    text-align: center; /* 글자 가운데 정렬 */
	    border-collapse: collapse; /* 테두리 사이의 간격을 없애고 싶다면 */
		width: 1100px;
	}
	
	/* 전체리스트 - thead */
	#admin-product-list-thead {
	    background-color: #444444;
	    color : white;
	}
	
	/* 전체리스트 - th */
	.admin-product-list-table>thead>tr>th {
	    border: 1px solid black;
	    padding: 15px;
	    font-size: medium;
	}
	
	/* 전체주문내역 - td */
	.admin-product-list-table>tbody>tr>td {
	    border: 1px solid rgba(226, 226, 226, 0.982);
	    padding: 18px;
	    font-size: medium;
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
                 <!-- 메뉴 -->
                <ul id="admin-navi">
                    <li><a href="list.me" class="admin-navi-menu">회원관리</a></li>
                    
                    <li>
                        <a href="adminList.or" class="admin-navi-menu">주문정보관리</a>
                    </li>
                    
                    <li>
                        <a href="subMemberListView.su" class="admin-navi-menu" style="font-weight: 700;">정기구독관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="subMemberListView.su">구독회원관리</a></li>
                            <li><a href="listView.sp">구독상품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="list.pr" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="list.re" class="admin-navi-menu">리뷰관리</a></li>
                    <li><a href="classList.ad" class="admin-navi-menu">클래스관리</a>
                       <ul class="admin-navi-ul">
                            <li><a href="classAddForm.ad">클래스 추가</a></li>
                            <li><a href="classList.ad">클래스 예약내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="qnaList.ad" class="admin-navi-menu">고객센터관리</a>
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

    <!-- admin 관리자페이지 리뷰 관리 -->
    <div id="admin-member-wrap">

        <span id="admin-member-title">구독회원 관리</span>
        <hr id="admin-member-hr">

        <!-- 여기서부터는, 훈련생 여러분들 각자 작업 하면 된다 실시 -->
        <!-- 셀렉트 + 검색창  -->
        <div  id="search-area" style="padding-top:40px;" align="center">
            <form method="get" action="search.su">
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
        
        <c:if test="${ not empty condition }">
	        <script>
	        	$(function() {
	        		$("#search-area option[value=${ condition }]").attr("selected", true);
	        	});
	        </script>
        </c:if>
        
        <!-- 구독한 회원들 리스트 조회용 테이블  -->
        <div style="padding-top: 100px;">
            <table class="admin-product-list-table">
                <thead id="admin-product-list-thead">
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

		<!-- 페이징 처리  -->
       	<div id="pagingArea">
	         <ul class="pagination">
	
	            <c:choose>
	               <c:when test="${ pi.currentPage eq 1 }"> <!-- 현재 페이지가 1이라면 -->
	                  <li class="page-item disabled"><a class="page-link" href="#">◀</a></li> <!-- 이전버튼 클릭 불가 -->
	               </c:when>
	               <c:otherwise> <!-- 현재 페이지가 1이 아니라면 -->
		               <c:choose>
		            	   <c:when test="${ empty condition }"> <!-- 컨디션이 비어있다면 -->
			                   <li class="page-item"><a class="page-link" href="subMemberListView.su?cpage=${ pi.currentPage - 1 }">◀</a></li>
		            	   </c:when>
		            	   <c:otherwise> <!-- 컨디션이 비어있지 않다면 -->
		            	   	   <li class="page-item"><a class="page-link" href="search.su?currentPage=${ pi.currentPage - 1 }&condition=${ condition }&keyword=${ keyword }">◀</a></li>
		           		   </c:otherwise>
	            	   </c:choose>
	               </c:otherwise>
	            </c:choose>
	
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }"> <!-- 첫페이지에서 마지막 페이지까지 돌면서 -->
		            <c:choose>
			            <c:when test="${ empty condition }"> <!-- 컨디션이 비어있다면 -->
			            	<c:choose>
						        <c:when test="${ pi.currentPage eq p }"> <!-- 해당 페이지만 글씨에 핑크색 주기용 조건 -->
						        	<li class="page-item"><a class="page-link"  style="color : #ff2393; font-weight:700;" href="subMemberListView.su?cpage=${ p }">${ p }</a></li>
						        </c:when>
						        <c:otherwise>
									<li class="page-item"><a class="page-link" href="subMemberListView.su?cpage=${ p }">${ p }</a></li>
						        </c:otherwise>
					        </c:choose> 
		                </c:when>
		                <c:otherwise> <!-- 컨디션이 비어있지 않다면 -->
		                	<c:choose>
						        <c:when test="${ pi.currentPage eq p }"> <!-- 해당 페이지만 글씨에 핑크색 주기용 조건 -->
						        	<li class="page-item"><a class="page-link" style="color : #ff2393; font-weight:700;" href="search.su?currentPage=${ p }&condition=${ condition }&keyword=${ keyword }">${ p }</a></li>
						        </c:when>
						        <c:otherwise>
									<li class="page-item"><a class="page-link" href="search.su?currentPage=${ p }&condition=${ condition }&keyword=${ keyword }">${ p }</a></li>
						        </c:otherwise>
					        </c:choose>
		            	</c:otherwise>
	            	</c:choose>   
	            </c:forEach>
	
	            <c:choose>
	               <c:when test="${ pi.currentPage eq pi.maxPage }"> <!-- 현재 페이지가 마지막 페이지라면 -->
	                  <li class="page-item disabled"><a class="page-link" href="#">▶</a></li> <!-- 다음 페이지로 가는 버튼 클릭 불가 -->
	               </c:when>
	               <c:otherwise> <!-- 현재 페이지가 마지막 페이지가 아니라면 -->
		               <c:choose>
		            	   <c:when test="${ empty condition }"> <!-- 컨디션이 비어있다면 -->
			                   <li class="page-item"><a class="page-link"
			                   href="subMemberListView.su?cpage=${ pi.currentPage + 1 }">▶</a></li>
		            	   </c:when>
		            	   <c:otherwise> <!-- 컨디션이 비어있지 않다면 -->
		            	   	   <li class="page-item"><a class="page-link" href="search.su?currentPage=${ pi.currentPage + 1 }&condition=${ condition }&keyword=${ keyword }">▶</a></li>
		           		   </c:otherwise>
			           </c:choose>
		           </c:otherwise>
	            </c:choose>
	         </ul>
	    </div>
	    <br><br><br><br>
       	
    </div>
    

    
</body>
</html>
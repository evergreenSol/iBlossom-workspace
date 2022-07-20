<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin | 리뷰관리</title>
<link href="resources/css/jsa.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico"
	type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico"
	type="image/x-icon">
<style>
#pagingArea {
	width: fit-content;
	margin: auto;
}

.page-link {
	font-size: 14px;
	width: 35px;
	height: 25px;
	background-color: white;
	border: 1px solid lightgray;
	color: black;
	display: inline-block;
	margin-left: 10px;
	text-decoration: none;
	text-align: center;
	border-radius: 3px;
	padding-top: 5px;
}

.page-link:active:focus 
.page-item:active {
	color: #ff2393;
}

.page-link:hover {
	color: #ff2393;
}

.pagination {
	list-style-type: none;
}

.pagination li {
	float: left;
}
</style>

<link href="resources/css/jsa.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
				<a href="logout.me" id="admin-login-a"> <svg
						xmlns="http://www.w3.org/2000/svg" class="bi bi-person-fill"
						viewBox="0 0 16 16">
                        <path
							d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
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
					<li><a href="adminList.or" class="admin-navi-menu">주문정보관리</a></li>
					<li><a href="subMemberListView.su" class="admin-navi-menu">정기구독관리</a>
						<ul class="admin-navi-ul">
							<li><a href="subMemberListView.su">구독회원관리</a></li>
							<li><a href="listView.sp">구독상품관리</a></li>
						</ul></li>
					<li><a href="list.pr" class="admin-navi-menu"
						>상품관리</a></li>
					<li><a href="list.re" class="admin-navi-menu" style="font-weight: 700;" >리뷰관리</a></li>
					<li><a href="classList.ad " class="admin-navi-menu">클래스관리</a>
						<ul class="admin-navi-ul">
							<li><a href="classAddForm.ad">클래스 추가</a></li>
							<li><a href="classList.ad">클래스 예약내역</a></li>
						</ul></li>
					<li><a href="qnaList.ad" class="admin-navi-menu">고객센터관리</a>
						<ul class="admin-navi-ul">
							<li><a href="qnaList.ad">1:1 문의</a></li>
							<li><a href="noticeList.ad">공지사항</a></li>
						</ul></li>
					<li><a href="https://dashboard.tawk.to/#/monitoring"
						target="_blank" class="admin-navi-menu" id="admin-navi-chat">채팅관리</a></li>
				</ul>

			</div>

		</div>

	</div>

	<!-- admin 관리자페이지 리뷰 관리 -->
	<div id="admin-member-wrap">

		<span id="admin-member-title" style="font-weight: 700;">리뷰관리</span>
		<hr id="admin-member-hr">

		<!-- 여기서부터는, 훈련생 여러분들 각자 작업 하면 된다 실시 -->
		<div style="padding-top: 40px;" align="center">
			<form method="post" action="search.re">
				<input type="hidden" name="currentPage" value="1"> <select
					id="selectReview" name="condition">
					<option value="FLOWER_NAME">상품명</option>

					<option value="USER_ID">아이디</option>

					<option value="REVIEW_TITLE">제목</option>
				</select> <input id="inputBox" name="keyword" value="${ keyword }"> <input
					type="submit" id="selectbtn" value="검색">
			</form>
		</div>

		<div style="padding-top: 100px;">
			<table id="reviewTable" border="1px solid" align="center">
				<thead style="height: 50px; font-weight: 700; background-color : #444444; color:white;">
					<th>리뷰번호</th>
					<th>아이디</th>
					<th style="width:190px">상품명</th>
					<th>제목</th>
					<th>작성일</th>
					<th>상태값</th>
				</thead>
				<tbody style="height: 40px;">
					<c:choose>
						<c:when test="${ empty list }">

							<h4>아직 진열된 상품이 없습니다.</h4>
						</c:when>
					  <c:otherwise>
							<c:forEach var="r" items="${ list }">
								<tr>
									<td class="rno">${r.reviewNo }</td>
									<td>${r.userId}</td>
									<td>${r.flowerName}</td>
									
									<td>${r.reviewTitle }</td>
									<td>${r.createDate }</td>
									<td>${r.reviewStatus }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	
				<!-- 페이징 처리  -->
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
			                   <li class="page-item"><a class="page-link" href="list.re?cpage=${ pi.currentPage - 1 }">◀</a></li>
		            	   </c:when>
		            	   <c:otherwise> <!-- 컨디션이 비어있지 않다면 -->
		            	   	   <li class="page-item"><a class="page-link" href="search.re?currentPage=${ pi.currentPage - 1 }&condition=${ condition }&keyword=${ keyword }">◀</a></li>
		           		   </c:otherwise>
	            	   </c:choose>
	               </c:otherwise>
	            </c:choose>
	
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }"> <!-- 첫페이지에서 마지막 페이지까지 돌면서 -->
		            <c:choose>
			            <c:when test="${ empty condition }"> <!-- 컨디션이 비어있다면 -->
			            	<c:choose>
						        <c:when test="${ pi.currentPage eq p }"> <!-- 해당 페이지만 글씨에 핑크색 주기용 조건 -->
						        	<li class="page-item"><a class="page-link"  style="color : #ff2393; font-weight:700;" href="list.re?cpage=${ p }">${ p }</a></li>
						        </c:when>
						        <c:otherwise>
									<li class="page-item"><a class="page-link" href="list.re?cpage=${ p }">${ p }</a></li>
						        </c:otherwise>
					        </c:choose> 
		                </c:when>
		                <c:otherwise> <!-- 컨디션이 비어있지 않다면 -->
		                	<c:choose>
						        <c:when test="${ pi.currentPage eq p }"> <!-- 해당 페이지만 글씨에 핑크색 주기용 조건 -->
						        	<li class="page-item"><a class="page-link" style="color : #ff2393; font-weight:700;" href="search.re?currentPage=${ p }&condition=${ condition }&keyword=${ keyword }">${ p }</a></li>
						        </c:when>
						        <c:otherwise>
									<li class="page-item"><a class="page-link" href="search.re?currentPage=${ p }&condition=${ condition }&keyword=${ keyword }">${ p }</a></li>
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
			                   href="list.re?cpage=${ pi.currentPage + 1 }">▶</a></li>
		            	   </c:when>
		            	   <c:otherwise> <!-- 컨디션이 비어있지 않다면 -->
		            	   	   <li class="page-item"><a class="page-link" href="search.re?currentPage=${ pi.currentPage + 1 }&condition=${ condition }&keyword=${ keyword }">▶</a></li>
		           		   </c:otherwise>
			           </c:choose>
		           </c:otherwise>
	            </c:choose>
	         </ul>
	    </div>
	    <br><br><br><br>


	</div>


	<script>
            	$(function() {
            		
            		$("#reviewTable>tbody tr").on("click", function() {
            			console.log("클릭");
            			location.href = "detail.re?rno=" + $(this).children(".rno").text();
            		});
            	});
            </script>
</body>
</html>
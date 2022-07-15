<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<link href="resources/css/jsa.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<!-- admin 어드민 관리자 메뉴 wrap -->
	<div id="admin-menu-wrap">

		<!-- 메뉴 첫번째줄 div -->
		<div id="admin-menu-1">

			<!-- 로고 -->
			<div id="admin-logo-div">
				<a href="" id="admin-logo-a"> <img
					src="resources/images/iBlossom_logo_black.png">
				</a>
			</div>

			<!-- 로그인 div -->
			<div id="admin-login-div">

				<span id="admin-login-text">admin</span>

				<!-- 로그인 아이콘  -->
				<a href="" id="admin-login-a"> <svg
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
					<li><a href="" class="admin-navi-menu">회원관리</a></li>
					<li><a href="" class="admin-navi-menu">주문정보관리</a>
						<ul class="admin-navi-ul">
							<li><a href="">전체주문내역</a></li>
							<li><a href="">개별주문내역</a></li>
						</ul></li>
					<li><a href="" class="admin-navi-menu">정기구독관리</a>
						<ul class="admin-navi-ul">
							<li><a href="">구독회원관리</a></li>
							<li><a href="">구독상품관리</a></li>
						</ul></li>
					<li><a href="list.pr" class="admin-navi-menu"
						style="font-weight: 700;">상품관리</a></li>
					<li><a href="list.re" class="admin-navi-menu">리뷰관리</a></li>
					<li><a href="" class="admin-navi-menu">클래스관리</a></li>
					<li><a href="" class="admin-navi-menu">고객센터관리</a>
						<ul class="admin-navi-ul">
							<li><a href="">1:1 문의</a></li>
							<li><a href="">FAQ</a></li>
						</ul></li>
					<li><a href="" class="admin-navi-menu" id="admin-navi-chat">채팅관리</a></li>
				</ul>

			</div>

		</div>

	</div>

	<!-- admin 관리자페이지 리뷰 관리 -->
	<div id="admin-member-wrap">

		<span id="admin-member-title">상품관리</span>
		<hr id="admin-member-hr">

		<!-- 여기서부터는, 훈련생 여러분들 각자 작업 하면 된다 실시 -->
		<div style="padding-top: 40px;" align="center">
			<form name="form1" method="post" action="">

				<select id="selectReview" name="search_option">
					<option value="product_id">꽃명</option>

					<option value="category_name">카테고리명</option>

					<option value="price">가격</option>
				</select> <input id="inputBox" name="keyword" value=""> <input
					type="submit" id="selectbtn" value="검색">
			</form>
		</div>

		<div style="padding-top: 100px;">
			<table id="productTable" border="1px solid " align="center">
				<thead style="height:50px; font-weight:700;">
					<th>상품번호</th>
					<th>카테고리명</th>
					<th>상품명</th>
					<th>가격</th>
					<th>상품 등록일</th>
					<th>태그</th>
					<th>상태값</th>

				</thead>
				<tbody style="height:40px;">
					<c:forEach var="p" items="${ list }">
						<tr>
							<td class="pno">${p.productNo}</td>
							<td>${p.categoryName}</td>
							<td>${p.flowerName}</td>
							<td>${p.price}</td>
							<td>${p.enrollDate}</td>
							<td>${p.tag}</td>
							<td>${ p.status }</td>

						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<br> <br>
		<script>
            	$(function() {
            		
            		$("#productTable>tbody tr").on("click", function() {
            			location.href = "detail.pr?pno=" + $(this).children(".pno").text();
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
							href="list.pr?cpage=${ pi.currentPage - 1 }">◀</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item"><a class="page-link"
						href="list.pr?cpage=${ p }">${ p }</a></li>
				</c:forEach>

				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="page-link" href="#">▶</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="list.pr?cpage=${ pi.currentPage + 1 }">▶</a></li>
					</c:otherwise>
				</c:choose>


			</ul>
		</div>
		<div align="center" style="padding-top: 100px;">
			<a href="productEnroll.pr"><button id="insertBtn">등록</button></a>
		</div>


	</div>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin | 리뷰관리</title>
<style>
#btnPrimary {
	background-color: black;
	width: 130px;
	height: 50px;
	color: white;
	font-weight: 700;
}

#btnDanger {
	width: 130px;
	height: 50px;
	background-color: #ff2393;
	color: white;
	font-weight: 700;
	border: #ff2393;
	margin-right: 900px;
}
</style>
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="resources/css/jsa.css" rel="stylesheet">
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
					<li><a href="adminList.or" class="admin-navi-menu">주문정보관리</a>
						<ul class="admin-navi-ul">
							<li><a href="adminList.or">전체주문내역</a></li>
							<li><a href="adminDetail.or">개별주문내역</a></li>
						</ul></li>
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
							<li><a href="noticeList.ad">FAQ</a></li>
						</ul></li>
					<li><a href="https://dashboard.tawk.to/#/monitoring"
						target="_blank" class="admin-navi-menu" id="admin-navi-chat">채팅관리</a></li>
				</ul>

			</div>

		</div>

	</div>

	<!-- admin 관리자페이지 회원관리 -->
	<div id="admin-member-wrap">

		<span id="admin-member-title">리뷰상세화면</span>
		<hr id="admin-member-hr">

		<!-- 여기서부터는, 훈련생 여러분들 각자 작업 하면 된다 실시 -->
		<div class="wrap">
			<form action="delete.re" method="post">
				<div class="admin_sub_product">
					<h3>리뷰번호</h3>
					<input type="text" id="admin_category_name" name="rno"
						value="${r.reviewNo}" readonly>

					<h3>리뷰 제목</h3>
					<input type="text" id="admin_product_name" name="reviewTitle"
						value="${r.reviewTitle}" readonly>

					<%-- <h3>아이디</h3>
				<input type="text" id="admin_product_name" name="userId" value="${r.userz }"> --%>

					<table class="admin_product">
						<tr>
							<td>
								<h3></h3> <img src="${r.reviewPhoto}" name="reviewPhoto"
								style="width: 300px">
							</td>

							<td width="60%">
								<h3>리뷰내용</h3> <textarea id="admin_product-description"
									name="reviewContent" readonly>${r.reviewContent}</textarea>
							</td>
						</tr>
					</table>
					<br>
				</div>
				<br>
				<hr>
				<br>


				<div align="center">

					<button id="btnDanger" type="submit">삭제하기</button>
				</div>
				<br>
				<br>



			</form>
		</div>


	</div>

</body>
</html>
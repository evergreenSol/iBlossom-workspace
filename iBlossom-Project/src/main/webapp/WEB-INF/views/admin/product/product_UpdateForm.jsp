<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin | 상품관리</title>
<link href="resources/css/jsa.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
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
						style="font-weight: 700;">상품관리</a></li>
					<li><a href="list.re" class="admin-navi-menu">리뷰관리</a></li>
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

	<!-- admin 관리자페이지 회원관리 -->
	<div id="admin-member-wrap">

		<span id="admin-member-title">상품수정화면</span>
		<hr id="admin-member-hr">

		<!-- 여기서부터는, 훈련생 여러분들 각자 작업 하면 된다 실시 -->
		<div class="wrap">
			<div class="admin_sub_product">
			
				<form id="updateForm" method="post" action="update.pr" enctype="multipart/form-data">
					<input type="hidden" name="productNo" value="${ p.productNo }">
					<h3>카테고리명</h3>
					<%-- <input type="text" id="admin_category_name"
						name="categoryName" value="${p.categoryName}"> --%>
					<select name ="categoryName" id="admin_category_name">
						<option  selected  style="display: none" >${p.categoryName}</option>
						<option value='꽃다발'>꽃다발</option>
						<option value='꽃병'>꽃병</option>
						<option value='조합형'>조합형</option>
					</select>
					
					<h3>상품명</h3>
					<input type="text" id="admin_product_name"
						name="flowerName" value="${p.flowerName}">

					<h3>태그</h3>
					<input type="text" id="admin_tag_name" name="tag"
						value="${ p.tag }">

					<br><br><br>
					<table class="admin_product">
						<tr>
							<h3 style="display:inline-block;">썸네일</h3>
							<td>
							 <input type="file" id="upfile" class="form-control-file border" name="reThumbNail">
                       
                            <c:if test="${ not empty p.thumbNail }"> <!-- 썸네일이 비어있지 않을 경우 -->      
	                            <input type="hidden" name="thumbNail" value="${ p.thumbNail }"> <!-- 기존파일을 검사할용도 -->
                            </c:if>
							<%-- <input type="file" name="thumbNail" id="admin_product-img" value="${ p.thumbNail }">
							<label for="thumbnail"></label>  --%>
							</td>
							
							
							<h3 style="display:inline-block;margin-left:200px">상세사진</h3>
							<td>
						<%-- 	<input type="file" name="contentPhoto" id="admin_product-img" value="${ p.contentPhoto }">
							<label for="contentPhoto"></label> --%>
							 <input type="file" id="upfile" class="form-control-file border" name="reContentPhoto">
                            <c:if test="${ not empty p.contentPhoto }"> <!-- 상세사진이 비어있지 않을 경우 -->     
	                            <input type="hidden" name="contentPhoto" value="${ p.contentPhoto }"> <!-- 기존파일을 검사할용도 -->
                            </c:if>
							</td> 
						
							
							
							<td width="60%"><textarea id="admin_product-description"
									name="flowerInfo">${ p.flowerInfo }</textarea></td>
						</tr>
					</table>
					<h3>가격</h3>
					<input type="text" id="admin_price" name="price" value="${p.price}">
					<span>원</span> <br> <br>
					<hr>
					<br>
					<button type="submit" id="insertProduct"
						style="margin-left: 1000px;">등록</button>
				</form>
			</div>

		</div>


	</div>




</body>
</html>
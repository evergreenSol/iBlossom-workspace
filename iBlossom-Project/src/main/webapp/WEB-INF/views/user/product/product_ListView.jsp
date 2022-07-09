<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/jsa.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!-- 지승아 만들기 -->
	<div align="center" id="wrap" style="overflow: hidden;">
		<img src="resources/images/flower1.jpg" height="300px" width="1200px"
			style="margin-top: 30px; object-fit: cover;">
	</div>
	<br>
	<div align="center">
		<img src="resources/images/logo.png" width="150px"><big><b
			style="font-size: 27px;"> 플라워마켓</b></big><br>
		<br> 꽃 가격의 한계를 깼습니다. <br> 누구나 꽃을 부담없이 편하게 즐길 수 있게합니다. <br>
		<br>
		<br>
		<br>
		<br>
	</div>

	<div id="flower_name" align="center">
		<a href="" style="text-decoration: none;">꽃다발</a>
		<text style="font-size: 30px;">&nbsp; /&nbsp; </text>
		<a href="" style="text-decoration: none;">꽃대</a>
		<text style="font-size: 30px;">&nbsp;/ &nbsp;</text>
		<a href="combinationdetailList.pr" style="text-decoration: none;">조합형</a>
	</div>



	<br>
	<br>

	<div id="container">
		<div align="center">
			<table id="productListTable">
				<thead>

					<tr class="test">
						<c:forEach var="p" items="${ list }">
							<td>
								<img src="${p.thumbNail}" name="thumbNail" width="300px">
								<input type="hidden" id="pno" value="${ p.productNo }">
							</td>
						</c:forEach>
					</tr>

					<tr>
						<c:forEach var="p" items="${ list }">

							<td align="center"><small> ${p.flowerName}<br>
									${p.price}<span>원</span>
							</small></td>
						</c:forEach>
					</tr>

				</thead>
			</table>
		</div>
		<script>
            	$(function() {
            		
            		$("#productListTable img").on("click", function() {
            			location.href = "detailList.pr?pno=" + $(this).next("#pno").val();
            		});
            	});
            </script>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
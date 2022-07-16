<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/jsa.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<style>
#productListTable thead{
float : left;
	
}

.pno {
	display : none;
}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<!-- 지승아 만들기 -->
	<div align="center" id="wrap" style="overflow: hidden;">
		<img src="resources/images/flower1.jpg" height="300px" width="1200px"
			style="margin-top: 30px; object-fit: cover;">
	</div>
	<br>
	<div align="center">
		<img src="resources/images/logo.png" width="150px"><big><b style="font-size: 27px;"> 플라워마켓</b></big><br>
		<br> 꽃 가격의 한계를 깼습니다. <br> 누구나 꽃을 부담없이 편하게 즐길 수 있게합니다. <br>
		<br>
		<br>
		<br>
		<br>
	</div>

	<div id="flower_name" align="center">
		<a href="flowerList.pr" style="text-decoration: none; font-size:20px;">꽃다발</a>
		<text style="font-size: 20px;">&nbsp; /&nbsp; </text>
		<a href="baseList.pr" style="text-decoration: none;   font-size:20px;" id="flowerBase">꽃병</a>
		<text style="font-size: 20px;">&nbsp;/ &nbsp;</text>
		<a href="combinationDetailList.pr" style="text-decoration: none;  font-size:20px;">조합형</a>
	</div>

	<br>
	<br>

	<div id="container" style="width:1200px; margin: auto;" >
		<div align="center" style="width:1192.5px; margin:auto; padding-left:7.5px;">
			<table id="productListTable">
				<c:forEach var="f" items="${ flowerList }">
				<thead> 
					<tr class="test">
							<td width="290px" height="400">
								<img src="${f.thumbNail}" id="thumbNail" width="290px" height="100%">
							</td>
							<td class="pno">${ f.productNo }</td>
					</tr>
					<tr>
							<td align="center" id="flowerName"><small> ${f.flowerName}<br>
									${f.price}<span>원</span>
							</small></td>
						
					</tr>
					<tr height="30"></tr>
				</thead>
				</c:forEach>
				
			</table>
			<table id="productListTable">
			<c:forEach var="b" items="${ baseList }">
				<thead>
					<tr class="test2">
							<td width="290px" height="400">
								<img src="${b.thumbNail}" id="thumbNail" width="290px" height="100%">
							</td>
							<td class="pno">${ b.productNo }</td>
					</tr>
					<tr>
							<td align="center" id="flowerName"><small> ${b.flowerName}<br>
									${b.price}<span>원</span>
							</small></td>
						
					</tr>
					<tr height="30"></tr>
				</thead>
				</c:forEach>
			</table>
		</div>
		<script>
     		$(".test").on("click", function() {
     			console.log($(this).children(".pno").text())
     			location.href = "detailList.pr?pno=" + $(this).children(".pno").text();
     		});
     		
     		$(".test2").on("click", function() {
     			console.log($(this).children(".pno").text())
     			location.href = "detailList.pr?pno=" + $(this).children(".pno").text();
     		});


            </script>
	</div>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>
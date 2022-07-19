<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Search Result</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<style>
	
	/* 전체 */
	.searchOuter {
		width: 1200px; 
		margin: auto;
		margin-top: 53px;
	}
	
	/* 가운데로 와주세요 제발 */
	.empty_result {

		height : 600px;
	}
	
	/* 페이지 타이틀  */
	.searchTitle {
		 font-weight:700; 
		 font-size:34px; 
		 margin-bottom:15px; 
		 float:left;
	}
	
	/* 검색 결과 없을 시 이미지 */
	#searchResultImg {
		margin-top : 250px;
		width:50px; 
		height:50px; 
		margin-bottom: 15px;
	}
	
	/* 홈으로 버튼 */
	.searchResult button {
		width:320px; 
		height:50px; 
		background-color:black; 
		color:white; 
		border-radius:3px;
	}
	
	/* 홈으로 버튼 hover */
	.searchResult button:hover {
		cursor: pointer;
	}
	
	/* 검색 결과창 */
	.result_list {
		width : 1200px;
		
	}
	
	/* 검색 결과 목록 */
	.result_product {
		margin : 2px;
		display : inline-block;
		text-align : center;
	}

	/* 꽃 이름 */
	#flower_name {
		font-size : 14px;
		font-weight : 500;
		margin-bottom : 15px;
	}
	
	/* 검색 결과창에 이미지틀 */
	.result_img_div {
		width : 290px;
		height : 400px;
		background-size: contain;
		background-repeat : no-repeat;
		background-position : center;
		margin : auto;
	}
	
	/* 이미지 호버시 */
	.result_img_div:hover {
		cursor : pointer;
		width : 97%;
		height : 97%;
	}
	
	/* 이미지 css */
	.result_img {
		width : 95%;
		height : 95%;
	}
	
	
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	
    <div class="searchOuter">
    
	    <div class="searchTitle">&nbsp;${ keyword }(${ count })</div>
	    
	    	<br><br><br>
	    	
	    	<hr>
	    	
			    <div class="searchResult" style="width:100%; ">
			    
				    <!-- 검색 결과가 없다면 --> 
				    <c:choose>
					    <c:when test="${ empty list }">
						    <div class="empty_result" align="center">
							    <div>
				                    <img src="resources/images/cart_zero_img.png" id="searchResultImg">
				                </div>
							    
							    
							    <div style="font-size:large; margin-bottom:27px;">검색 결과가 없습니다.</div>
							    
							    <div>
							    	<button class="" type="button" onclick="location.href='${ pageContext.request.contextPath }/'">홈으로</button>
							    </div>
						    </div>
					    </c:when>
					    <c:otherwise>
					    	<div class="result_list">
								<table class="result_table"> 
					                <c:forEach var="s" items="${ list }">    
						                <div class="result_product" onclick="location.href='detailList.pr?pno=${ s.productNo }'">
							                <div class="result_img_div">
							                	<img class="result_img" src="${ s.thumbNail }">
							                </div>
							                <div id="flower_name">${ s.flowerName }</div>
						                </div>
					                </c:forEach>
					            </table>
				            </div>	
					    </c:otherwise>
				    </c:choose> 	    	
			    </div>
			    
		    <hr>
		    <br>
		    <br>
		    <br>	    
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>	


</body>
</html>
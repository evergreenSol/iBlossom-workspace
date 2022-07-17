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
	
	/* 페이지 타이틀  */
	.searchTitle {
		 font-weight:700; 
		 font-size:34px; 
		 margin-bottom:15px; 
		 float:left;
	}
	
	/* 검색 결과 없을 시 이미지 */
	#searchResultImg {
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
	
	.result_list {
		width : 1200px;
	}

	.result_list tr {
		text-align : center;
    	font-size : 20px;
        margin : 30px;
    }
    
    /* 검색 결과 테이블 transpose 용 css */
    .result_list tr { display: block; float: left; } 
    .result_list th, .result_list td { display: block; }
	
	#flower_name {
		font-size : 20px;
		font-weight : 700;
	}
	
    /* 검색 결과 사진 css*/
    #result_img {
    	width : 250px;
    	height : 300px;
        border : solid 1px rgb(243, 243, 243);
    	background-color : white;
        border-radius : 50%;
        margin : auto;
        text-align : center;
        -webkit-user-drag: none;
    }
    
    .result_list tr:hover {
    	cursor : pointer;
    }
    
    #result_img:hover {
    	width : 270px;
    	height : 320px;
        border : solid 1px rgb(243, 243, 243);
    }
	
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	
    <div class="searchOuter">
    
	    <div class="searchTitle">&nbsp;${ keyword }(${ count })</div>
	    
	    	<br><br><br>
	    	
	    	<hr>
	    	
			    <div class="searchResult">
			    
				    <!-- 검색 결과가 없다면 --> 
				    <c:choose>
					    <c:when test="${ empty list }">
						    <div>
			                    <img src="resources/images/cart_zero_img.png" id="searchResultImg">
			                </div>
						    
						    
						    <div style="font-size:large; margin-bottom:27px;">검색 결과가 없습니다.</div>
						    
						    <div>
						    	<button class="" type="button" onclick="location.href='${ pageContext.request.contextPath }/'">홈으로</button>
						    </div>
					    </c:when>
					    <c:otherwise>
					    	<div class="result_list">
								<table class="result_table"> 
					                <c:forEach var="s" items="${ list }">    
						                <tr class="result_product" onclick="location.href='detailList.pr?pno=${ s.productNo }'">
						                    <td height="250px" width="250px" class="result_img" id="result_img">
						                    	<img src="${ s.thumbNail }" id="result_img">
						                    </td>
						                    <td id="flower_name" style="margin-top:30px;">${ s.flowerName }</td>
						                </tr>
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
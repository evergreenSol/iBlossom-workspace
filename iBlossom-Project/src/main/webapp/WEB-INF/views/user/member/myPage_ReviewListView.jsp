<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Membership</title>
<link href="resources/css/khs.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="mypage-wrap">
	
		<br><br>
        <jsp:include page="myPage_Header.jsp"/>
        
        <br>
        
        <table class="mypage-body">
        	<tr>
            	<td class="body_l" style="vertical-align: top;" width="300">
            		<jsp:include page="myPage_Category.jsp"/>
            	</td>
                <td class="body_r" width="900" style="vertical-align: top;">
                    <div class="delete">
                   		<h2>리뷰 내역</h2>
                    
                    	<div style="width: 100%">
                            <table align="center" style="text-align: center; font-size: 14px; width: 100%; border-collapse: collapse;" id="reviewTable">
                                <thead style="background: rgb(248, 248, 248); border-style: none;">
                                    <tr height="40">
                                        <th width="150">리뷰 상품</th>
                                        <th width="500">제목</th>
                                        <th width="150">리뷰 날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${ empty list }">
                                <c:forEach var="r" items="${list}">
                                    <tr height="40">
                                        <td>${ r.productName }</td>
                                        <td>${ r.reviewTitle }</td>
                                        <td>${ r.createDate }</td>
                                    </tr>
                                </c:forEach>
                                </c:if>
                                <c:if test="${ empty list }">
                                	
                                <tr>
                                	<td height="300" width="900" colspan="4" id="no-qna">
                                		회원님께서 남기신 문의가 없습니다.
                                	</td>
                                </tr>	
                               
                                </c:if>
                                
                                </tbody>
                            </table>
                        </div>

                    </div>
			
                </td>
            </tr>
    
        </table>
    
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
 
 <script>
 	$(function () {
 		$("#reviewTable>tbody").on("click", "tr", function () {
 			console.log("click");
 		});
 		
 		$("#category-review").css("font-weight", "700");
 	});
 </script>

</body>
</html>
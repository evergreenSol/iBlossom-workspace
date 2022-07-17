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
<style>
#reviewTable:hover {
	cusor: pointer;
	background-color: light-gray;
}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="mypage-wrap">
	
        <jsp:include page="myPage_Header.jsp"/>
        
        
        <table class="mypage-body">
        	<tr>
            	<td class="body_l" style="vertical-align: top;" width="300">
            		<jsp:include page="myPage_Category.jsp"/>
            	</td>
                <td class="body_r" width="900" style="vertical-align: top;">
                    <div class="delete">
                   		<h2>리뷰 내역</h2>
                    
                    	<div style="width: 100%">
                            <table align="center" style="text-align: center; font-size: 16px; width: 100%; border-collapse: collapse;" id="reviewTable">
                                <thead style="background: rgb(248, 248, 248); border-style: none;">
                                    <tr height="50">
                                        <th width="250">리뷰 상품</th>
                                        <th width="300">제목</th>
                                        <th width="150">리뷰 날짜</th>
                                    </tr>
                                </thead>
                                <tbody id="reviewTbody">
                                <c:if test="${ not empty list }">
                                <c:forEach var="r" items="${list}">
                                    <tr height="50">
                                    	<input type="hidden" value="${r.reviewNo}">
                                        <td>${ r.flowerName }</td>
                                        <td>${ r.reviewTitle }</td>
                                        <td>${ r.createDate }</td>
                                    </tr>
                                </c:forEach>
                                </c:if>
                                <c:if test="${ empty list }">
                                	
                                <tr>
                                	<td height="300" width="900" colspan="4" id="no-qna">
                                		회원님께서 남기신 리뷰가 없습니다.
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
 		
 		
 		$("#category-review").css("font-weight", "700");
 		
 		
 	});
 	
 	$("#reviewTable>tbody tr").click( function () {
			console.log("click");
			console.log($(this).children().eq(0).val());
			
			var reviewNo = $(this).children().eq(0).val();
			
			location.href="reviewDetailView.me?reviewNo=" + reviewNo;
			
	});
 	
 	$("no-qna").click(function () {
		location.href="flowerList.pr";
	});
 	
    

</script>
 


</body>
</html>
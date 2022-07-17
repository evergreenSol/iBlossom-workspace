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
	
        <jsp:include page="myPage_Header.jsp"/>
        
        
        <table class="mypage-body">
        	<tr>
            	<td class="body_l" style="vertical-align: top;" width="300">
            		<jsp:include page="myPage_Category.jsp"/>
            	</td>
                <td class="body_r" width="900" style="vertical-align: top;">
                    <div class="delete">
                    	<h2>1대1 문의내역</h2>
                    
                   		<div style="width: 100%">
                            <table align="center" style="text-align: center; font-size: 16px; width: 100%; border-collapse: collapse;" id="qnaTable">
                                <thead style="background: rgb(248, 248, 248); border-style: none;">
                                    <tr height="40">
                                    	<th width="50">번호</th>
                                        <th width="100">문의 날짜</th>
                                        <th width="500">제목</th>
                                        <th width="150">문의 상태</th>
                                    </tr>
                                </thead>
                                <tbody id="qnaTbody">
                                <c:if test="${ not empty list }">
                                
                                <c:forEach var="q" items="${ list }">
                                    <tr height="40">
                                    	<td>${ q.qnaNo }</td>
                                        <td>${ q.qnaDate }</td>
                                        <td>${ q.qnaTitle }</td>
                                        
                                        <c:choose>
                                        	<c:when test="${ q.answerStatus eq 'Y'}">
                                        		<td>답변완료</td>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<td>답변대기</td>
                                        	</c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <input type="hidden" name="qnaNo" value="${ q.qnaNo }">
                                </c:forEach>
                                </c:if>
                                <c:if test="${ empty list }">
                                	
                                	<td height="300" width="900" colspan="4" id="no-qna">
                                		회원님께서 남기신 문의가 없습니다.
                                	</td>
                               
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
			$("#qnaTable>tbody").on("click", "tr", function () {
				console.log($(this).children().eq(0).text());
				location.href="qnaDetailView.me?qnaNo=" + $(this).children().eq(0).text();
			});
		
			$("#category-qna").css("font-weight", "700");
			
			$("no-qna").click(function () {
				location.href="qnaForm.qu";
			});
			
		})
	</script>
</body>
</html>
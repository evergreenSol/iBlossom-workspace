<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Membership</title>
<link href="resources/css/khs.css" rel="stylesheet">
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
                    	<h2>1대1 문의내역</h2>
                    
                   		<div style="width: 100%">
                            <table align="center" style="text-align: center; font-size: 14px; width: 100%">
                                <thead style="background: rgb(248, 248, 248); border-style: none;">
                                    <tr height="40">
                                        <th width="150">문의 날짜</th>
                                        <th width="500">제목</th>
                                        <th width="150">문의 상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="q" items="${ list }">
                                    <tr height="40">
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
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
			
                </td>
            </tr>
    
        </table>
    
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
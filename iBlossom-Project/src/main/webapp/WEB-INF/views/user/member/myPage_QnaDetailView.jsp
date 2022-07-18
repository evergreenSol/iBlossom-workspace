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
                    	<div style="margin : 20px 0px;">
                    	<span class="mainView-title">1대1 문의내역</span>
                        </div>
                   		<div class="qna-detail-content" style="width: 800px; position: relative;" align="right">
                            <div class="qna-detail-title" style="position: absolute;left: 280px;top: -31px;">제목: <span>${q.qnaTitle}</span></div>
                            <div class="balloon right">
                                <span class="qna-detail-span">
                                    ${q.qnaContent}
                                </span>
                            </div>
                            <div class="qna-detail-date">${q.qnaDate}</div>
                        </div>

						<c:if test="${not empty q.answer}">
                        <div class="qna-detail-content" style="width: 100%"align="left">
                            <div class="balloon left">
                                <span class="qna-detail-span">
                                ${q.answer}
                                </span>
                            </div>
                            <div class="qna-detail-date">${q.answerDate}</div>
                        </div>
						</c:if>
						<c:if test="${empty q.answer}">
                        <div class="qna-detail-content" style="width: 100%"align="left">
                            <div class="balloon left">
                                <span class="qna-detail-span">
                                죄송합니다. 답변이 아직 없습니다.
                                </span>
                            </div>
                            <div class="qna-detail-date"></div>
                        </div>
						</c:if>
						
                    </div>
                </td>
            </tr>
    
        </table>
    
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
		$(function () {
			$("#category-qna").css("font-weight", "700");
		});
	</script>
	
</body>
</html>
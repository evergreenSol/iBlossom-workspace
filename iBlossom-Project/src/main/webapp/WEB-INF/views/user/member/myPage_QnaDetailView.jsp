<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Membership</title>
<link href="resources/css/khs.css" rel="stylesheet">
<style>
    .balloon {
        position: relative;
        display: inline-block;
    }
 
    .balloon span {
        display: inline-block;
        padding: 15px;
        color: black;
        background: white;
        border-style: solid;
        border-radius: 20px;
        width : 500px;
        text-align:left;
        
    }
 
    .balloon:after {
        content: '';
        position: absolute;
        width: 0;
        height: 0;
        border-style: solid;
    }
 
    .balloon.right:after, .balloon.left:after {
        border-width: 10px 15px;
        top: 50%;
        margin-top: -10px;
    }
 
    .balloon.left:after {
        border-color: transparent black transparent transparent;
        left: -27px;
    }
 
    .balloon.right:after {
        border-color: transparent transparent transparent black;
        right: -27px;
    }

    .qna-detail-content {
        margin-top: 50px;
        margin-bottom: 100px;
    }

    .qna-detail-date{
        margin: 0 20px;
    }
    
    .qna-detail-title {
    	font-size: 20px;
    	font-weight: 600;
    }

</style>
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
                        
                        <div class="qna-detail-title">제목: <span>${q.qnaTitle}<span></div>
                   		<div class="qna-detail-content" style="width: 100%" align="right">
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
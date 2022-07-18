<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Error</title>
<link href="${pageContext.request.contextPath}/resources/css/shj.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

    <!-- 헤더 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- error 에러페이지 -->
    <div id="error-wrap">

        <div id="error-div">
            <img src="${pageContext.request.contextPath}/resources/images/iBlossom-error.jpg" id="error-img"><br>
            <p id="error-title" style="margin-bottom: 15px;">Error</p>
            <hr class="error-hr" style="margin-bottom: 30px;">
            <p style="text-align: center; font-size: 13.5px;">
                요청하신 페이지를 찾을 수 없습니다.<br><br>
                고객센터 : <b>010-5273-5545</b><br>
                (운영시간: 09:30 ~ 12:20, 13:30 ~ 18:20)
            </p>
            <hr class="error-hr" style="margin-top: 30px;">

        </div>


    </div>
    
    <!-- 푸터 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
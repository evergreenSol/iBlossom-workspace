<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | findPwd</title>
<link href="resources/css/shj.css" rel="stylesheet">
</head>
<body>

 <!-- 헤더 -->
 <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="pwd-search-wrap" style="position:relative;">

        <!-- 비밀번호 찾기 폼 -->
        <div class="pwd-search-form-background" style="position:absolute;">
            <p id="pwd-search-id"><a href="findId.me" class="pwd-search-a-id">아이디 찾기</a></p>
            <p id="pwd-search-pwd"><a href="findPwd.me" class="pwd-search-a-pwd">비밀번호 찾기</a></p>
            <form class="pwd-search-form">
            <p id="pwd-search-p">
                아이디를 입력해주시면 회원정보에 등록된<br>
                이메일로 인증번호가 발송 됩니다.
            </p>
            <label id="pwd-search-label">아이디를 입력해주세요</label><br>
            <input type="text" id="pwd-search-email-input" placeholder="아이디 입력"><br>
            <button type="submit" id="pwd-search-button">확인</button>
            </form>
        </div>

    </div>
    
     <!-- 푸터 -->
 <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
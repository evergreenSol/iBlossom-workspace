<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | findId</title>
<link href="resources/css/shj.css" rel="stylesheet">
</head>
<body>

 <!-- 헤더 -->
 <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="id-search-wrap" style="position:relative;">

        <!-- 아이디 찾기 폼 -->
        <div class="id-search-form-background" style="position:absolute;">
            <p id="id-search-id"><a href="findId.me" class="id-search-a-id">아이디 찾기</a></p>
            <p id="id-search-pwd"><a href="findPwd.me" class="id-search-a-pwd">비밀번호 찾기</a></p>
            <form class="id-search-form">
            <p id="id-search-p">
                iBlossom 아이디를 모르시나요?<br>
                회원정보에 등록된 인증 수단으로 아이디를<br>
                찾을 수 있습니다.
            </p>
            <label id="id-search-label">내 정보에 등록된 인증 이메일로 찾기</label><br>
            <input type="email" id="id-search-email-input" placeholder="이메일 입력"><br>
            <button type="submit" id="id-search-button">확인</button>
            </form>
        </div>

    </div>
    
     <!-- 푸터 -->
 <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
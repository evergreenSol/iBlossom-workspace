<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="resources/css/shj.css" rel="stylesheet">
<link href="resources/css/header.css" rel="stylesheet">
<link href="resources/css/footer.css" rel="stylesheet">
</head>
<body>


 <!-- 헤더 -->
 <jsp:include page="/WEB-INF/views/common/header.jsp" />


	<!-- 로그인 영역 -->
    <div class="login-wrap" style="position:relative;">
       
        <div id="login-background">

            <!-- 새로고침 시 이미지 랜덤 -->
            <script type="text/javascript">
                var mb=new Array()
                mb[0]="<img src='resources/images/login-images-1.jpg' border='0'></a>";
                mb[1]="<img src='resources/images/login-images-2.jpg' border='0'></a>";
                mb[2]="<img src='resources/images/login-images-3.jpg' border='0'></a>";
                
                var whichquote=Math.floor(Math.random()*(mb.length))
                document.write(mb[whichquote])
                </script>

        </div>

        <!-- 로그인 폼 -->
        <div class="login-form-background" style="position:absolute;">
            <span id="login-form-login">로그인</span><br>
            <form action="login.me" method="post" class="login-form">
                <input type="text" id="login-id-input" name="userId" placeholder="아이디"><br>
                <input type="password" id="login-pwd-input" name="userPwd" placeholder="비밀번호"><br>
                <span class="login-id-pwd-search"><a href="" class="login-id-pwd-search">아이디 | 비밀번호 찾기</a></span>
                <button type="submit" id="login-loginbutton">로그인</button><br>
                <span id="login-signup-text1">아직 iBlossom 회원이 아니신가요?</span>
                <a href="enrollForm.me" id="login-signup-text2">회원가입</a>
            </form>

        </div>
    </div>
    
    
    <!-- 푸터 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    
    <script>
          
       function checklogin() {
          var form = document.loginForm;
          
             if(form.userId.value == "") {
                alert('아이디를 입력해주세요.');
                form.userId.focus();
                return false;
             } else if(form.useerPwd.value == "") {
                alert('비밀번호를 입력해주세요.');
                form.userPwd.focus();
                return false;
             }
             form.submit();
       }

    </script>

</body>
</html>
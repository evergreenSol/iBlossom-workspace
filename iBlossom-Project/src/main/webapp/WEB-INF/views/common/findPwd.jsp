<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | FindPwd</title>
<link href="resources/css/shj.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

	 <!-- 헤더 -->
	 <jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- 비밀번호 찾기 영역 -->
    <div class="pwd-search-wrap" style="position:relative;">

        <!-- 비밀번호 찾기 폼 -->
        <div class="pwd-search-form-background" style="position:absolute;">
            <p id="pwd-search-id"><a href="findId.me" class="pwd-search-a-id">아이디 찾기</a></p>
            <p id="pwd-search-pwd"><a href="findPwdForm.me" class="pwd-search-a-pwd">비밀번호 찾기</a></p>
            <form class="pwd-search-form">
            <p id="pwd-search-p">
                아이디를 입력해주시면 회원정보에 등록된<br>
                이메일로 인증번호가 발송 됩니다.
            </p>
            <label id="pwd-search-label">아이디를 입력해주세요</label><br>
            <input type="text" id="pwd-search-email-input" placeholder="아이디 입력"><br>
            <button type="button" id="pwd-search-button">확인</button>
            <!-- <input type="hidden" id="signUp-input-email">  -->
            </form>
        </div>

    </div>
    
	 <!-- 푸터 -->
	 <jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- 비밀번호 찾기 스크립트 -->
	<script>
	$("#pwd-search-button").click(function () {
	    
	    if($("#pwd-search-email-input").val() != "") {
	       
	       regExp = /^[A-za-z0-9+]{6,12}$/;
	        
	       if(!regExp.test($("#pwd-search-email-input").val())){
	           alert("유효한 아이디를 입력해주세요.");
	       }
	        else {
	           
	        $.ajax({
	           url : "sendPw.do",
	           data : {
	              recipient : $('#pwd-search-email-input').val(),
	              Id : $("#pwd-search-email-input").val(),
	              subject : "iBlossom 임시 비밀번호입니다.",
	              body : "임시비밀번호 : [ ",
	              endBody : " ] 입니다."
	           },
	           
	           success : function (result) {
	
	/*                alert("메일이 발송되었습니다. 확인해주세요.");
	               location.href = 'loginForm.me'; */
	               
	               if(result == "false"){
	        		   alert("아이디를다시 확인해주세요.");
	        		   
	        	   }else{
	        		   alert("메일이 발송되었습니다. 확인해주세요.");
	        		   location.href = 'loginForm.me';
	        	   }
	            },
	           
	           error: function () {
	              console.log("실패");
	           }
	        });
	        }
	    }
	    else {
	       alert("아이디를 입력해주세요.");
	    }
	    
	  
	 });
	
	</script>
	
</body>
</html>
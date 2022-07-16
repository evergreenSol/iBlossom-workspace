<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | FindId</title>
<link href="resources/css/shj.css" rel="stylesheet"><!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

	 <!-- 헤더 -->
	 <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="id-search-wrap" style="position:relative;">

        <!-- 아이디 찾기 폼 -->
        <div class="id-search-form-background" style="position:absolute;">
            <p id="id-search-id"><a href="findId.me" class="id-search-a-id">아이디 찾기</a></p>
            <p id="id-search-pwd"><a href="findPwdForm.me" class="id-search-a-pwd">비밀번호 찾기</a></p>
            <form class="id-search-form">
            <p id="id-search-p">
                iBlossom 아이디를 모르시나요?<br>
                회원정보에 등록된 인증 수단으로 아이디를<br>
                찾을 수 있습니다.
            </p>
            <label id="id-search-label">내 정보에 등록된 인증 이메일로 찾기</label><br>
            <input type="email" id="id-search-email-input" placeholder="이메일 입력"><br>
            <button type="button" id="id-search-button">확인</button>
            </form>
        </div>

    </div>
    
     <!-- 푸터 -->
	 <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <!-- 아이디 찾기 스크립트 -->
    <script>
    $("#id-search-button").click(function () {
        
    	var email =  $('#id-search-email-input').val();
    	console.log(email);
        if(email=="") {
           
        	alert("이메일을 입력해주세요.");
        } else {
              
            $.ajax({
               url : "sendId.do",
               data : {
                  recipient : email,
                  subject : "[iBlossom] 아이디 찾기 서비스",
                  body : " 아이디는 : [ ",
                  endBody : " ] 입니다."
               },
               success : function (result) {
            	   
/*                    alert("메일이 발송되었습니다. 확인해주세요.");
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
        
      
     });
    </script>

</body>
</html>
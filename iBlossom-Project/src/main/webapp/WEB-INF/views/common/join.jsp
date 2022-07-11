<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>join</title>
    <link href="resources/css/shj.css" rel="stylesheet">
</head>
<body>

 <!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="signUp-wrap" style="position:relative;">

        <div id="signUp-background">

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
        
        <!-- 회원가입 폼 -->
        <div class="signUp-form-background" style="position:absolute;">

            <span id="signUp-form-signUp">회원가입</span><br>

            <form action="insert.me" method="post" class="signUp-form">

	            <label class="signUp-form-label">이름</label>
	            <input type="text" class="signUp-input" id="customer_name" name="userName" placeholder="이름 입력" required><br>
	
	            <label class="signUp-form-label">아이디</label>
	            <input type="text" class="signUp-input" id="customer_id" name="userId" placeholder="아이디 입력" required><br>
	            <p id="duplicate-check"></p>
	
	            <label class="signUp-form-label">비밀번호</label>
	            <input type="password" class="signUp-input" id="customer_pwd" name="userPwd" placeholder="비밀번호 입력" required><br>
	
	            <label class="signUp-form-label">비밀번호 확인</label>
	            <input type="password" class="signUp-input" id="customer_chkpwd" placeholder="비밀번호 확인" required><br>
	
	            <label class="signUp-form-label">이메일</label><br>
	            <input type="email" id="signUp-input-email" name="email" placeholder="이메일 입력" required>
	            <button type="button" id="signUp-signUpbutton">전송</button><br>
	            
	            <label class="signUp-form-label">이메일 인증</label>
	            <input type="text" class="signUp-input" id="chkAuthKey" placeholder="인증번호 6자리를 입력해주세요." maxlength="6"><br>
	            <span id="mail-check-warn"></span>
	
	            <button type="button" id="signUp-cancelbutton">취소</button>
	            <button type="submit" id="signUp-signupbutton" disabled onclick="return validate();">가입</button>
	
	
	            <span id="signUp-logintext">이미 iBlossom의 회원이신가요?</span><br>
	            <button type="button" id="signUp-loginbutton">로그인</button>
            </form>

        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


    <script>
    var key;
    var regExp;
    var emailChk = 0;
    var idChk = 0;
    var pwdChk1 = 0;
    var pwdChk2 = 0;
    var nameChk = 0;
    
    $(function () {
    	
    	$("#signUp-loginbutton").click(function () {
    		location.href="loginForm.me";
    	});
    	
    	
       $("#duplicate-check").hide();
       
       $("#mail-check-warn").hide();
        
         
         $("#signUp-signUpbutton").click(function () {
            
            if($("#signUp-input-email").val() != "") {
               
               regExp = /^[0-9a-zA-Z]([-_.]?[0-9A-Za-z])*@[0-9a-zA-Z]([-_.]?[0-9A-Za-z])*.[a-zA-Z]{2,3}$/i;
                
               if(!regExp.test($("#signUp-input-email").val())){
                   alert("유효한 이메일을 입력해주세요.");
               }
               else {
                	
                	// 이메일 중복 확인
                	$.ajax({
                		url : "checkEmail.me",
                		data : {
                			email : $("#signUp-input-email").val()
                		},
                		success : function (result) {
                			var count = result;
                			
                			if(count > 0) {
                				alert("중복된 이메일 입니다. 다시 입력해주세요.");
                				$("#signUp-input-email").focus();
                				$("#signUp-input-email").val("");
                			}
                			else {
                				
                				 $.ajax({
              	                   url : "sendEmail.do",
              	                   data : {
              	                      recipient : $('#signUp-input-email').val(),
              	                      subject : "iBlossom 이메일 인증 메일입니다.",
              	                      body : "이메일 인증 코드 : "
              	                   },
              	                   success : function (result) {
              	                      alert("메일이 발송되었습니다. 확인해주세요.");
              	                      console.log(result);
              	                      
              	                      key = result;
              	                   },
              	                   error: function () {
              	                      console.log("실패");
              	                   }
              	                });
                				
                			}
                			
                		},
                		error : function () {
                			
                		}
                	});
                   
                }
            }
            else {
               alert("이메일을 입력해주세요.");
            }
            
          
         });
         
         $("#chkAuthKey").keyup(function () {
            
            if(key == $("#chkAuthKey").val()) {
               $("#mail-check-warn").text("이메일이 인증되었습니다.");
               $("#signUp-signupbutton").attr("disabled", false);
               $("#mail-check-warn").show();
               emailChk = 1;
            }
            else {
               $("#mail-check-warn").text("인증코드가 다릅니다.");
               $("#signUp-signupbutton").attr("disabled", true);
               $("#mail-check-warn").show();
               emailChk = 0;
            }
         });
       
       $("#customer_id").keyup(function (){
           var MBER_ID = $("#customer_id").val();
           regExp = /^[A-za-z0-9+]{6,12}$/; 
           $.ajax({
                type : "POST",
                data : {
                    userId : MBER_ID
                },
                url : "checkId.me",
                success : function(result) {
                    // console.log(result);
                   var cnt = result;
                    if (cnt > 0) {
                       /*$("#customer_id").next().removeClass("green");
                        $("#customer_id").next().addClass("red");*/
                        $("#customer_id").next().next().text("중복된 아이디입니다.");
                        $("#customer_id").next().next().show();
                        $("#signUp-signupbutton").attr("disabled", true);
                        idChk = 0;
                    } else {
                        if (MBER_ID == "") {
                           /*$("#customer_id").next().removeClass("green");
                            $("#customer_id").next().addClass("red");*/
                            $("#customer_id").next().next().text("아이디를 입력해주세요.");
                            $("#customer_id").next().next().show();
                            $("#signUp-signupbutton").attr("disabled", true);
                            idChk = 0;
                        } else if (regExp.test(MBER_ID)) {
                           /*$("#customer_id").next().removeClass("red");
                            $("#customer_id").next().addClass("green");*/
                            $("#customer_id").next().next().text("사용가능한 아이디입니다.");
                            $("#customer_id").next().next().show();
                            $("#signUp-signupbutton").attr("disabled", false);
                            idChk = 1;
                        } else {
                           /*$("#customer_id").next().removeClass("green");
                            $("#customer_id").next().addClass("red");*/
                            $("#customer_id").next().next().text("유효하지않은 아이디입니다. (영문, 숫자 포함 6~12자리로 입력해주세요.)");
                            $("#customer_id").next().next().show();
                            $("#signUp-signupbutton").attr("disabled", true);
                            idChk = 0;
                        }
                    }
                    
                },
                complete : function(data) {
                },
                error : function(request, status, error) {
                }
                });
       });
       
       $("#customer_pwd").keyup(function () {
          regExp = /^[a-zA-Z0-9`~!@#$%^&*+=_-|₩';:₩"/?]{4,16}$/i;
          
          if(!regExp.test($("#customer_pwd").val())) { //유효하지 않은 경우

                pwdChk1 = 0;
            }
          else {
             pwdChk1 = 1;
          }
          // console.log(pwdChk)
       });
       
       
       $("#customer_chkpwd").keyup(function () {
          // regExp = /^[a-zA-Z0-9`~!@#$%^&*+=_-|₩';:₩"/?]{4,16}$/i;
          
          if($("#customer_chkpwd").val() != $("#customer_pwd").val()) { //유효하지 않은 경우

                pwdChk2 = 0;
            }
          else {
             pwdChk2 = 1;
          }
       });
       
       $("#customer_name").keyup(function () {
         regExp = /^[가-힣]{2,6}$/;
          
          if(!regExp.test($("#customer_name").val())) { //유효하지 않은 경우
                nameChk = 0;
            }
          else {
             nameChk = 1;
          }
       });
   
    });
    
    function validate() {
       
       console.log("이메일" + emailChk);
       console.log("아이디" + idChk);
       console.log("비번1" + pwdChk1);
       console.log("비번2" + pwdChk2);
       console.log("이름" + nameChk);
       
       
       if(emailChk * idChk * pwdChk1 * pwdChk2 * nameChk == 1) {
          return true;
       }
       else {
          if(nameChk != 1) {
             alert("아이디는 한글로 총 2~6글자로 입력해주세요.");
          }
          
          if(idChk != 1) {
             alert("아이디는 영문자(소문자), 숫자로 총 6~12글자로 입력해주세요.");
          }
          
          if(pwdChk1 != 1) {
             alert("비밀번호는 영문자, 숫자, 특수기호로 총 4~16글자로 입력해주세요.");
          }
          else {
             if(pwdChk2 != 1) {
                alert("동일한 비밀번호를 입력해주세요.");
             }
             else {
                if(emailChk != 1) {
                    alert("이메일 인증을 진행해주세요.");   
                 }
             }
          }
          
          return false;
       }
    }
    
    /*
    function oncheckId() {
        var MBER_ID = $("#customer_id").val();
        var regex = /^[A-za-z0-9+]{6,12}$/; 
        jQuery.ajax({
                type : "POST",
                data : {
                    MBER_ID : MBER_ID
                },
                url : "/join/checkId.do",
                dataType : "JSON",
                success : function(data) {
                    var cnt = data.chkCnt;
                    if (cnt > 0) {
                        $("#customer_id").next().removeClass("green");
                        $("#customer_id").next().addClass("red");
                        $("#customer_id").next().text("중복된 아이디입니다.");
                        $("#customer_id").next().show();
                        idcheck=false;
                    } else {
                        if (MBER_ID == "") {
                            $("#customer_id").next().removeClass("green");
                            $("#customer_id").next().addClass("red");
                            $("#customer_id").next().text("아이디를 입력해주세요.");
                            $("#customer_id").next().show();
                            idcheck=false;
                        } else if (regex.test(MBER_ID)) {
                            $("#customer_id").next().removeClass("red");
                            $("#customer_id").next().addClass("green");
                            $("#customer_id").next().text("사용가능한 아이디입니다.");
                            $("#customer_id").next().show();
                            idcheck=true;
                        } else {
                            $("#customer_id").next().removeClass("green");
                            $("#customer_id").next().addClass("red");
                            $("#customer_id").next().text("유효하지않은 아이디입니다. (영문,숫자포함 6~12자리로 입력해주세요)");
                            $("#customer_id").next().show();
                            idcheck=false;
                        }
                    }
                    
                },
                complete : function(data) {
                },
                error : function(request, status, error) {
                }
                });

    }

    */
    </script>
    
</body>
</html>
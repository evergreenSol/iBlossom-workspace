<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>join</title>
    <link href="resources/css/shj.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

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

            <form class="signUp-form">

            <label class="signUp-form-label">이름</label>
            <input type="text" class="signUp-input" placeholder="이름 입력"><br>

            <label class="signUp-form-label">아이디</label>
            <input type="text" class="signUp-input" id="customer_id" placeholder="아이디 입력"><br>

            <label class="signUp-form-label">비밀번호</label>
            <input type="password" class="signUp-input" placeholder="비밀번호 입력"><br>

            <label class="signUp-form-label">비밀번호 확인</label>
            <input type="password" class="signUp-input" placeholder="비밀번호 확인"><br>

            <label class="signUp-form-label">이메일</label><br>
            <input type="email" id="signUp-input-email" placeholder="이메일 입력">
            <button type="button" id="signUp-signUpbutton">전송</button>
            
            <label class="signUp-form-label">이메일 인증</label>
            <input type="text" class="signUp-input" placeholder="인증번호 6자리를 입력해주세요." maxlength="6"><br>
            <span id="mail-check-warn"></span>

            <button type="button" id="signUp-cancelbutton">취소</button>
            <button type="submit" id="signUp-signupbutton">가입</button>

            </form>

            <span id="signUp-logintext">이미 iBlossom의 회원이신가요?</span><br>
            <button type="button" id="signUp-loginbutton">로그인</button>

        </div>
    </div>


    <script>

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

    </script>
    
    

  

    
</body>
</html>
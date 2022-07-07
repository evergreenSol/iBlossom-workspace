<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Membership</title>
<link href="resources/css/khs.css" rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                    <p id="revise-form-p-title">프로필 수정</p>
                        <!-- <hr color="lightgray"> -->
                        <!--
                        <table style="text-align: center">
                            <tr>
                                <td height="300" width="900" >주문내역이 없습니다.</td>
                            </tr>
                        </table>
                        -->
                        <br>
                        <form id="update-form" action="update.me" method="post">
                        
	                        <p class="revise-form-p">이름</p>
	                        <input type="text" class="mypage-w" name="userName" value="${ loginUser.userName }">
	
	                        <p class="revise-form-p">아이디</p>
	                        <input type="text" class="mypage-w" name="userId" readonly value="${ loginUser.userId }">
	                        
	                        <input type="hidden" name="userPwd" value="${ loginUser.userPwd }">
	
	                        <p class="revise-form-p">신규 비밀번호</p>
	                        <input type="password" id="newUserPwd" class="mypage-w" name="newUserPwd" value="">
	
							<p class="revise-form-p">신규 비밀번호 확인</p>
	                        <input type="password" class="mypage-w" name="chkPwd" value="">
	
	                        <p class="revise-form-p">휴대폰번호</p>
	                        <input type="text" class="mypage-w" id="phone" name="phone" value="${ loginUser.phone }" placeholder="-포함하여입력해주세요" maxlength="13">
	
	                        <p class="revise-form-p">우편번호</p>
	                        <input type="text" class="mypage-w" id="postcode_kakao" name="postcode" readonly value="${ loginUser.postcode }" >
	
	                        <p class="revise-form-p">주소</p>
	                        <input type="text" class="mypage-w" id="address_kakao" name="address1" value="${ loginUser.address1 }" readonly>
	
	                        <p class="revise-form-p">상세주소</p>
	                        <input type="text" class="mypage-w address_detail" name="address2" id="address_detail" onkeyup="eventKeyup(this.value)" value="${ loginUser.address2 }">
	                        
	                        <input type="hidden" name="address" id="address" value="${ loginUser.address }">
	                        <input type="hidden" name="email"  value="${ loginUser.email }">
	                        <input type="hidden" name="enrollDate"  value="${ loginUser.enrollDate }">
	                        <input type="hidden" name="status"  value="${ loginUser.status }">
	                        <input type="hidden" name="purchase"  value="${ loginUser.purchase }">
	                        <input type="hidden" name="grLevel"  value="${ loginUser.grLevel }">
	
	                        <br><br><br>
	                        <div class="mypage-revise-wrap" align="center">
	                            <button type="button" class="mypage-revise" onclick="location.href='deleteForm.me';">탈퇴하기</button>
	                            <button type="submit" class="mypage-revise" onclick="return validate();">수정하기</button>
	                        </div>
                        </form>

                    </div>
			
                </td>
            </tr>
    
        </table>
    
    </div>
    
    <br><br>

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
    
    var regExp;
    
        window.onload = function(){
            document.getElementById("postcode_kakao").addEventListener("click", function(){ // postcode입력칸을 클릭하면
                //카카오 지도 발생
                new daum.Postcode({
                    oncomplete: function(data) { //선택시 입력값 세팅

                        document.getElementById("postcode_kakao").value = data.zonecode; // 우편번호 넣기
                        document.getElementById("address_kakao").value = data.address; // 주소 넣기
                        // document.getElementById("address").value = data.address; // 합치기 위한 주소 넣기
                        document.querySelector("input[id=address_detail]").focus(); //상세입력 포커싱
                    }
                }).open();
            });
        }
        
        function eventKeyup(str){
			$("#address").val($("#address_kakao").val() + " " + str);

    	}
        
        function validate() {
        	
        	var phone = document.getElementById("phone").value;
        	var newUserPwd = document.getElementById("newUserPwd").value;
			console.log(phone);
			
			//핸드폰 검사
			regExp = /^010-[0-9]{4}-[0-9]{4}$/;
			if(!regExp.test(phone)){ //핸드폰 번호가 유효하지 않을 경우
				
				alert("유효한 핸드폰 번호 양식이 아닙니다. - 포함해서 입력해 주세요.");
			
				document.getElementById("phone").value = phone;
				document.getElementById("phone").focus();
	
				return false;
			}
			
			
			// 비밀번호 검사
			// 새 비번 안쓴 경우 true
			if($("input[name=newUserPwd]").val() == "") {
				
				// 기존 name이 userPwd인 값이 넘어감.
				return true;
			}
			else {
				
				regExp = /^[a-zA-Z0-9`~!@#$%^&*+=_-|₩';:₩"/?]{4,16}$/i;
				if(!regExp.test(newUserPwd)) {
					alert("비밀번호는 영문자, 숫자, 특수기호로 총 4~16글자로 입력해주세요.");
					
					return false;
				}
				else {
					
					if($("input[name=newUserPwd]").val() != $("input[name=chkPwd]").val()) {
						// 새 비번과 새비번(확인)이 같지 않을 경우
						
						
						alert("새 비밀번호가 일치하지 않습니다.");
						$("input[name=newUserPwd]").focus();

						return false;
					}
					
					if($("input[name=userPwd]").val() == $("input[name=newUserPwd]").val()) {
						// 현재 비번과 새 비번이 같을 경우
						
						alert("기존 비밀번호와 일치합니다.");
						$("input[name=newUserPwd]").focus();

						return false;
					}
					
					if($("input[name=newUserPwd]").val() == $("input[name=chkPwd]").val()) {
						
						// userPwd 값에 대입
						$("input[name=userPwd]").val($("input[name=chkPwd]").val());
						console.log($("input[name=userPwd]").val());
						return true;
					}
					
				}
				
			}
			
			
			/*
			regExp = /^[a-zA-Z0-9`~!@#$%^&*+=_-|₩';:₩"/?]{4,16}$/i;
			if(!regExp.test(newUserPwd)) {
				alert("비밀번호는 영문자, 숫자, 특수기호로 총 4~16글자로 입력해주세요.");
				
				return false;
			}
			
			if($("input[name=newUserPwd]").val() != $("input[name=chkPwd]").val()) {
				// 새 비번과 새비번(확인)이 같지 않을 경우
				
				
				alert("새 비밀번호가 일치하지 않습니다.");
				$("input[name=newUserPwd]").focus();

				return false;
			}
			
			if($("input[name=userPwd]").val() == $("input[name=newUserPwd]").val()) {
				// 현재 비번과 새 비번이 같을 경우
				
				alert("기존 비밀번호와 일치합니다.");
				$("input[name=newUserPwd]").focus();

				return false;
			}
			
			if($("input[name=newUserPwd]").val() == $("input[name=chkPwd]").val()) {
				
				// userPwd 값에 대입
				$("input[name=userPwd]").val($("input[name=chkPwd]").val());
				console.log($("input[name=userPwd]").val());
				return true;
			}
			*/
        	
        }
    </script>

    
</body>
</html>
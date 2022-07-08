<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Membership</title>
<link href="resources/css/khs.css" rel="stylesheet">
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
                    	<h2>회원 탈퇴</h2>
                  
                        <table>	
							<tr>
								<td style="text-align: left" colspan="2">
									서비스 탈퇴 시 고객님의 회원정보 및 활동내역이 모두 삭제되며<br><br>
									한 번 삭제된 정보는 복구하실 수 없습니다.<br><br>
									불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 <br><br>
									회원님의 불편함을 해결해드리도록 노력하겠습니다.
								</td>
							</tr>
						</table>
						
						<br>

						<form id="frm" action="delete.me" method="post">
                        <p style="font-size: 14px; font-weight: 600;">비밀번호</p>
                        <input type="password" class="mypage-w" name="userPwd">

                        <br> <br> <br>

                        <div class="mypage-revise-wrap" align="center">
	                            <button type="button" class="mypage-revise">취소하기</button>
	                            <button type="submit" class="mypage-revise">탈퇴하기</button>
	                    </div>
						</form>

                    </div>
			
                </td>
            </tr>
    
        </table>
    
    </div>
    
    <br><br>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
</body>
</html>
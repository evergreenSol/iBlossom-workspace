<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/kms.css" rel="stylesheet">
    <!-- 파비콘 -->
	<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
	<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
    <title>admin | 1:1 Inquiry</title>
    <style>

    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
     <div id="content-wrap">
        <div id="content">
            <div id="content_1" style="padding:10px">
                <ul id="leftNavi1">
                    <b style="font-size:25px;">고객센터</b>
                    <br><br>
                    <!-- <hr color="black" style="border: 1px solid black"> -->
                    <li class="left_menu">
                        <a href="listView.no">
                            <span class="category-content">공지사항</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                    <li class="left_menu" >
                        <a href="contactus.no">
                            <span class="category-content">Contact Us</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                    <li class="left_menu">
                        <a href="qnaForm.qu">
                            <span class="category-content" style="font-weight : 700;">1:1 문의</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                    <li class="left_menu">
                        <a href="faq.no">
                            <span class="category-content">FAQ</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                </ul>               
            </div>           
        </div>
	
		<form id="answer-container" method="post" action="insert.qu">
			<p id="ans" style="font-size: 23px; font-weight: 700;">문의하기</p><br>
			<table id="anwcontent" border="1" style="border-collapse: collapse; ">
			 <div>
			 	<c:choose>
                    <c:when test="${ empty loginUser }">
						<label for="title" style="font-size: 18px; font-weight: 700;">제목</label><br><br>
						<input type="text" id="qnaTitle" name="qnaTitle" style="width:695px; height:35px; font-size:16px; outline:none;" maxlength="50" readonly>
			 </div>
		      </c:when>
            <c:otherwise>	
            			<label for="title" style="font-size: 18px; font-weight: 700;">제목</label><br><br>
						<input type="text" id="qnaTitle" name="qnaTitle" style="width:695px; height:35px; font-size:16px; outline:none;" maxlength="50" required>
				 </div>
			  </c:otherwise>
            </c:choose>
            <br>
				<div id="anwcontent">
				<c:choose>
                    <c:when test="${ empty loginUser }">
		            	<label for="content" style="font-size: 18px; font-weight: 700;">내용</label><br><br>	
								<p style="height:200px; margin:0px; padding:0px;"><textarea id="qnaContent" name="qnaContent"  cols="87" rows="10.5" maxlength="700"
									style="resize:none; font-size:16px; width:695px;" readonly>로그인한 사용자만 이용 가능한 서비스입니다. 로그인 후 이용 바랍니다.</textarea></p>
                        </div>
                  		</c:when>
             		<c:otherwise>
		            	<label for="content" style="font-size: 18px; font-weight: 700;">내용</label><br><br>	
								<p style="height:200px; margin:0px; padding:0px;"><textarea id="qnaContent" name="qnaContent"  cols="87" rows="10.5" maxlength="700"
									style="resize:none; font-size:16px; width:695px;" required></textarea></p>
                        </div>	
               		</c:otherwise>
               	</c:choose>
				</tr>         
			</table>
			<c:if test="${ loginUser != null }">
				<button id="questionBtn" type="submit">작성하기</button>
			</c:if>	
		</form>  
    </div>

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
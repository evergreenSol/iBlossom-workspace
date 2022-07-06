<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/kms.css" rel="stylesheet">
    <title>Document</title>
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
                        <a href="qnaList.qu">
                            <span class="category-content">1대1 문의</span>
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
	
		<div id="answer-container">
			<table id="anwcontent" border="1">
				<p id="ans" style="font-size: 20px; font-weight: 700;">문의하기</p>
				<tr>
					<th width="120" height="40" style="font-size: 16px;">제목</th>
					<td width="450" ><input type="text" id="answerTitle" style="border:none" style="width:400px;font-size: 15px;" maxlength="50" required></td>

				</tr>
				<tr>
					<th style="font-size: 16px;">내용</th>
					<td id="anwcontent" colspan="3">
						<p style="height:200px;"><textarea name="answerContent" id="answerContent" cols="55" rows="13" maxlength="700"
							style="resize:none; border: none;" style="font-size: 15px;" required></textarea></p>
					</td>
				</tr>
				<tr>
					<th height="30">답변</th>
					<td colspan="3"></td>               
				</tr>           
			</table>
			<button id="questionBtn" type="submit">확인</button>
		</div>    
    </div>

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="resources/css/kms.css" rel="stylesheet">
    <title>iBlossom | Class</title>
    <style>

    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="class-container-wrap">
	    <div class="class-container">
	        <div id="image" style="float: left;">
	            <img src="resources/images/onedayclass_main.jpg" >
	        </div>
	        <div id="title1">
	            <p style="font-size: 25px; font-weight: 700;">원데이 클래스</p>
	            <p style="font-size: 20px; font-weight: 700; margin-bottom: 10px;">60,000원 </p> <span style="text-decoration:line-through;">80,000원</span> <span id="sale" class="">Sale</span>
	            <hr width="550px">
	            <pre style="font-size: 15px; line-height: 1.3;">
5인 이하 소수 정원 진행합니다.
그 계절 가장 예쁜 꽃을 만나 볼 수 있는 원데이 클래스 수업입니다.
가볍게 배워보실 수 있도록 핸드타이/바스켓/박스 등 여러 과목이 준비되어 있습니다.
	            </pre>
	        </div>
	        <form action="ResForm.cl" method="post">
		        <div>		   
		            <label for="date" id="res" style="font-size: 15px;">예약일</label><br>
		            	<select name="classNo" id="date" style="width:190px;height:25px;font-size: 14px;" onchange="classCap();" required >
			                <c:forEach var="c" items="${ list }">
			                <c:choose>
			                
				                <c:when test="${ c.resNum >= 5 }">
				                	<option value="${ c.classNo }" disabled>${ c.classDate } (마감되었습니다.)</option>
				                </c:when>
				                <c:otherwise>
				                	<option value="${ c.classNo }">${ c.classDate }</option>
				                </c:otherwise>
			                </c:choose>

			                <!-- 리스트에 클래스 정보 담아서 (게시판 내용과 같음) 반복문으로 돌리기(?) -->
			                 </c:forEach>
			            </select>
			        </div>
		        <br><br><br>
	        	<div>
		            <button type="submit" id="class-res-btn" onclick="return reservation();">예약하기</button>
		        </div>
	        </form>

	        
	    </div>
	    <br><br><br><br><br><br><br><br><br><br><br><br>
	    <div id="image2">
	        <img src="resources/images/onedayclass_detail-1.png" width="1200px">
	        <img src="resources/images/onedayclass_detail-2.png" width="1200px">
	    </div>     
     </div>
     <br><br>
     
     <script>
     	function reservation(){
     		let loginUser = "${loginUser}";
     		if (loginUser == "") {
     				alert("예약페이지는 로그인 후 사용하실 수 있습니다.");
					return false;
     		} else {
     				return true;
     		}
     	}
     </script>
      
  
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
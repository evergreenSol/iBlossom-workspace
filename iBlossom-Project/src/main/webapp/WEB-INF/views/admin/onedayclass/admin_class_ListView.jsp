<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin | 원데이클래스</title>
    <link href="resources/css/shj.css" rel="stylesheet">
    <link href="resources/css/kms.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- 파비콘 -->
	<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
	<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

    <!-- admin 어드민 관리자 메뉴 wrap -->
    <div id="admin-menu-wrap">

        <!-- 메뉴 첫번째줄 div -->
        <div id="admin-menu-1">

           <!-- 로고 -->
            <div id="admin-logo-div">
                <a href="${ pageContext.request.contextPath }/" id="admin-logo-a">
                    <img src="resources/images/iBlossom_logo_black.png">
                 </a>
             </div>

            <!-- 로그인 div -->
            <div id="admin-login-div">

                <span id="admin-login-text">admin</span>

                <!-- 로그인 아이콘  -->
                <a href="logout.me" id="admin-login-a">
                    <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-person-fill" viewBox="0 0 16 16">
                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                    </svg>
                </a>
            </div>
        </div>

        <!-- 메뉴 두번째줄 div -->
        <div id="admin-menu-2">

            <!-- 메뉴 div -->
            <div id="admin-navi-div">

                <!-- 메뉴 -->
                <ul id="admin-navi">
                    <li><a href="list.me" class="admin-navi-menu">회원관리</a></li>
                    <li>
                        <a href="adminList.or" class="admin-navi-menu">주문정보관리</a>
                    </li>
                    <li>
                        <a href="subMemberListView.su" class="admin-navi-menu">정기구독관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="subMemberListView.su">구독회원관리</a></li>
                            <li><a href="listView.sp">구독상품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="list.pr" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="list.re" class="admin-navi-menu">리뷰관리</a></li>
                    <li><a href="classList.ad" class="admin-navi-menu" style="font-weight: 700;">클래스관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="classAddForm.ad">클래스 추가</a></li>
                            <li><a href="classList.ad">클래스 예약내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="qnaList.ad" class="admin-navi-menu" >고객센터관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="qnaList.ad">1:1 문의</a></li>
                            <li><a href="noticeList.ad">공지사항</a></li>
                        </ul>
                    </li>
                    <li><a href="https://dashboard.tawk.to/#/monitoring" target="_blank" class="admin-navi-menu" id="admin-navi-chat">채팅관리</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- admin 관리자페이지 회원관리 -->
    <div id="admin-member-wrap">

        <span id="admin-member-title">클래스 전체리스트</span>
        <hr id="admin-member-hr" style="border-width:1px 0px 0px 0px;">

        <div>
            
            <table id="admin-order-list-table">
                <!-- 메뉴바 -->
                <thead id="admin-order-list-thead">
                    <tr >
                        <th width="80">클래스번호</th>
                        <th width="150">클래스명</th>
                        <th width="120">결제금액</th>
                        <th width="160">수업일</th>
                        <th width="80">정원</th>
                        <th width="80">신청인원</th>
                        <th width="80">진행상태</th>
                        <th width="80">삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${ list }">
                    <tr>
                        <td>${ c.classNo }</td>
                        <td>${ c.className }</td>
                        <td>${ c.price }</td>
                        <td>${ c.classDate }</td>
                        <td>${ c.capNo }</td>
                        <td>${ c.resNum }</td>
                        <td>${ c.classStatus }</td>
                        <td><button type="submit" onclick="deleteClass(${ c.classNo });">삭제</button></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>           
        </div>
    </div>
    
		<script>
        	$(function() {        		
        		$("#admin-order-list-table>tbody>tr").click(function(){
        			console.log("클릭됨");
        			console.log($(this).children().eq(0).text());
        			location.href = "resList.ad?classNo=" + $(this).children().eq(0).text();        			
        		});
        	});
        </script>
        
     <script>
	    function deleteClass(classNo) {
	
	  	  console.log(classNo);
	  	  
	  	  $.ajax({
	  		url : "deleteClass.ad",
	  		type : "post",
	  		data : { classNo : classNo },
	  		success : function(result) {
	  			console.log(result);
	  			if(result == "성공") {
	  				alert("클래스 삭제에 성공했습니다.");
	  				location.href="classList.ad";
	  				
	  			}
	  			else{
	  				alert("클래스 삭제에 실패했습니다.");	
	  			}
	  		},
	  		error : function(result) {
	  			console.log(result);
	  			console.log("ajax 통신 실패");
	  		}
	  	})  
	    }
    </script>

</body>
</html>
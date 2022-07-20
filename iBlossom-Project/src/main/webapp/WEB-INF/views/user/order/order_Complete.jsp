<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Order Complete</title>
<link href="resources/css/ldo-user.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <br>
    
    <!-- 사용자 결제완료 페이지  -->
    <div class="complete-outer">

        <br><br>

        <p class="order-title">&nbsp;주문/결제</p>

        <!-- 레이아웃 -->
        <div>

            <!-- 하얀색 박스 틀 -->
            <div class="complete-whitebox">

                    <!-- 회색 박스 틀-->
                    <div class="complete-graybox">

                        <div class="complete-graybox-div"><br>

                            <!-- 체크 이미지 -->
                            <div>
                           		<img src="resources/images/iBlossom-error.jpg" style="width:52px; height:52px;">
                            </div>

                            <!-- 멘트 -->
                            <div style="font-weight:bold; font-size:large;">
                            	${ loginUser.userName } 님의 주문이 완료되었습니다.
                            </div><br>

                            <!-- 주문번호 -->
                            <div class="complete-graybox-num">
                            	주문번호 : ${ orderNo }
                            </div>

                        </div> 

                    </div>

                    <!-- 회색박스 아래 멘트 -->
                    <p>- 주문 상세내역은 [마이페이지 > 주문내역] 에서 조회 가능합니다.</p><br>

                    <!-- 버튼 두개 -->
                    <div class="complete-two-btn">

                        <!-- 경로 : 마이페이지 > 주문 내역 조회 -->
                        <button class="complete-two-btn1" type="button" onclick="location.href='orderListView.me'">주문 내역 조회</button>
                        
                        <!-- 경로 : 마켓 -->
                        <button class="complete-two-btn2" type="button" onclick="location.href='flowerList.pr'">쇼핑하러 가기</button>
                    
                    </div> 

                </div>

            </div>
            
        </div>
        
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_Order_Complete</title>
<link href="resources/css/ldo.css" rel="stylesheet">
<style>

    /* 사용자 결제완료 페이지 */

    /* 전체 배경 색입히기 */
    .complete-outer { 
        background-color: whitesmoke; 
        width: 100%; 
        height: 620px;
        margin: auto;
    }

    /* 하얀 네모박스 영역 */
    .complete-whitebox { 
        background-color:white; 
        width: 1200px;
        height: 390px;
        padding: 20px;
        padding-left: 20px;
        text-align: center;
        margin: auto; /*가운데 정렬*/
    }

    /* 회색 네모박스 영역 */
    .complete-graybox { 
        background-color: rgba(231, 231, 231, 0.738);
        display: inline-block;
        width: 1100px;
        height: 220px;
        text-align: center;
        margin-top: 40px;
    }
    
    /* 회색 네모박스 안에 내용물 감싸는 틀 */
    .complete-graybox-div { 
        width: 300px; 
        margin: auto;
        margin-top: 15px; 
    } 
    
    /* 주문번호 div */
    .complete-graybox-num { 
        background-color: white;
        padding: 14px;
        border-radius: 20px;
     }

     /* 버튼 두개 감싸는 div */
    .order-two-btn { 
        text-align: center; /* 가운데정렬 */ 
    } 

     /* 버튼 두개 */
    .complete-two-btn1 { 
        width: 120px; height: 35px; 
        color: white;
        border-radius: 3px;
        border: none;
        background-color: rgb(87, 84, 84);
    }
    
    .complete-two-btn2 { 
        width: 120px; height: 35px;
        color: white; 
        border-radius: 3px;
        border: none;
        background-color: rgb(28, 26, 26); 
    }
    
    .complete-two-btn1:hover, .complete-two-btn2:hover {
    	cursor: pointer;
    }
    
    /* 주문/결제 타이틀 */
    .order-title {
    	width: 1200px; 
    	margin: auto; 
    	margin-top: 15px; 
    	font-weight:700; 
    	font-size: 31px; 
    	margin-bottom:15px;
    }

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <br>
    
    <!-- 사용자 결제완료 페이지  -->

    <div class="complete-outer">

        <br><br>

        <p class="order-title">주문/결제</p>

        <!-- 레이아웃 -->
        <div>

            <!-- 하얀색 박스 틀 -->
            <div class="complete-whitebox">

                    <!-- 회색 박스 틀-->
                    <div class="complete-graybox">

                        <div class="complete-graybox-div">
                            <br>

                            <!-- 체크 이미지 -->
                            <div><img src="resources/images/order_complete_check.png" style="width:54px; height:54px;"></div>

                            <!-- 멘트 -->
                            <div style="font-weight:bold; font-size:medium;">아무개님의 주문이 완료되었습니다.</div><!-- ${m.userName} -->
                            <br>

                            <!-- 주문번호 -->
                            <div class="complete-graybox-num">주문번호 : 1</div> <!-- ${o.orderNo} -->
	
                        </div> 

                    </div>

                    <!-- 회색박스 아래 멘트 -->
                    <p>- 주문 상세내역은 [마이페이지 > 주문내역] 에서 조회 가능합니다.</p>

                    <br>

                    <!-- 버튼 두개 -->
                    <div class="complete-two-btn">

                        <!-- 경로 : 마이페이지 > 주문 내역 조회 -->
                        <button class="complete-two-btn1" type="button" onclick="location.href='adminList.or'">주문 내역 조회</button>
                        
                        <!-- 경로 : 마켓 -->
                        <button class="complete-two-btn2" type="button" onclick="location.href='adminDetail.or'">쇼핑하러 가기</button>
                    
                    </div> 

                </div>

            </div>
            
        </div>
        
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
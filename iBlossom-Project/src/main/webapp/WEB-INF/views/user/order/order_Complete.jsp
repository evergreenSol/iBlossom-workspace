<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order_Complete</title>
<link href="resources/css/ldo.css" rel="stylesheet">
<style>

    /* 사용자 결제완료 페이지 */

    /* 전체 배경 색입히기 */
    .complete-outer { 
        background-color: whitesmoke; 
        width: 1200px; 
        height: 600px;
        margin: auto;
    }

    /* 하얀 네모박스 영역 */
    .complete-whitebox { 
        background-color:white; 
        width: 900px;
        height: 430px;
        padding: 50px;
        padding-left: 50px;
        text-align: center;
        margin: auto; /*가운데 정렬*/
    }

    /* 회색 네모박스 영역 */
    .complete-graybox { 
        background-color: rgba(231, 231, 231, 0.738);
        display: inline-block;
        width: 700px;
        height: 200px;
        text-align: center;
        margin-top: 20px;
    }
    
    /* 회색 네모박스 안에 내용물 감싸는 틀 */
    .complete-graybox-div { 
        width: 300px; 
        margin: auto; 
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

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <!-- 사용자 결제완료 페이지  -->

	<br>
    <div class="complete-outer">

        <br>

        <div style="margin-left: 150px; margin-top:20px; font-size:x-large; font-weight: 700;">주문/결제</div>

        <br>

        <!-- 레이아웃 -->
        <div>

            <!-- 하얀색 박스 틀 -->
            <div class="complete-whitebox">

                    <!-- 회색 박스 틀-->
                    <div class="complete-graybox">

                        <div class="complete-graybox-div">
                            <br>

                            <!-- 체크 이미지 -->
                            <div><img src="resources/images/user_order_complete_check.png" style="width:55px; height:55px;"></div>

                            <!-- 멘트 -->
                            <div style="font-weight:bold; font-size:medium;">아무개님의 주문이 완료되었습니다.</div>
                            <br>

                            <!-- 주문번호 -->
                            <div class="complete-graybox-num">주문번호 : 20220621001</div>
                        </div> 

                    </div>

                    <!-- 회색박스 아래 멘트 -->
                    <p>- 주문 상세내역은 [마이페이지 > 주문내역] 에서 조회 가능합니다.</p>

                    <br>

                    <!-- 버튼 두개 -->
                    <div class="complete-two-btn">

                        <!-- 경로 : 마이페이지 > 주문 내역 조회 -->
                        <button class="complete-two-btn1" type="button">주문 내역 조회</button>
                        
                        <!-- 경로 : 마켓 -->
                        <button class="complete-two-btn2" type="button">쇼핑하러 가기</button>
                    
                    </div> 

                </div>

            </div>

        </div>
        
        <br><br> 
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
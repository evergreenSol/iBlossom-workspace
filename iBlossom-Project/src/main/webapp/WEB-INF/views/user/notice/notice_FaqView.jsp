<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/kms.css" rel="stylesheet">
    <title>iBlossom | FAQ</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- 파비콘 -->
	<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
	<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
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
                            <span class="category-content">1:1 문의</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                    <li class="left_menu">
                        <a href="faq.no">
                            <span class="category-content" style="font-weight : 700;">FAQ</span>
                            <span class="category-arrow">></span>
                        </a>
                    </li>
                    <br>
                </ul>               
            </div>           
        </div>

   <div id="faq">
        <h2 style="font-size: 23px;">FAQ</h1>

        <!-- FAQ : Frequently Asked Questions, 자주묻는질문 -->

        <div class="q">&nbsp;Q. 꽃 관리는 어떻게 하나요?</div>
        <p class="a1"> 무엇보다 중요한 것은 매일 물을 갈아주셔야 합니다. <br>
            깨끗한 물로 교체해 주시면서 줄기 끝도 조금씩 잘라주세요. <br>
            많이 상한 잎들은 정리하고 즐겨주시면 됩니다. <br>
            동봉해드린 보존재를 함께 넣어주시면 꽃의 활기가 더욱 오래갑니다.</p>

        <div class="q">&nbsp;Q. 돈 또는 개인적인 선물도 보낼 수 있나요?</div>
        <p class="a1">분실 및 파손 우려가 있기 때문에 같이 보내드리기 어렵습니다. <br>
            양해 부탁드립니다.</p>

        <div class="q">&nbsp;Q. 상품은 어떻게 배송이 되나요?</div>
        <p class="a1">특별히 제작한 플라워 박스에 넣어서 보내드리고 있습니다. <br>
            꽃이 상하지 않도록 물처리 및 상황에 따라 아이스팩 등 정성을 다해 포장하여 배송합니다.</p>

        <div class="q">&nbsp;Q. 전화 통화 가능한 시간대를 알려주세요.</div>
        <p class="a1">메인 우측하단에 있는 1대1 채팅을 활용하면 24시간 내에 답변드리겠습니다.</p>

        <div class="q">&nbsp;Q. 주문취소는 어떻게 하나요?</div>
        <p class="a1">마이페이지>주문내역에서 주문취소가 가능합니다.</p>
        </div>
    </div>    
    <script>
        $(function() {

            $(".q").click(function() {

                var $p = $(this).next(); 
                if($p.css("display") == "none") {

                    $(this).siblings("p").slideUp(100);

                    $p.slideDown(100);
                }
                else { 
                    $p.slideUp(100);
                }
            });
        });
    </script>


    
    	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
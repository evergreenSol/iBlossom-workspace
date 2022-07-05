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
    <title>FAQ</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
  
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <div id="content">
	    <div id="content_1" style="padding:10px">
	        <ul id="leftNavi1">
	            <b style="font-size:30px;">고객센터</b>
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


    <div id="notice-content">
    <h1>공지사항</h1>

    <div class="title"><b>어버이날 배송 안내</b>
        <div class="notice-date" name="" >2022-07-02</div>
    </div>
    <pre class="content1"> 안녕하세요 고객님 I Blossom입니다.
어버이날 EDITION 배송 관련 공지드립니다.
        
기온과 습도에 따른 최고의 꽃 품질을 위하여,
I Blossom에서는 단열재 포장의 유무를 자체적으로 판단하여 
배송 할 예정입니다. (*습도 통풍 조절)
        
소중한 분을 위한 꽃이니만큼 높은 품질의 꽃이 배송 될 수 있도록 
계속 고민하겠습니다.
        
        
TIME TO BLOSSOM
- I Blossom 드림.</pre><hr align="left" style="width: 110%;">

    <div class="title"><b>원데이 클래스 관련 공지</b>
        <div class="notice-date" name="" >2022-07-02</div>
    </div>
    <pre class="content1">- 꽃은 시장 상황에 따라 달라질 수 있습니다.
- 수업 재료는 선주문으로 이루어지기 때문에 예약취소는 
  수업날짜 4일 전까지 가능합니다.
- 부득이하게 4일전에 연락을 못 주신 분들은 수업날짜 3일 후까지 재료를 
  보관해드리며 직접 픽업만 가능합니다.
- 수강 취소 및 환불 문의는 1대1 문의게시판 및 카카오채널을 
  이용해주시기 바랍니다.
- 단체수업 및 다른 장소로 출장을 원하실 경우 별도 문의 부탁드립니다.
    </pre><hr align="left" style="width: 110%;">

    <div class="title"><b>#IBlossom #2022</b>
        <div class="notice-date" name="" >2022-07-02</div>
    </div>
    <pre class="content1">'꽃이 필 시간'라는 메시지로 꾸준히 일상 에서 꽃을 전해온 IBlossom가

이제 #TIME TO BLOSSOM 라는 리뉴얼 브랜드 슬로건으로 새롭게 전개 됩니다.
        
기쁨과 슬픔, 행복한 감정까지 다양한 감정을 포용 하는 꽃을 특별한 
이유 없이 일상에서 즐기는 라이프스타일을 기반으로, 서로가 서로에게, 
그리고 무엇보다 나 자신에게 좀 더 쉽고 편하게 즐거움과 행복함을 
선물해주는 문화를 지향합니다
        
새로워진 #온라인정기구독 서비스와 더불어, 단일꽃으로 구성 된 
싱글라인, 믹스 된 부케라인, 그리고 100송이 규모의 자이언트 파트, 
수입꽃 등 프리미엄 파트, 그리고 IBlossom의 시그니처 디자인을 담은 
비스포크 파트가 포함 된 블랙라인까지, 리뉴얼 된 패키지와 함께 
다채로워진 2022 신규 IBlossom 플라워 디자인을 지금 바로 
리뉴얼 홈페이지를 통해 만나보시기 바랍니다.</pre>
<hr align="left" style="width: 110%;">
</div>
    <script>
        $(function() {
            $(".title").click(function() {
                var $pre = $(this).next(); 
                if($pre.css("display") == "none") {
                    $(this).siblings("pre").slideUp(100);
                    $pre.slideDown(100);
                }
                else { 
                    $pre.slideUp(100);
                }
            });
        });
    </script>

    <br><br><br><br><br><br><br><br><br><br>
    

    
    	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


</body>
</html>
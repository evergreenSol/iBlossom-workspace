<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Time To Blossom</title>

<link href="resources/css/shj.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="WEB-INF/views/common/header.jsp" />
  
   <!-- 메인 div wrap -->
   <div id="main-div-wrap">
       
       <!-- 메인 이미지 div -->
       <div id="main-image-div">

           <!-- 메인 이미지 -->
           <div id="main-imagewrap">
               <img src="resources/images/main-image.png" id="main-image">
               <img src="resources/images/main-image-background.png" id="main-image-background">
           </div>

           <!-- 메인 텍스트 -->
           <div id="main-text1">TIME</div>
           <div id="main-text2">TO</div>
           <div id="main-text3">BLOSSOM</div>
           <div id="main-subtext">꽃을 통한 일상 속 작은 행복</div>

       </div>

       <!-- 메인 이미지 리스트, 마켓/정기구독/클래스 div  -->
       <div id="main-imagelist-wrap">

           <!-- 메인 이미지 리스트 텍스트 (FLOWER&) -->
           <div id="main-text4"  class="sa sa-up"  data-sa-delay="0">FLOWER</div>
           <div id="main-text5"  class="sa sa-up"  data-sa-delay="100">&</div> 

           <!-- 메인 이미지 리스트 wrap -->
           <div id="main-images-wrap">

               <div class="main-imagelist-div">
                   <img src="resources/images/main-images-market.png" class="sa sa-up main-images" data-sa-delay="500"  onclick="location.href='flowerList.pr'";>
                   <span class="main-images-text">마켓</span>
               </div>

               <div class="main-imagelist-div">
                   <img src="resources/images/main-images-subscription.png" class="sa sa-up main-images" data-sa-delay="750"  onclick="location.href='listView.su'";>
                   <span class="main-images-text">정기구독</span>
               </div>

               <div class="main-imagelist-div">
                   <img src="resources/images/main-images-class.png" class="sa sa-up main-images" data-sa-delay="1000"  onclick="location.href='classDetail.cl'";>
                   <span class="main-images-text">클래스</span>
               </div>

           </div>

               <!-- 메인 이미지 리스트 백그라운드 wrap -->
               <div id="main-images-backcolor-wrap" >
                   <img src="resources/images/main-images-backcolor-1.png" class="main-images-backcolor">
                   <img src="resources/images/main-images-backcolor-2.png" class="main-images-backcolor">
                   <img src="resources/images/main-images-backcolor-1.png" class="main-images-backcolor">
               </div>

           </div>

       </div>

       <div id="main-month-slide">
         
           <div id="main-listimage1-best-text">Flower Of The Month</div>
           <div class="main-listimage1-wrap" style="position:relative;">
            <!-- 슬라이더 -->
            <div class="swiper mySwiper" id="swiper-mySwiper">
             <div class="swiper-wrapper">
               <div class="swiper-slide">
                   <img src="resources/images/pexels-eleonora-sky-12292365.jpg">
                   <span  class="main-slider-text" id="main-slider-Gangneung-text">백합</span>
                 </div>
               <div class="swiper-slide">
                   <img src="resources/images/pexels-eleonora-sky-12292365.jpg">
                   <span  class="main-slider-text" id="main-slider-Gangneung-text">수국</span>
                 </div>
               <div class="swiper-slide">
                   <img src="resources/images/pexels-eleonora-sky-12292365.jpg">
                   <span  class="main-slider-text" id="main-slider-Gangneung-text">장미</span>
                 </div>
               <div class="swiper-slide">
                   <img src="resources/images/pexels-eleonora-sky-12292365.jpg">
                   <span  class="main-slider-text" id="main-slider-Gangneung-text">데이지</span>
                 </div>
               <div class="swiper-slide">
                   <img src="resources/images/pexels-eleonora-sky-12292365.jpg">
                   <span  class="main-slider-text" id="main-slider-Gangneung-text">개나리</span>
                 </div>
               <div class="swiper-slide">
                   <img src="resources/images/pexels-eleonora-sky-12292365.jpg">
                   <span  class="main-slider-text" id="main-slider-Gangneung-text">튤립</span>
                 </div>
               <div class="swiper-slide">
                   <img src="resources/images/pexels-eleonora-sky-12292365.jpg">
                   <span  class="main-slider-text" id="main-slider-Gangneung-text">동백</span>
                 </div>
               <div class="swiper-slide">
                   <img src="resources/images/pexels-eleonora-sky-12292365.jpg">
                   <span  class="main-slider-text" id="main-slider-Gangneung-text">프리지아</span>
                 </div>
               <div class="swiper-slide">
                   <img src="resources/images/pexels-eleonora-sky-12292365.jpg">
                   <span  class="main-slider-text" id="main-slider-Gangneung-text">해바라기</span>
                 </div>
             </div>
           </div>
           
             <!-- 양 옆 화살표 -->
             <div class="slide_btn_box">
                   <button type="button" class="slide_btn_prev">
                   <img src="resources/images/prev-arrow.png" style="width: 15px; height: 30px;"></button>
                   <button type="button" class="slide_btn_next">
                   <img src="resources/images/next-arrow.png" style="width: 15px; height: 30px;"></button>
             </div>

           </div>  
       </div>

   </div>

  <jsp:include page="WEB-INF/views/common/bootpay.jsp" />
  
  <jsp:include page="WEB-INF/views/common/footer.jsp" />
  
  
      <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
         
             <!-- Initialize Swiper -->
             <script>
               var swiper = new Swiper(".mySwiper", {
                 slidesPerView: 3,
                 spaceBetween: 35,
                 slidesPerGroup: 3,
                 loop: true,
                 loopFillGroupWithBlank: true,
                 navigation: {
                   nextEl: ".slide_btn_next",
                   prevEl: ".slide_btn_prev",
                 },
               });
             </script>

     <script> // 컨트롤 + i = 자동정렬 (이클립스) / 컨트롤 + k + f (vscode)
       // Scroll Animation (sa, 스크롤 애니메이션)
       const saDefaultMargin = 300;
       let saTriggerMargin = 0;
       let saTriggerHeight = 0;
       const saElementList = document.querySelectorAll('.sa');

       const saFunc = function() {
       for (const element of saElementList) {
           if (!element.classList.contains('show')) {
           if (element.dataset.saMargin) {
               saTriggerMargin = parseInt(element.dataset.saMargin);
           } else {
               saTriggerMargin = saDefaultMargin;
           }

           if (element.dataset.saTrigger) {
               saTriggerHeight = document.querySelector(element.dataset.saTrigger).getBoundingClientRect().top + saTriggerMargin;
           } else {
               saTriggerHeight = element.getBoundingClientRect().top + saTriggerMargin;
           }

           if (window.innerHeight+400 >= saTriggerHeight) {
               let delay = (element.dataset.saDelay) ? element.dataset.saDelay : 0;
               setTimeout(function() {
               element.classList.add('show');
               }, delay);
           }
           }
       }
       }

       window.addEventListener('load', saFunc);
       window.addEventListener('scroll', saFunc);
     </script>
   
</body>
</html>
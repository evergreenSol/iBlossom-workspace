<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/jsa.css" rel="stylesheet">
<style>
#price:focus {outline:none;}
</style>

</head>
<body onload="init();">
<jsp:include page="../../common/header.jsp" />
   
    <br><br><br>

    <div id="wrap_detail">
        <div style="width: 1000px;margin: auto;">
        <br>
          <form name="form" method="get" action="insert.ca">
          <input type="hidden" name="productNo" value="${ p.productNo }">
          <input type="hidden" name="userNo" value="${ loginUser.userNo }">
            <table>
    		
                <tr>
                    <td rowspan="6"><img src="${p.thumbNail }" width="500px"></td>
                    <td class="pp" style="padding-top: 20px;"><b style="font-size:25px;"><c:out value="${p.flowerName}">
                    </c:out></b></td>
                
                </tr>
				
                <tr>
                    <td class="pp"><input type="text" name="productPrice" id="price" style="border: none" size="1" readonly value="${ p.price }">원
                    
                        <hr>
                        
                    </td>
                </tr>
                <tr>
                    <td class="pp" style="font-size:15px; font-weight:700px;">"${p.flowerInfo}"
                      <br>
                        <br>
                        <hr style="margin-bottom:10px;">
                    </td>
                </tr>
                <tr>
                    <td class="pp">

                        <!-- <p>수령일 : <input type="text" class="datepicker" id="datepicker"></p>
 -->

        </div>
        </td>
        </tr>

        <tr>
            <td>
                <div id="countBox">
                    <div id="countWrite">


                      
                            <input type="text" value="${p.flowerName }"
                                style="border: none; padding-left: 10px; padding-top: 5px;"><br><br>
                            <input type=hidden id="sell_price" value="${ p.price }">
                            <input type="button" value=" - " onclick="del();" style="margin-left: 10px;">
                            <input type="text" name="productCount" value="1" size="1" onchange="change();">
                            <input type="button" value=" + " onclick="add();"><br><br><br>

                            
                            배송비:
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            3,000 원<br><br>
                            총 주문금액 : <input type="text"
                                style="border:none; background-color: rgba(224, 224, 224, 0.001); padding-left: 50px; width: 60px;"
                                name="productPrice" size="11" readonly>원

					
                    </div>

                  
                </div>

            </td>
           
        </tr>

        <tr>
            <td>
                <input type="submit" value="장바구니" id="btn1">
            </td>
           
        </tr>

        </table>
  </form>
        <!--상세 정보 버튼 시작-->
        <div class="categorize review-box" style="height: 100px; margin-top: 30px;">
            <div class="reviewBox" id="detail_content" onclick="test();">상세정보</div>
            <div class="reviewBox" id="detail_review" onclick="test1();">리뷰</div>
        </div>

        <!-- 상세정보 폼-->

        <div  id="detailContent">


            <br>

       
        </div>


    </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
        integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- 수량 올릴 시 가격 변동-->
    <script>
        var sell_price;
        var productCount;

        function init() {
        	sell_price = document.form.sell_price.value;
            productCount = document.form.productCount.value;
            document.form.productPrice.value = sell_price;
            change();
        }

        function add() {
            hm = document.form.productCount;
            productPrice = document.form.productPrice;
            hm.value++;

            productPrice.value = (parseInt(hm.value) * sell_price);
        }

        function del() {
            hm = document.form.productCount;
            productPrice = document.form.productPrice;
            if (hm.value > 1) {
                hm.value--;
                productPrice.value = parseInt(hm.value) * sell_price;
            }
        }

        function change() {
            hm = document.form.productCount;
            productPrice = document.form.productPrice;

            if (hm.value < 0) {
                hm.value = 0;
            }
            productPrice.value = parseInt(hm.value) * sell_price;
        }  
    </script>
    <!-- <script>
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '<',
            nextText: '>',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년',
            minDate: "+1D", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            maxDate: "+1M"
        });

        $(function () {
            $('.datepicker').datepicker();
        });
    </script> -->

    <script>
        $(document).ready(function(){
            test();
        });
    </script>
    
    <script>
 
        function test(){

            $('#detail_content').css("background-color","rgba(224, 224, 224, 0.29)");
          $('#detail_content').css("color","black");
          $('#detail_review').css("background-color","white");
          $('#detail_review').css("color","rgb(190, 190, 190)");

            var html;
          $('#detailContent').children().remove();
         
          html = '<img src="'+'${p.contentPhoto}'+'" style="width:970px;">';
          html += '<div id="exchange_info" style="height: 1000px;">';
          html +=  '<b>유의사항</b>';
          html +=     '<div>';
          html +=          '<table>';
          html +=                '<tr>';
          html +=                    '<td>상품정보</td>';
          html +=                       '<td>꽃을 더 오래 보실 수 있도록 일부 꽃은 꽃봉오리 상태로 보내드립니다꽃 시장 수급 상황에 따라 일부 구성이 공지없이 변경될 수 있습니다.<br>';
          html +=                      '<text style="font-weight:50; font-size:20px;">';
          html +=                           '(구성된 꽃의 수급이 일시적으로 불가하여 대체되거나 수급된 꽃의 검수 과정에서 대체되는 상황 발생 시 기존 단가에서 크게 벗어나지 않는 범위를 철저히 고려하여 대체해드리도록 노력하겠습니다.)<br>';
          html +=                       '</text>';
          html +=                  '꽃은 가능한 꽃의 키를 비슷하게 맞춰 보내드립니다. 모니터 사양과 해상도에 따라 색상의 차이가 있을 수 있습니다.';
          html +=               '<br>';
          html +=              '</td>';
          html +=             '</tr>';
          html +=           '</table>';
          html +=    '</div>';
          html +=    '<br><br><br>';
          html +=    '<b>교환 및 환불 정보</b>';
          html +=    '<div>';
          html +=    '<table>';
          html +=    '<tr>';
          html +=    '<td>교환/반품 회수</td>';
          html +=    '<td>';
          html +=    '생화 특성상 변심으로 인한 반품은 불가함 <br>주문후 수작업으로 만들어지는 제품으로주문 확정 후에는 주문취소 불가함<br>홈페이지 1대 1 문의에 남겨주세요';
          html +=    '</td>';
          html +=    '</tr>';
          html +=    '<tr>';
          html +=    '<td>중도해지</td>';
          html +=    '<td>';
          html +=    '중도해지시에서는 총 결제금액에서 <br>';
          html +=    '</td>';
          html +=    '</tr>';
          html +=    '</table>';
          html +=    '</div>';
          
          $('#detailContent').append(html);
        }
    </script>



    
    <script>
        function test1(){

            $('#detail_review').css("background-color","rgba(224, 224, 224, 0.29)");
          $('#detail_review').css("color","black");
          $('#detail_content').css("background-color","white");
          $('#detail_content').css("color","rgb(190, 190, 190)");
          var review;
          $('#detailContent').children().remove();
        
          review = '<input type="button" id="btn_rv" value="구매평 작성" onclick="modalOn();">';
          review += ' <br><br>';
          review += ' <hr>';
          review += '<div class="reviewbb">';
          review +='<img class="img1" src="resources/images/flower1.jpg">';
          review +='<text class="text1">진짜 마음에 들어요</text>';
          review +='<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
          review +='</div>';
          review += '<div class="reviewbb">';
          review +='<img class="img1" src="resources/images/flower1.jpg">';
          review +='<text class="text1">진짜 마음에 들어요</text>';
          review +='<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
          review +='</div>';
          review += '<div class="reviewbb">';
          review +='<img class="img1" src="resources/images/flower1.jpg">';
          review +='<text class="text1">진짜 마음에 들어요</text>';
          review +='<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
          review +='</div>';
          review +='<br><br><br><br><br>';
 

          $('#detailContent').append(review);
        }
    </script>

<script>
    
</script>


<div id="modal" class="modal-overlay">
    <div class="modal-window" >
        <div class="title">
            <span style="font-size: 20px; margin-top:10px;">구매평 작성</span>
        </div>
        <div class="close-area" onclick="modalOff()"><img src="resources/images/x.png" style="width: 15px;"></div>
       
        <div class="content">
            <hr>
            
            <div style="height: 50px; border: 1px solid gainsboro; margin-top:40px; text-align: center;">
                <p>${p.flowerName}</p>
            </div>
            <br>
                <textarea rows="2" cols="10" onkeyup="counter(this,100)" name="contents"
                 placeholder="꽃 파손이나 배송등 문제사항은 구매평에 남겨주시면 확인이 어렵습니다."></textarea>
           <div style="text-align:right;">
                <span id="reCount">0 / 100</span>
            </div>

            <br><br><br>
            <input type="file">

        </div>

        <script>
            function counter(text,length){
                var limit = length;
                var str = text.value.length;
                if(str>limit){
                    alert("최대 100자까지 입력 가능합니다.");
                    text.value = text.value.substring(0,limit);
                    text.focus();
                }
                document.getElementById("reCount").innerHTML = text.value.length + " / " + limit;
            }
        </script>


        <div class="modal-button-area" align="center">

            <!--<button onclick="modalOff()">취소</button>-->
            <button id="sign">등록</button>
        </div>
    </div>
</div>


<script>

    const loremIpsum = document.querySelector('.modal');
    const btnModal = document.querySelector('.view-grade');

    fetch("https://baconipproductPrice.com/api/?type=all-meat&paras=200&format=html")
        .then(response => response.text())
        .then(result => loremIpsum.innerHTML = result)

    function modalOn() {
    modal.style.display = "flex"
    }
    function isModalOn() {
        return modal.style.display === "flex"
    }
    function modalOff() {
        modal.style.display = "none"
    }
    
    btnModal.addEventListener("click", e => {
        modal.style.display = "flex"
    })

    const closeBtn = modal.querySelector(".close-area")
    closeBtn.addEventListener("click", e => {
        modal.style.display = "none"
    })
</script>

  <jsp:include page="../../common/footer.jsp" />
</body>
</html>
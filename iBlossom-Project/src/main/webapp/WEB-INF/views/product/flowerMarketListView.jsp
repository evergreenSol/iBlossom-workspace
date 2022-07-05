<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../common/header.jsp" />

 <br><br><br>

    <div id="wrap_detail1">
        <div style="width: 1000px;margin: auto;">
            <table>
                <tr valign="top">
                    <td rowspan="6"><img src="img/flower3.PNG">
                        <select id="test5">
                            <option value='' selected disabled style="text-align: center;">
                                ---------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ---------
                            </option>
                            <option value="rose">장미</option>
                            <option value="sunflower">해바라기</option>
                            <option value="su">수국</option>
                        </select>
                    </td>
                    <td class="pp" style="padding-top: 20px;"><b style="font-size:25px;">조합형</b></td>
                </tr>

                <tr>
                    <td class="pp">
                        <hr>

                </tr>
                <tr>
                    <td class="pp">
                        <b>내가 직접 고르고 선물해보세요~ </b><br>
                        감동이 2배
                        <br>
                        <hr style="margin-bottom:10px;">
                    </td>
                </tr>
                <tr>
                    <td class="pp">

                        <p>수령일 : <input type="text" class="datepicker" id="datepicker"></p>


        </div>
        </td>
        </tr>
        <tr>
            <td>
                <div id="countBox1">

                    <form name="form" method="get">
                        <!-- <div id="countWrite1">

                        
                       
                            <input type="text" value="장미" name="name"
                                style="border: none; padding-left: 10px; padding-top: 5px;"><br><br>
                            <input type=hidden name="sell_price" value="1000">
                            <input type="button" value=" - " onclick="del();" style="margin-left: 10px;">
                            <input type="text" name="amount" value="1" size="1" onchange="change();">
                            <input type="button" value=" + " onclick="add();"><br><br><br>
                        </div>
                        <div id="countWrite1">

                        
                       
                            <input type="text" value="장미" name="name"
                                style="border: none; padding-left: 10px; padding-top: 5px;"><br><br>
                            <input type=hidden name="sell_price" value="1000">
                            <input type="button" value=" - " onclick="del();" style="margin-left: 10px;">
                            <input type="text" name="amount" value="1" size="1" onchange="change();">
                            <input type="button" value=" + " onclick="add();"><br><br><br>
                        </div>
                        <div id="countWrite1">

                        
                       
                            <input type="text" value="장미" name="name"
                                style="border: none; padding-left: 10px; padding-top: 5px;"><br><br>
                            <input type=hidden name="sell_price" value="1000">
                            <input type="button" value=" - " onclick="del();" style="margin-left: 10px;">
                            <input type="text" name="amount" value="1" size="1" onchange="change();">
                            <input type="button" value=" + " onclick="add();"><br><br><br>
                        </div> -->







                </div>
                배송비:
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                3,000 원<br><br>
                총 주문금액 : <input type="text"
                    style="border:none; background-color: rgba(224, 224, 224, 0.001); padding-left: 60px; width: 40px;"
                    name="sum" size="11" id="sum" readonly value="0">원
                </form>
            </td>
        </tr>

        <tr>
            <td>
                <input type="submit" value="장바구니" id="btn1">

            </td>

        </tr>

        </table>

        <!-- <select name="job">
            <option value="">조합할 꽃을 선택하세요</option>
            <option value="rose">장미</option>
            <option value="sunflower">해바라기</option>
            <option value="hydrangea"> 수국</option>
        </select> -->

        <!--상세 정보 버튼 시작-->
        <div class="categorize review-box" style="height: 100px; margin-top: 30px;">
            <div class="reviewBox" id="combination_content" onclick="test3();">상세정보</div>
            <div class="reviewBox" id="combination_review" onclick="test4();">리뷰</div>
        </div>

        <!-- 상세정보 폼-->

        <div id="cobinationContent">
            <div id="combinationPhoto" style="overflow : hidden;">
                <!-- 
                    <table>
                    <tr>
                        <td><img src="img/flower6.PNG"></td>
                        <td><img src="img/flower6.PNG"></td>
                        <td><img src="img/flower6.PNG"></td>
                        <td><img src="img/flower6.PNG"></td>
                    </tr>
                    <tr>
                        <td><p>수국</p></td>
                        <td><p>수국</p></td>
                        <td><p>수국</p></td>
                        <td><p>수국</p></td>
                    </tr>
                </table> 
            -->
                <br><br><br>
            </div>

        </div>



    </div>

    <!-- 리뷰 작성폼-->

    </div>




    </div>


    <!--푸터-->
    <div id="footer-div">
        <div id="footer-text">
            <!-- 로고 -->
            <img src="img/iBlossom_logo_white.png" id="footer-logo">
            <p>아이블라썸(iBlossom) | 대표자 김한솔 | 사업자 등록번호 000-00-00000 | 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 iBlossom<br>
                © iBlossom, Inc. All rights reserved.</p>
        </div>
    </div>
    <!-- 수량 올릴 시 가격 변동-->
    <script>

    </script>
    <script>
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });

        $(function () {
            $('.datepicker').datepicker();
        });
    </script>

    <script>
        var height = 0;
        var sell_price;
        var amount;
        var shtml;
        var sumAll = 0;
        $(document).ready(function () {
            test3();

        });

        $('#test5').change(function () {
            var name = this.value;
            var text;
            if (name == 'rose') {
                text = '장미'
            } else if (name == 'sunflower') {
                text = '해바라기'
            } else if (name == 'su') {
                text = '수국'
            }
            height = height + 80;
            shtml = '<div id="countWrite1">'
            shtml += '<div onclick="removeItem(\'' + name + '\')" id="removeItem"><img src="img/x.png" style="width: 15px;"></div>'
            shtml += '<input type="text" id="name_' + name + '" value="' + text + '"  style="border: none; padding-left: 10px; padding-top: 5px;"><br><br>';
            shtml += '<input type=hidden id="sell_price_' + name + '"value="1000">'
            shtml += '<input type="button" value=" - " onclick="del(\'' + name + '\')"style="margin-left: 10px;">'
            shtml += '<input type="text" id="amount_' + name + '"value="1" size="1" >'
            shtml += '<input type="button" value=" + " onclick="add(\'' + name + '\')"><br><br><br></div>'
            if (height > 480) {
                $('#countBox1').height(height);
            }
            if ($("#countBox1").find("#amount_" + name).length != 0) {
                alert("이미 선택된 꽃입니다.");
                return;
            }


            $("#countBox1").append(shtml);
            sumAll = sumAll + parseInt($("#sell_price_" + name).val());
            $("#sum").val(sumAll);

        });


        function add(name) {
            console.log(name);
            sell_price = $('#sell_price_' + name).val();
            // console.log(sell_price)
            hm = $('#amount_' + name).val();
            // console.log(hm)
            sum = $("#sum").val();
            // console.log(sum)
            $('#amount_' + name).val(parseInt(hm) + 1);
            sumAll = sumAll + parseInt(sell_price);
            $('#sum').val(sumAll);

        }

        function del(name) {
            $('#sell_price_' + name).val()
            sell_price = $('#sell_price_' + name).val();
            console.log(sell_price)
            hm = $('#amount_' + name).val();
            console.log(hm)
            sum = $('#sum').val();
            console.log(sum)
            if (hm > 1) {
                $('#amount_' + name).val(hm - 1);
                sumAll = sumAll - parseInt(sell_price);
                $('#sum').val(sumAll);
            }
        }

        function change() {
            hm = $('#amount_' + name).val();
            sum = document.form.sum;


            if (hm < 0) {
                HTMLDListElement = 0;
            }

            sum.value = parseInt(hm.value) * sell_price + 3000;
        }



    </script>




    <script>
        function test3() {

            $('#combination_content').css("background-color", "rgba(224, 224, 224, 0.29)");
            $('#combination_content').css("color", "black");
            $('#combination_review').css("background-color", "white");
            $('#combination_review').css("color", "rgb(190, 190, 190)");
            var combinationContent;
            $('#combinationPhoto').children().remove();

            combinationContent = '<table>';
            combinationContent += '<tr>';
            combinationContent += '<td>';
            combinationContent += '<img src="img/flower6.PNG" class="combination_img">';
            combinationContent += '</td>';
            combinationContent += '<td>';
            combinationContent += '<img src="img/flower6.PNG" class="combination_img">';
            combinationContent += '</td>';
            combinationContent += '<td>';
            combinationContent += '<img src="img/flower6.PNG" class="combination_img">';
            combinationContent += '</td>';
            combinationContent += '<td>';
            combinationContent += '<img src="img/flower6.PNG" class="combination_img">';
            combinationContent += '</td>';
            combinationContent += '<tr>';
            combinationContent += '<td>';
            combinationContent += '<p>';
            combinationContent += '수국';
            combinationContent += '</p>';
            combinationContent += '</td>';
            combinationContent += '<td>';
            combinationContent += '<p>';
            combinationContent += '수국';
            combinationContent += '</p>';
            combinationContent += '</td>';
            combinationContent += '<td>';
            combinationContent += '<p>';
            combinationContent += '수국';
            combinationContent += '</p>';
            combinationContent += '</td>';
            combinationContent += '<td>';
            combinationContent += '<p>';
            combinationContent += '수국';
            combinationContent += '</p>';
            combinationContent += '</td>';
            combinationContent += '</tr>';
            combinationContent += '<tr>';
            combinationContent += '<td>';
            combinationContent += '<img src="img/flower6.PNG" class="combination_img>';
            combinationContent += '</td>';
            combinationContent += '</table>';

            $('#combinationPhoto').append(combinationContent);
        }
    </script>

    <script>
        function test4() {
            $('#combination_review').css("background-color", "rgba(224, 224, 224, 0.29)");
            $('#combination_review').css("color", "black");
            $('#combination_content').css("background-color", "white");
            $('#combination_content').css("color", "rgb(190, 190, 190)");
            var combinationreview;
            $('#combinationPhoto').children().remove();

            combinationreview = '<input type="button" id="btn_rv" value="구매평 작성" onclick="modalOn();">';
            combinationreview += ' <br><br>';
            combinationreview += ' <hr>';
            combinationreview += '<div class="reviewbb">';
            combinationreview += '<img class="img2" src="img/flower1.jpg">';
            combinationreview += '<text class="text1">진짜 마음에 들어요</text>';
            combinationreview += '<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
            combinationreview += '</div>';
            combinationreview += '<div class="reviewbb">';
            combinationreview += '<img class="img2" src="img/flower1.jpg">';
            combinationreview += '<text class="text1">진짜 마음에 들어요</text>';
            combinationreview += '<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
            combinationreview += '</div>';
            combinationreview += '<div class="reviewbb">';
            combinationreview += '<img class="img2" src="img/flower1.jpg">';
            combinationreview += '<text class="text1">진짜 마음에 들어요</text>';
            combinationreview += '<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
            combinationreview += '</div>';
            combinationreview += '<br><br><br><br><br>';


            $('#combinationPhoto').append(combinationreview);
        }
    </script>



    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <span style="font-size: 20px; margin-top:10px;">구매평 작성</span>
            </div>
            <div class="close-area" onclick="modalOff()"><img src="img/x.png" style="width: 15px;"></div>

            <div class="content">
                <hr>

                <div style="height: 50px; border: 1px solid gainsboro; margin-top:40px; text-align: center;">
                    <p>버닝, 푸에고</p>
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
                function counter(text, length) {
                    var limit = length;
                    var str = text.value.length;
                    if (str > limit) {
                        alert("최대 100자까지 입력 가능합니다.");
                        text.value = text.value.substring(0, limit);
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

        /* fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
             .then(response => response.text())
             .then(result => loremIpsum.innerHTML = result)
 */
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
        });

        const closeBtn = modal.querySelector(".close-area");
        closeBtn.addEventListener("click", e => {
            modal.style.display = "none"
        });
    </script>
 <jsp:include page="../common/footer.jsp" />

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_Order_DetailViewCheck</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="resources/css/ldo-user.css" rel="stylesheet">
<style>

    /* 사용자 주문 페이지 레이아웃 */
    
    /* 왼쪽 섹션 */ 
    .order-left {
        width: 70%;
        height: 100%;
        float: left;
        box-sizing: border-box;
        background-color: whitesmoke;
    }

    /* 오른쪽 섹션 */
    .order-right {
        width: 30%;
        height: 100%;
        float: right;
        box-sizing: border-box;
        background-color: whitesmoke;
    }

	/* ----------------------------------------------------------- */
    /* 사용자 주문 페이지 왼쪽 영역 */
    
    /* 주문내역 확인, 주문자 정보, 발신인 이름 펼친 페이지 */

    * { box-sizing: border-box; }

    /* 전체 배경 색입히기 */
    .order-outer { background-color: whitesmoke;
        width : 100%; }

    /* 하얀 네모박스 영역 */
    .order-whitebox { 
        background-color:white; 
        padding: 35px;
        padding-left: 40px;
        margin:50px;
    }
    
    /* 1. 주문내역 확인 2. 주문자 정보 3. 발신인 이름 
       4. 배송지 정보 5. 배송지 추가 6. 결제 수단 7. 카카오페이*/
    .order-check, .order-orderer, .order-sender, 
    .order-address, .order-address-add,  .order-payment, .order-kakaopay {
        display: flex; 
        justify-content: space-between;
    }

    /* 배송지 추가, 카카오페이 버튼 */
    .address-btn, .kakao-btn { 
        padding: 10px; 
        width: 180px; 
        border: none; 
        background-color:whitesmoke; 
        border-radius: 3px; 
    }

    /* 버튼 두개 */
    .order-two-btn { 
        text-align: center;
    }

    /* 이전으로 가기 버튼 */
    .pre-btn { 
        padding: 10px; 
        width: 110px; 
        border: none; 
        background-color:rgb(210, 207, 207); 
        border-radius: 3px; 
        text-decoration: none;
        color: black;
    }

    /* 이전으로 가기 버튼 호버시 */
    .pre-btn:hover { 
        color: black;
    }
    
    /* 결제하기 버튼 */
    .pay-btn { 
        padding: 10px; 
        width: 100px; 
        border: none; 
        background-color:rgb(67, 69, 69); 
        color:white;
        border-radius: 3px;  
    }

    /* ----------------------------------------- */

    /* 주문내역 확인 - 내용 */
    .order-check-content { 
        padding: 20px;
        display:flex; 
        justify-content: space-between;
    }

    /* 주문내역 확인 - 상품옵션확인 div */                        
    .order-check-list { 
        list-style: none;
    }
    
    /* 주문자 정보 - 이름, 연락처 */
    .orderer-name, .orderer-phone { 
        padding:10px; 
        background-color:rgba(241, 241, 241, 0.707); 
    }

    /* ------------------------------------------ */

    /* 모달창 */
    #modal.modal-overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        /* background: rgba(255, 255, 255, 0.25); */
        background: rgba(0, 0, 0, 0.712);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(1.5px);
        -webkit-backdrop-filter: blur(1.5px);
        /* backdrop-filter: blur(3.5px);
        -webkit-backdrop-filter: blur(3.5px); */
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
    }

    #modal .modal-window {
        /* background: rgba( 69, 139, 197, 0.70 ); */
        background: white;
        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 550px;
        height: 560px;
        position: relative;
        top: -100px;
        padding : 30px;
    }

    #modal .address-header {
        padding-left: 10px;
        display: inline;
        /* text-shadow: 1px 1px 2px gray; */
        color: black;  
    }

    #modal .address-header h2 {
        display: inline;
    }

    #modal .close-area {
        display: inline;
        float: right;
        padding-right: 10px;
        cursor: pointer;
        /* text-shadow: 1px 1px 2px gray; */
        color: black;
    }

    #modal .address-content {
        margin-top: 20px;
        padding: 0px 10px;
        /* text-shadow: 1px 1px 2px gray; */
        color: black;
    }

    .address-footer button {
        border-radius: 3px;
    }

    .address-table>tr>td {
        width: 50px;
    }

    /* 누를 버튼 */
    #CheckBtn, #OrdererBtn, #SenderBtn {
        width: 600px;
        display: flex; 
        justify-content: space-between;
        border: none;
        background-color: none;
    }

    /* 내용 박스 : 주문내역 확인  */
    #CheckBox, #OrdererBox, #SenderBox {
        width: 600px;
        margin-top: 20px;
        /* height: 600px; */
        /* background-color: yellow; */
        /* border: 5px solid green; */
    }

    /* ----------------------------------------------------------- */
    /* 사용자 주문 페이지 오른쪽 영역 */
    
    /* 총 주문 금액, 배송비, 등급할인 */
    .order-price, .order-delivery, .order-grade {
        display:flex;
        justify-content: space-between;
        padding: 5px;
        margin: 5px 15px 1px 15px;
    }

    /* 총 결제 금액 */
    .order-tprice {
        display:flex;
        justify-content: space-between;
        padding: 10px;
        font-weight: bold;
        margin: 5px 15px 1px 15px;
    }

    /* 이용약관 네모박스 */
    .payment-agree { 
        list-style: none; 
        padding: 1px;
        text-align: center;
        font-size: 0.3cm;
    }
    
    /* 결제하기 버튼 */
    .order-btn { 
        width:100%; 
        height:40px; 
        background-color: black; 
        color:white;
    }
    
    /* 누를 슬라이드 헤드 부분 색상 변경 */
    .order-check>button, .order-orderer>button, .order-sender>button {
        background-color: white;
    }

</style>

<!-------------------------------------------------------------------->
<!-- 슬라이드 업/다운 스크립트  -->

<script>
    $(function() {
        $("#CheckBtn").on("click", function() {
            // id가 "CheckBox"인 요소를 빠르게 올라가면서 사라지거나 내려오면서 나타나게 함.
            $("#CheckBox").slideToggle("1500");
        });
    });
</script>

<script>
    $(function() {
        $("#OrdererBtn").on("click", function() {
            // id가 "OrdererBox"인 요소를 빠르게 올라가면서 사라지거나 내려오면서 나타나게 함.
            $("#OrdererBox").slideToggle("1500");
        });
    });
</script>

<script>
    $(function() {
        $("#SenderBtn").on("click", function() {
            // id가 "SenderBox"인 요소를 빠르게 올라가면서 사라지거나 내려오면서 나타나게 함.
            $("#SenderBox").slideToggle("1500");
        });
    });
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- 사용자 주문 페이지 왼쪽 영역 -->
    <!-- 주문내역 확인, 주문자 정보, 발신인 이름 펼친 페이지 -->
        <h1 style="margin: 20px;">주문/결제</h1>

        <!-- 왼쪽 섹션 -->
        <div class="order-left">
            
            <!-- 하얀색 박스 틀 -->
            <div class="order-whitebox">

                <!-- 내용 감싸는 틀 -->
                <div class="order-contentbox">
                    
                    <!-- 1. 주문내역 확인 -->

                        <!-- 타이틀 -->
                        <div class="order-check">
                            <button id="CheckBtn">
                                <p>&nbsp;주문내역 확인
                                    <span>&nbsp;(2)</span>
                                </p>
                                <p><span>∨&nbsp;&nbsp;</span></p>
                            </button>

                        </div>

                        <hr>

                        <!-- 내용 -->
                        <div id="CheckBox" class="order-check-contentbox">

                            <!-- 1 -->
                            <div class="order-check-content">

                                <!-- 상품 이미지 -->
                                <span>
                                    <img src="">
                                </span>

                                <!-- 상품 옵션 확인란 -->
                                <div class="order-check-list"><br>
                                        <!-- 상품 제목 -->
                                        <li>상품 제목</li>
                                        <br>

                                        <!-- 수령일 : YYYY-MM-DD(D) -->
                                        <li>수령일 : 2022-06-21(목)</li>
                                        <br>

                                        <!-- 가격(원) / 수량(개) -->
                                        <li>6,900원 / 1개</li>
                                        <br>
                                </div>

                                <!-- 공백 -->
                                <div></div>
                                <div></div>

                            </div>

                            <hr> <!-------------------------------------------->

                            <!-- 2 -->
                            <div class="order-check-content">

                                <!-- 상품 이미지 -->
                                <span>
                                    <img src="">
                                </span>

                                <!-- 상품 옵션 확인란 -->
                                <div class="order-check-list"><br>
                                        <!-- 상품 제목 -->
                                        <li>상품 제목</li>
                                        <br>

                                        <!-- 수령일 : YYYY-MM-DD(D) -->
                                        <li>수령일 : 2022-06-21(목)</li>
                                        <br>

                                        <!-- 가격(원) / 수량(개) -->
                                        <li>6,900원 / 1개</li>
                                        <br>
                                </div>

                                <!-- 공백 -->
                                <div></div>
                                <div></div>

                            </div>
                            
                        </div> 

                    <!-------------------------------------------->

                    <!-- 2. 주문자 정보 -->

                        <!-- 타이틀 -->
                        <div class="order-orderer">
                            <button id="OrdererBtn">

                                <p>&nbsp;주문자 정보</p>
                                <!-- 입력내용 보여지는 태그-->
                                <p>
                                    <span>아무개, &nbsp;010-0000-0000</span>&nbsp;&nbsp;&nbsp;∨&nbsp;
                                </p>

                            </button>
                        </div>

                        <hr>

                        <!-- 내용 -->
                        <div id="OrdererBox" class="order-orderer-content" >

                            <p>&nbsp;이름</p>
                            <p class="orderer-name">아무개</p>

                            <p>&nbsp;연락처</p>
                            <p class="orderer-phone">010-0000-0000</p>

                            <!-- 안내문구 -->
                            <p class="orderer-guide" style="font-size:x-small">
                                * 주문자 정보변경은 마이페이지 > 개인정보수정에서 가능합니다.
                            </p>
                            <br>
                        </div>

                    <!-- 3. 발신인 이름 -->
                    <div>
                        <div class="order-sender">
                            <button id="SenderBtn">
                                <p>&nbsp;발신인 이름</p><p><span>∨</span></p>
                            </button>
                        </div>

                        <hr>

                        <div id="SenderBox">
                            <p>&nbsp;아무개</p>
                        </div>
                    </div>     
                    
                    <!-- 4. 배송지 정보 -->
                    <div>
                        <div class="order-address">
                            <p>&nbsp;배송지 정보</p>
                        </div>
                    </div>

                    <hr>

                    <!-- 5. 배송지 추가 -->
                    <div>
                        <div class="order-address-add">

                            <!-- 모달의 원리 : 이 버튼 클릭시 data-target에 제시되어있는 해당 아이디의 div요소를 띄워줌 -->
                            <button type="button" class="address-btn" data-toggle="modal" data-target="#modal-overlay">
                                + 배송지 추가
                            </button>
                        
                        </div>

                        <!-- Modal -->
                        <div id="modal" class="modal-overlay">
                            <div class="modal-window">

                                <!-- Modal Header -->
                                <h2 class="address-header">배송지 추가</h2>
                                <div class="close-area">X</div>

                                <!-- Modal body -->
                                <div class="address-content">

                                    <!-- 이름 -->
                                    <input type="text" name="userName" id="userName" size="70" placeholder="이름을 입력해주세요." 
                                            style="border:none; width:450px; height: 50px; font-size: 18px;"><br>
                                    <hr>

                                    <!-- 연락처 -->
                                    <input type="tel" name="Phone" id="phone" size="70" placeholder="010-0000-0000"
                                            style="border:none; width:450px; height: 50px; font-size: 18px;"><br> 
                                    <hr>

                                    <p>주소</p>

                                    <!-- 우편번호 -->
                                    <input type="text" name="zipcode" id="zipcode" size="70" readonly placeholder="우편번호 검색"
                                            style="border:none; width:350px; height: 50px; display: inline-block; border:none; width:310px; height: 40px; font-size: 18px;">
                                    <input type="button" value="우편번호찾기" onclick="kakaopost()"
                                            style="border:none; width:150px; height: 50px; font-size: 15px;"><br>
                                    <hr>

                                    <!-- 주소 -->
                                    <input type="text" name="address" id="address" size="70" placeholder="주소"
                                            style="border:none; width:450px; height: 50px; font-size: 18px;"><br>
                                    <hr>
                                    <input type="text" name="address" id="address" size="70" placeholder="상세주소입력"
                                            style="border:none; width:450px; height: 50px; font-size: 18px;"><br>
                                    <hr>

                                </div>

                                <!-- Modal footer -->
                                <div class="address-footer" align="center">
                                    <button type="submit" style="border:none; width:465px; height: 50px; font-size: 18px;">저장하기</button>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Modal script -->
                        <script>
                            const btnModal = document.querySelector('.address-btn'); // 버튼 class 속성
                        
                            fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
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
                        
                        <!-- 우편번호 script -->
                        <script>
                            function kakaopost() {
                                new daum.Postcode({
                                    oncomplete: function(data) {
                                        document.querySelector("#zipcode").value = data.zonecode;
                                        document.querySelector("#address").value =  data.address
                                    }
                                }).open();
                            }
                        </script>

                    </div>

                    <hr>

                    <!-- 6. 결제수단 -->
                    <div>
                        <div class="order-payment">
                            <p>&nbsp;결제수단</p>
                        </div>
                    </div>

                    <hr>
                    
                    <!-- 7. 카카오페이 -->
                    <div>
                        <div class="order-kakaopay">
                            <button class="kakao-btn" type="button">카카오페이</button>
                        </div>
                    </div>

                    <br><br>

                    <!-- 버튼 두개 -->
                    <div class="order-two-btn">

                        <!-- 경로 : 장바구니 페이지  -->
                        <a href="" class="pre-btn" type="button">이전으로 가기</a>
                        
                        <!-- 옆에 결제 하기 있으니까 뺄까 ? -->
                        <button class="pay-btn" type="submit">결제하기</button>
                    
                    </div>

                </div>

            </div>

        </div>

        <!-- 오른쪽 섹션 -->
        <div class="order-right">

            <!-- 사용자 주문 페이지 오른쪽 영역 -->

            <br><br>

            <div style="background-color:white; margin:10px;">

                <!-- 총 주문 금액 -->
                <div class="order-price">
                    <span>총 주문 금액</span>
                    <span>31,800원</span>
                </div>

                <!-- 배송비 -->
                <div class="order-delivery">
                    <span>배송비</span>
                    <span>+ 0원</span>
                </div>

                <!-- 등급 할인 -->
                <div class="order-grade">
                    <span>등급할인</span>
                    <span>- 0원</span>
                </div>
                <hr>

                <!-- 총 결제 금액 -->    
                <div class="order-tprice">
                    <span >총 결제 금액</span>
                    <span>31,800원</span>
                </div>

                <br>

                <!-- 이용약관 박스 -->
                <div>
                    <div class="payment-agree">
                    <p>이용약관 및 개인정보 처리방침에 대해 확인하였으며 결제에 동의합니다.</p>
                    </div>
                </div>

                <!-- 결제하기 버튼 -->
                <div>
                    <button class="order-btn" type="submit">결제하기</button>
                </div>

            </div>

        </div>

    </div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
	
</body>
</html>
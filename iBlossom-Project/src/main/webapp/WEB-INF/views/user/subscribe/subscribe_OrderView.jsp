<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_Order_DetailViewCheck</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="resources/css/ldo-user.css" rel="stylesheet">
<link href="resources/css/kdh.css" rel="stylesheet">
<style>

    

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
	<jsp:include page="/WEB-INF/views/common/bootpay.jsp"/>

	<br><br>
	
	<!-- 전체 색상 변경 div -->
	<div id="orderMainOuter">
	
	<br>
		
	<div id="orderMainWrap">
		
	<!-- 사용자 주문 페이지 왼쪽 영역 -->
    <!-- 주문내역 확인, 주문자 정보, 발신인 이름 펼친 페이지 -->
    <p style="font-weight:700; font-size:31px; margin-bottom:15px;">&nbsp;주문/결제</p>

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
                                <p>주문내역 확인</p>
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
                                    <img src="${ sp.subChangeName }"
                                    	 style="width:250px; height:250px;">
                                </span>

                                <!-- 상품 옵션 확인란 -->
                                <div class="order-check-list"><br>
                                        <!-- 상품 제목 -->
                                        <li>${ sp.subProductName }</li>
                                        <input type="hidden" id="subProductNo" value="${ sp.subProductNo }">
                                        <input type="hidden" id="subProductName" value="${ sp.subProductName }">
                                        <br>

                                        <!-- 수령일 : YYYY-MM-DD(D) -->
                                        <li>수령일 : ${ deliverAt }</li><input type="hidden" id="deliverAt" value="${ deliverAt }">
                                        <br>

                                        <!-- 가격(원) / 수량(개) -->
                                        <li>${ sp.subPrice }원 /달</li>
                                        <br>
                                        
                                        <!-- 가격(원) / 수량(개) -->
                                        <input type="hidden" id="subLevel" value="${ subLevel }">
                                        <c:choose>
                                        	<c:when test="${ subLevel eq 1 }">
                                        		<li>구독기간 : 정기구독</li>
                                        		<br>
                                        	</c:when>
                                        	<c:otherwise>
	                                        	<li>구독기간 : ${ subLevel }달</li>
	                                        	<br>
                                        	</c:otherwise>
                                        </c:choose>  
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

                                <p>주문자 정보</p>
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
                            <p class="orderer-name">아무개<p> <!-- ${ sessionScope.userName } -->

                            <p>&nbsp;연락처</p>
                            <p class="orderer-phone">010-xxxx-xxxx</p> <!-- ${ sessionScope.phone } -->

                            <!-- 안내문구 -->
                            <p class="orderer-guide" style="font-size:small">
                                * 주문자 정보변경은 마이페이지 > 개인정보수정에서 가능합니다.
                            </p>
                            <br>
                        </div>

                    <!-- 3. 발신인 이름 -->
                    <div>
                        <div class="order-sender">
                            <button id="SenderBtn">
                                <p>수신자 이름</p><p><span>∨</span></p>
                            </button>
                        </div>

                        <hr>

                        <div id="SenderBox">
                        <!-- placeholder를 나중에 value="${ sessionScope.XXXX }" 으로 변경 수신인 default는 로긴한 사람-->
                         	<p>&nbsp;아무개</p>   
                        </div>
                    </div>     
                    
                    <!-- 4. 배송지 정보 -->
                    <div>
                        <div class="order-address">
                            <p>&nbsp;&nbsp;배송지 정보</p>
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
									<!-- placeholder를 나중에 value="${ sessionScope.XXXX }" 으로 변경 수신인 default는 로긴한 사람-->
                                    <!-- 이름 -->
                                    <input type="text" id="subReceiverUser" size="70" placeholder="이름을 입력해주세요." required><br>
                                    <hr>
                                    <!-- 연락처 -->
                                    <input type="tel" id="subReceiverPhone" size="70" placeholder="010-0000-0000" required><br> 
                                    <hr>

                                    <p>주소</p>

                                    <!-- 우편번호 -->
                                    <input type="text" name="zipcode" id="zipcode" size="70" readonly placeholder="우편번호 검색">
                                    <input type="button" value="우편번호찾기" onclick="kakaopost()" style="border:none; width:146px; height: 50px; font-size: 15px;" ><br>
                                    <hr>

                                    <!-- 주소 -->
                                    <input type="text" name="address" id="address1" size="70" placeholder="주소" required><br>
                                    <hr>
                                    <input type="text" name="address" id="address2" size="70" placeholder="상세주소입력" required><br>
                                    <hr>

                                </div>

                                <!-- Modal footer -->
                                <div class="address-footer" align="center">
                                    <button class="save-address" onclick="saveAddress();" style="border:none; width:465px; height: 50px; font-size: 18px;">저장하기</button>
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
                                        document.querySelector("#address1").value =  data.address;
                                    }
                                }).open();
                            }
                        </script>

                    </div>

                    <hr>

                    <!-- 6. 결제수단 -->
                    <div>
                        <div class="order-payment">
                            <p>&nbsp;&nbsp;결제수단</p>
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
                    
                    </div>

                </div>

            </div>

        </div>

        <!-- 오른쪽 섹션 -->
        <div class="order-right">

            <!-- 사용자 주문 페이지 오른쪽 영역 -->

            <br><br>

            <div class="order-right-wrap">

                <!-- 총 주문 금액 -->
                <div class="order-price">
                    <span>총 주문 금액</span>
                    <span>${ subLevel * sp.subPrice }</span>
                </div>

                <!-- 배송비 -->
                <div class="order-delivery">
                    <span>배송비</span>
                    <span>+ ${ deliverFee }원</span>
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
                    <span>${ subLevel * (sp.subPrice + deliverFee) }원</span><input type="hidden" id="totalPrice" value="${ delieverFee + sp.subPrice }">
                </div>

                <br>

                <!-- 이용약관 박스 -->
                <div>
                    <div class="payment-agree">
                    <p>이용약관 및 개인정보 처리방침에 대해 확인하였으며 결제에 동의합니다.</p>
                    </div>
                </div>

			</div>
			
            <!-- 결제하기 버튼 -->
            <div>
                <button class="order-btn" onclick="getBillingKey(${ subLevel });">결제하기</button>
                 <button class="order-btn" onclick="cancelSubscribe();">취소하기</button>
                 <button class="order-btn" onclick="location.href='update.su';">새로고침</button>
            </div>
            
        </div><!-- 1200px 너비 -->
      	</div><!-- 전체 색상 변경 div -->

	<script>
	function getBillingKey(numOfPay) {
		BootPay.request({
			price: 0, // 0으로 해야 한다.
			application_id: "62b2796de38c30001f5ae52f",
			name: 'iBlossom 정기구독', //결제창에서 보여질 이름
			pg: 'nicepay',
			method: 'card_rebill', // 빌링키를 받기 위한 결제 수단
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			user_info: {
				username: '김동현',
				email: 'donghyeonk96@gmail.com',
				addr: '서울특별시 강서구 강서로7길 69-6',
				phone: '01046929388',
			},
			order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			async : true
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).done(function (data) {
			var totalPrice = $('#totalPrice').val();
			var subProductName = $('#subProductName').val();

			ajaxInsertSubscribe(data.receipt_id, data.billing_key, totalPrice, subProductName, numOfPay);	
		
		});
	}

	function ajaxInsertSubscribe(receiptId, billingKey, totalPrice, subProductName, numOfPay) {
		$.ajax({
			url : "insert.su",
			type : "post",
			data : {
				subProductNo : $('#subProductNo').val(),
				userNo : 1,
				subLevel : $('#subLevel').val(),
				subReceiverUser : $('#subReceiverUser').val(),
				subReceiverPhone : $('#subReceiverPhone').val(),
				deliverAt : new Date($('#deliverAt').val()),
				deliverTo : $('#address1').val() + $('#address2').val(),
				deliverStatus : "배송준비",
				receiptId : receiptId,
				numOfPay : numOfPay
			},
			success : function() {

					subscribe(billingKey, totalPrice, subProductName);	

			}
		});
	}
	
	function subscribe(billingKey, totalPrice, subProductName) {
		$.ajax({
			url : "subscribe.do",
			type : "post",
			data : {
				billingKey : billingKey,
				executeAt : new Date(),
				miliperiod : 30,
				totalPrice : totalPrice,
				subProductName : subProductName
				},
			success : function(data) {
				console.log("구독이 등록되었습니다!");
				
			}, error : function() {
				console.log("구독 등록 실패");
			}
		});
	}
	

	</script>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
	
</body>
</html>
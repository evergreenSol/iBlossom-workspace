<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_Order_DetailViewCheck</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js" type="application/javascript"></script>
<link href="resources/css/ldo-user.css" rel="stylesheet">
<link href="resources/css/kdh.css" rel="stylesheet">
<style>
	/* 5. 결제창 화면 */
    /*-------------------------------------------------------------------------------------------*/

	/* 사용자 주문 페이지 레이아웃 */    
    /* 전체 배경 색상 */
    #orderMainOuter {
    	width: 100%;
    	height: 1600px;
    	background-color: whitesmoke;
    }
    
    /* 내용 감싸는 전체 레이아웃 */
    #orderMainWrap {
    	width: 1200px;
    	height: 1400px;
    	margin: auto;
    }
    
    /* 왼쪽 섹션 */ 
    .order-left {
        width: 60%;
        height: 100%;
        float: left;
        box-sizing: border-box;
    }

    /* 오른쪽 섹션 */
    .order-right {
        width: 36%;
        float: right;
    }



	/* ----------------------------------------------------------- */
    /* 사용자 주문 페이지 왼쪽 영역 */
    
    /* 주문내역 확인, 주문자 정보, 발신인 이름 펼친 페이지 */

    /* 전체 배경 색입히기 */
    .order-outer { 
    	background-color: whitesmoke;
        width : 100%; 
    }

    /* 하얀 네모박스 영역 */
    .order-whitebox { 
        background-color:white; 
        padding: 35px;
        padding-left: 40px;
        padding-bottom: 40px;
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



    /* ----------------------------------------------------------- */
    /* 주문내역 확인 - 내용 */
    .order-check-content { 
        padding: 20px;
        display:flex; 
        justify-content: space-between;
    }

    /* 주문내역 확인 - 상품옵션확인 div */                        
    .order-check-list { 
        list-style: none;
        margin-top: 50px;
    }
    
    /* 주문자 정보 - 이름, 연락처 / 발신인 이름 */
    .orderer-name, .orderer-phone, #SenderBox>p { 
        width: 620px;
        padding:10px; 
        background-color:rgba(241, 241, 241, 0.707); 
    }



    /* ----------------------------------------------------------- */
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
        background: rgba(0, 0, 0, 0.712);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(1.5px);
        -webkit-backdrop-filter: blur(1.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
    }

    #modal .modal-window {
        background: white;
        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 550px;
        height: 570px;
        position: relative;
        top: -100px;
        padding : 30px;
    }

    #modal .address-header {
        padding-left: 10px;
        display: inline;
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
        color: black;
    }

    #modal .address-content {
        margin-top: 20px;
        padding: 0px 10px;
        color: black;
    }

    .address-footer button {
        border-radius: 3px;
    }

    .address-table>tr>td {
        width: 50px;
    }
    
    
    
    /* ----------------------------------------------------------- */
    /* 슬라이드 업/다운 요소 버튼 */

    /* 누를 버튼 */
    #CheckBtn, #OrdererBtn, #SenderBtn {
        width: 700px;
        display: flex; 
        justify-content: space-between;
        border: none;
        background-color: none;
        font-size : 16px;
    }

    /* 내용 박스 */
    #CheckBox, #OrdererBox, #SenderBox {
        width: 600px;
        margin-top: 20px;
        display: none;
        /* height: 600px; */
    }
    
    /* 주문 내역 확인 박스 가운데 정렬 */
    #CheckBox { margin: auto; }



    /* ----------------------------------------------------------- */
    /* 사용자 주문 페이지 오른쪽 영역 */
    
    /* 전체 옵션 */
    .order-right-wrap {
    	background-color:white;
    	padding: 5px;
    }
    
    /* 총 주문 금액, 배송비, 등급할인 */
    .order-price, .order-delivery, .order-grade {
        display:flex;
        justify-content: space-between;
        padding: 5px;
        margin: 10px 15px 15px 15px;
    }
    
    /* 총 주문 금액 위에 공간 주기 */
    .order-price>span {
    	margin-top: 20px;
    }

    /* 총 결제 금액 */
    .order-tprice {
        display:flex;
        justify-content: space-between;
        padding: 10px;
        font-weight: bold;
        margin: 25px 15px 1px 15px;
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
    
    /* 결제수단 클래스에 주소 데이터값 뽑는 용도로 사용 */
    .userAddress {
    	padding: 10px; 
    }

    /* 배송지 추가, 카카오페이 버튼 */
    /* 카카오페이 버튼 삭제 */
    .address-btn, .kakao-btn { 
        padding: 18px; 
        width: 200px; 
        border: none; 
        background-color:whitesmoke; 
        border-radius: 3px; 
    }
    
     /* 이전으로  버튼 */
    .pre-btn { 
        width: 65px;
        height: 30px; 
        border: none;
        background-color: white;
        border-radius: 3px; 
        color: gray;
        float: right;
    }

	/* 이전으로 가기 버튼 호버시 */
    .pre-btn:hover { 
        cursor: pointer;
		font-weight: 600;
		color: black;  
    }
    
    
    /* ----------------------------------------------------------- */
    /* 모달창 상세 스타일 */
    
    /* 이름, 연락처, 주소, 상세주소 */
    .address-content>#subReceiverUser, .address-content>#subReceiverPhone, .address-content>#address1, .address-content>#address2 { 
		border:none; 
		width:450px; 
		height: 50px;
		font-size: 18px; 
	}
	
	/* 주소 p 태그 */
	.address-content>p { font-weight: 600; }
	
	/* 우편번호 */
	.address-content>#zipcode { 
		border: none; 
		width: 350px; 
		height: 50px; 
		display: inline-block; 
		border: none; 
		width: 310px; 
		height: 40px; 
		font-size: 18px;
	}

	/* 저장하기 버튼 */
	.address-footer>button {
		border:none;
		width:465px; 
		height: 50px; 
		font-size: 18px;
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
                                    <img src=""
                                    	 style="width:250px; height:250px;">
                                </span>

                                <!-- 상품 옵션 확인란 -->
                                <div class="order-check-list"><br>
                                        <!-- 상품 제목 -->
                                        <li>상품제목</li>
                                        <br>

                                        <!-- 수령일 : YYYY-MM-DD(D) -->
                                        <li>수령일 : </li>
                                        <br>

                                        <!-- 가격(원) / 수량(개) -->
                                        <li>원 /달</li>
                                        <br>
                                        
                                        <!-- 가격(원) / 수량(개) -->
                                     	<li>구독기간 : 정기구독</li>
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

                                <p>주문자 정보</p>
                                <!-- 입력내용 보여지는 태그-->
                                <p>
                                    <span>${ loginUser.userName } &nbsp;&nbsp; ${ loginUser.phone }</span>&nbsp;&nbsp;&nbsp;∨&nbsp; 
                                </p>

                            </button>
                        </div>

                        <hr>

                        <!-- 내용 -->
                        <div id="OrdererBox" class="order-orderer-content" >

                            <p>&nbsp;이름</p>
                            <p class="orderer-name">${ loginUser.userName }<p>

                            <p>&nbsp;연락처</p>
                            <p class="orderer-phone">${ loginUser.phone }</p>

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
                                <p>발신인 이름</p><p><span>∨</span></p>
                            </button>
                        </div>

                        <hr>

                        <div id="SenderBox">
                         	<p>&nbsp;${ loginUser.userName }</p>   
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
									<!-- placeholder를 나중에 loginUser.XXXX 으로 변경 수신인 default는 로긴한 사람-->
                                    <!-- 이름 -->
                                    <input type="text" id="subReceiverUser" size="70" value="${ loginUser.userName }" onfocus="this.value=''" required><br>
                                    
                                    <hr>
                                    <!-- 연락처 -->
                                    <input type="tel" id="subReceiverPhone" size="70" value="${ loginUser.phone }" onfocus="this.value=''" required><br> 
                                    <hr>

                                    <p>주소</p>

                                    <!-- 우편번호 -->
                                    <c:choose>
	                                    <c:when test="${ (empty loginUser.postcode) || (empty loginUser.address1) }">
		                                    <!-- 우편번호 -->
		                                    <input type="text" name="zipcode" id="zipcode" size="70" readonly placeholder="우편번호 검색">
		                                    <input type="button" value="우편번호찾기" onclick="kakaopost()" style="border:none; width:146px; height: 50px; font-size: 15px;"><br>
		                                    <hr>
		
		                                    <!-- 주소 -->
		                                    <input type="text" name="address" id="address1" size="70" placeholder="주소"><br>
		                                    <hr>
		                                    <input type="text" name="address" id="address2" size="70" placeholder="상세주소입력"><br>
		                                    <hr>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<c:choose>
	                                    		<c:when test="${ fn:length(loginUser.postcode) < 5 }">
	                                    			<input type="text" name="zipcode" id="zipcode" size="70" value="0${ loginUser.postcode }" onfocus="this.value='우편번호검색'" readonly>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<input type="text" name="zipcode" id="zipcode" size="70" value="${ loginUser.postcode }" onfocus="this.value='우편번호검색'" readonly>
	                                    		</c:otherwise>
	                                    	</c:choose>
		                                    <input type="button" value="우편번호찾기" onclick="kakaopost()" style="border:none; width:146px; height: 50px; font-size: 15px;" ><br>
		                                    <hr>
		
		                                    <!-- 주소 -->
		                                    <input type="text" name="address" id="address1" size="70" value="${ loginUser.address1 }" onfocus="this.value=''" required><br>
		                                    <hr>
		                                    <input type="text" name="address" id="address2" size="70" value="${ loginUser.address2 }" onfocus="this.value=''" required><br>
		                                    <hr>
	                                    </c:otherwise>
                                    </c:choose>
                  
                                    

                                </div>

                                <!-- Modal footer -->
                                <div class="address-footer" align="center">
                                    <button class="save-address"  style="border:none; width:465px; height: 50px; font-size: 18px;">저장하기</button>
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
                    
                            var closeBtn = modal.querySelector(".close-area")
                            closeBtn.addEventListener("click", e => {
                                modal.style.display = "none"
                            })
                           
                            var closeBtn = modal.querySelector(".save-address")
                            closeBtn.addEventListener("click", e => {
                                modal.style.display = "none"
                                $('#postalAddress').text($('#address1').val())
                                $('#detailAddress').text($('#address2').val())
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

					<div class="userAddress"><br>
                            	<span id="postalAddress"></span>
                            	<span id="detailAddress"></span>
                    </div>
                    
					<br><br>
					
                    <!-- 버튼 두개 -->
                    <div class="order-two-btn">

                       <button class="pre-btn" type="button" onclick="location.href='list.ca'">이전으로</button>
                    
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
                    <span></span>
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
                    <span>원</span>
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
                <button class="order-btn" onclick="getBillingKey();">결제하기</button>
            </div>
            <input type="hidden" id="userNo" value="${ loginUser.userNo }">
            <input type="hidden" id="userName" value="${ loginUser.userName }">
            <input type="hidden" id="email" value="${ loginUser.email }">
            <input type="hidden" id="address" value="${ loginUser.address }">
            <input type="hidden" id="phone" value="${ loginUser.phone }">
        </div><!-- 1200px 너비 -->
      	</div><!-- 전체 색상 변경 div -->

	<script>	
	
	// 빌링키 발급 -> 결제시 필수 아래 user_info 에서 로그인이 필수여서 결제 버튼 누를 때는 꼭 로그인 해야만 가능하다고 선 처리
	function getBillingKey() {
		BootPay.request({
			price: 0, // 0으로 해야 한다.
			application_id: "62b2796de38c30001f5ae52f",
			name: 'iBlossom 정기구독', //결제창에서 보여질 이름
			pg: 'nicepay',
			method: 'card_rebill', // 빌링키를 받기 위한 결제 수단
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			user_info: {
				username: $('#userName').val(), 
				email: $('#email').val(),
				addr: $('#address').val(),
				phone: $('#phone').val(),
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
			
				requestPay(data.billing_key, data.receipt_id, totalPrice, subProductName);

		});
	}
	
	// 결제용 메소드 getBillingKey 에서 호출
	function requestPay(billingKey, receiptId, totalPrice, subProductName) {
		
		$.ajax({
			url : "requestSubscribe.do",
			type : "post",
			data : {
				billingKey : billingKey,
				totalPrice : totalPrice,
				subProductName : subProductName,
			},
			success : function(data) {
				console.log("상품 결제 성공");
				// 여기서 DB INSERT 용 함수 호출
			}, error : function() {
				console.log("상품 결제 실패");
			}
		});    
	}
	
	// DB에  객체 넣기용 메소드 -> DB에 넘겨줄 변수들을 receiptId와 같이  아래 data에서 보내주기
	// 이 함수는 위에 requestPay 함수 success 단에서 호출
	function insertXXXX(receiptId) {
		$.ajax({
			url : "",
			type : "post",
			data : {
				userNo : $('#userNo').val(),
				subLevel : $('#subLevel').val(),
				subReceiverUser : $('#subReceiverUser').val(),
				subReceiverPhone : $('#subReceiverPhone').val(),
				deliverAt : new Date($('#deliverAt').val()),
				deliverTo : $('#address1').val() + $('#address2').val(),
				deliverStatus : "배송준비",
				receiptId : receiptId
				// 그 외 필요한 변수들 세팅
			},
			success : function(data) {
				console.log("DB 넣음")		
			}, error : function() {
				console.log("DB 넣음 실패")
			}
		});
	}

	</script>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
	
</body>
</html>
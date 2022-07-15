<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Subscription</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js" type="application/javascript"></script>
<link href="resources/css/ldo-user.css" rel="stylesheet"> 
<!-- <link href="resources/css/kdh.css" rel="stylesheet"> -->
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
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

	<br><br>
	
	<!-- 전체 색상 변경 div -->
	<div id="orderMainOuter">
	
	<br>
		
	<div id="orderMainWrap">
		
	<!-- 사용자 주문 페이지 왼쪽 영역 -->
    <!-- 주문내역 확인, 주문자 정보, 발신인 이름 펼친 페이지 -->
    <p id="MainWrapTitle">&nbsp;주문/결제</p>

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
                                    <img src="${ sp.subChangeName }">
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
                                    <input type="text" id="subReceiverUser" size="70" value="${ loginUser.userName }" onfocus="this.value=''" onblur="this.placeholder='이름을 입력해주세요.'" required><br>
                                    
                                    <hr>
                                    <!-- 연락처 -->
                                    <input type="tel" id="subReceiverPhone" size="70" placeholder="010-0000-0000" value="${ loginUser.phone }" onfocus="this.value=''" onblur="this.placeholder='010-0000-0000'" required><br> 
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
                    <span>${ subLevel * (sp.subPrice + deliverFee) }원</span><input type="hidden" id="totalPrice" value="${ subLevel * (sp.subPrice + deliverFee) }">
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
                <button class="order-btn" onclick="pay();">결제하기</button>
                <button class="order-btn" onclick="cancelSubscribe();">취소하기</button>
            </div>
            
            <!-- follow quick menu -->
            <script>  
       
             $(window).scroll(function(){
                
                var scrollTop = $(document).scrollTop();
                
                if (scrollTop < 180) {
                 scrollTop = -30; 
                }
                
                $(".order-right").stop();
                $(".order-right").animate( { "top" : scrollTop }
                );
                
             });
       
            </script>
            
            <!-- 구독 상품 결제 용 필요 변수들 미리 세팅 -->
            <input type="hidden" id="userNo" value="${ loginUser.userNo }">
            <input type="hidden" id="userName" value="${ loginUser.userName }">
            <input type="hidden" id="email" value="${ loginUser.email }">
            <input type="hidden" id="address" value="${ loginUser.address }">
            <input type="hidden" id="phone" value="${ loginUser.phone }">
        </div><!-- 1200px 너비 -->
      	</div><!-- 전체 색상 변경 div -->

	<script>
	// 결제하기 버튼이 눌렸을때
	function pay() {
		var subReceiverUser = $('#subReceiverUser').val()
		var subReceiverPhone = $('#subReceiverPhone').val()
		var subReceiverPostcode = $('#zipcode').val()
		var deliverTo1 = $('#address1').val() 
		var deliverTo2 = $('#address2').val()
		
		if (subReceiverPhone=="" || subReceiverUser=="" || subReceiverPostcode=="" || deliverTo1=="" || deliverTo2==""){ // 만약 아직 양식이 기입이 덜 되어있다면
			alert("모든 양식을 기입해야 결제가 가능합니다!");
		}
		else { // 결제로
			
			var subLevel = $('#subLevel').val()
			getBillingKey(subLevel)
		}
	}
	
	
	// 빌링키 발급
	function getBillingKey(numOfPay) {
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
			if(numOfPay==1) { // 만약 subLevel == 1
				// 정기결제 - 무한반복
				subscribe(data.billing_key, totalPrice, subProductName, data.receipt_id, numOfPay);
			}
			else { // 만약 subLevel != 1
				// 일시불 (바로 requestPay 로 점프)
				requestPay(data.billing_key, data.receipt_id, totalPrice, subProductName, numOfPay);
			}
		});
	}
	
	// 정기결제 - 무한반복
	function subscribe(billingKey, totalPrice, subProductName, receiptId, numOfPay) {

		$.ajax({
			url : "subscribe.do",
			type : "post",
			data : {
				billingKey : billingKey,
				executeAt : new Date(),
				miliperiod : 30,
				totalPrice : totalPrice,
				subProductName : subProductName,
				subProductNo : $('#subProductNo').val(),
				userNo : $('#userNo').val(),
				subLevel : $('#subLevel').val(),
				subReceiverUser : $('#subReceiverUser').val(),
				subReceiverPhone : $('#subReceiverPhone').val(),
				subReceiverPostcode : $('#zipcode').val(),
				deliverAt : new Date($('#deliverAt').val()),
				deliverTo : $('#address1').val() + $('#address2').val(),
				deliverStatus : "배송준비",
				receiptId : receiptId,
				numOfPay : numOfPay
				},
			success : function(data) {
				alert("iBlossom 상품 구독 등록 : 매달 싱싱하고 예쁜 꽃을 보내드릴게요 :)");
				
			}, error : function() {
				alert("상품 구독에 실패하였습니다 :(");
			}
		});
	}
	
	// 일시불 (바로 requestPay 로 점프)
	function requestPay(billingKey, receiptId, totalPrice, subProductName, numOfPay) {
		
		$.ajax({
			url : "requestSubscribe.do",
			type : "post",
			data : {
				billingKey : billingKey,
				totalPrice : totalPrice,
				subProductName : subProductName,
				totalPrice : totalPrice
			},
			success : function(data) {

				insertSubscribe(numOfPay, receiptId, totalPrice);
			}, error : function() {
				alert("상품결제 실패")
			}
		});    
	}
	
	// DB에 구독 객체 넣기
	function insertSubscribe(numOfPay, receiptId, totalPrice) {

		$.ajax({
			url : "insert.su",
			type : "post",
			data : { // 구독 객체 생성용
				subProductName : $('#subProductName').val(),
				subProductNo : $('#subProductNo').val(),
				userNo : $('#userNo').val(),
				subLevel : $('#subLevel').val(),
				subReceiverUser : $('#subReceiverUser').val(),
				subReceiverPhone : $('#subReceiverPhone').val(),
				subReceiverPostcode : $('#zipcode').val(),
				deliverAt : new Date($('#deliverAt').val()),
				deliverTo : $('#address1').val() + " " + $('#address2').val(),
				deliverStatus : "배송준비",
				receiptId : receiptId,
				numOfPay : numOfPay,
				totalPrice : totalPrice
			},
			success : function(result) {
				alert(result);
				location.href="subscribeView.me"
			}, error : function() {
				alert(result)
			}
		});
	}
	
	// 구독 취소
	function cancelSubscribe() {
		$.ajax({
			url : "cancelSubscribe.do",
			type : "post",
			success : function(data) {
				console.log("스케줄러 중지");
				
			}, error : function() {
				console.log("cancelSubscribe fail");
			}
		});
	}

	</script>

	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
	
</body>
</html>
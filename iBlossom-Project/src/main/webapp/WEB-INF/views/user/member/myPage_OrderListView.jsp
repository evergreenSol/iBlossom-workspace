<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 주문내역</title>
<link href="resources/css/khs.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="mypage-wrap">
	
        <jsp:include page="myPage_Header.jsp"/>
        
        
        <table class="mypage-body">
        	<tr>
            	<td class="body_l" style="vertical-align: top;" width="300">
            		<jsp:include page="myPage_Category.jsp"/>
            	</td>
                <td class="body_r" width="900" style="vertical-align: top;">
                    <div class="delete">
						
                        <h2>나의주문내역</h2>
                        <!-- <hr color="lightgray"> -->
                        <!--
                        <table style="text-align: center">
                            <tr>
                                <td height="300" width="900" >주문내역이 없습니다.</td>
                            </tr>
                        </table>
                        -->

                        <div class="mypage-show-order">
                            <button type="button" id="show-order">
                                주문 / 배송 <span>(${ list.size()})</span>
                            </button>
                        </div
                        ><div class="mypage-show-order">
                            <button type="button" id="show-cancel">
                                취소 / 환불 <span>(${cancelList.size()})</span>
                            </button>
                        </div>

                        <table id="mypage-view-order">
                        <c:forEach var="o" items="${list}">
                        
                            <tr>  
                                <td colspan="2" ><p style="font-size: 18px; font-weight: 600; margin-top: 18px; margin-bottom: 10px;">${ o.orderDate }</p></td>
                                <td></td>
                                <td colspan="2" width="650" align="right"><a href="orderDetailView.me?orderNo=${o.orderNo}" class="moreBtn" style="padding-right: 10px; color:black;">주문상세</a></td>  
                            </tr>
                            <tr height="26">
                                <td rowspan="5" width="150" height="100"><img src="${ o.thumbnail }" style="width:100%"></td>
                                <!-- 사진은 ajax로 넣기 (모든게 로드 된 뒤에 ajax로 주문번호에 해당되는 상품 상세 조회 후 그 상품의 사진경로 가져오기)-->
                                <th width="80" >주문번호</th>
                                <td width="10" ></td>
                                <td class="orderNo" width="90">
                                    ${ o.orderNo}
                                </td>
                                
                            </tr>
                            <tr height="26">
                                <th>수령일</th>
                                <td></td>
                                <td>${ o.receiveDate }</td>
                            </tr>
                            <tr height="26">
                                <th>결제금액</th>
                                <td></td>
                                <td>${ o.totalPrice }원</td>
                            </tr>
                            <tr height="26">
                                <th>주문상태</th>
                                <td></td>
                                <td>${ o.orderStatus }</td>
                                
                            </tr>
                            <tr height="26">
                                <th>배송상태</th>
                                <td></td>
                                <td>${ o.deliveryStatus }</td>
                                <c:if test="${ (o.deliveryStatus ne '배송완료') or (o.deliveryStatus ne '배송중') }">
                                	<td style="text-align: right; padding-right: 10px;" width="300">
                                		<button class="mypage-pay-cancel" >취소하기</button>
                                		<input type="hidden" value="${o.receiptId}">
                                		<input type="hidden" value="${o.totalPrice}">
                                	</td>
                                </c:if>
                            </tr>
                            <tr height="30" >
                            	<td class="endTd" colspan="6"></td>
                            </tr>
							<!-- 환불 -->
							<form action="refund.me" method="post" id="real-submit">
								<input type="hidden" value="${o.totalPrice}" name="totalPrice">
								<button type="submit" id="real-submit-button" style="display:none">test</button>
							</form>
                        </c:forEach>
                        </table>


                        <table id="mypage-view-cancel">
                        <c:forEach var="o" items="${cancelList}">
                            <tr >
                                <td colspan="2" ><p style="font-size: 18px; font-weight: 600; margin-top: 18px; margin-bottom: 10px;">${ o.orderDate }</p></td>
                                <td></td>
                                <td colspan="2" width="650" align="right"><a href="orderDetailView.me?orderNo=${o.orderNo}" class="moreBtn" style="padding-right: 10px; color:black;">주문상세</a></td>  
 
                            </tr>
                            <tr height="26">
                                <td rowspan="5" width="150" height="100"><img src="${ o.thumbnail }" style="width:100%"></td>
                                <!-- 사진은 ajax로 넣기 (모든게 로드 된 뒤에 ajax로 주문번호에 해당되는 상품 상세 조회 후 그 상품의 사진경로 가져오기)-->
                                <th width="80">주문번호</th>
                                <td width="10"></td>
                                <td class="orderNo" width="90">
                                    ${ o.orderNo}
                                </td>
                            </tr>
                            <tr height="26">
                                <th>수령일</th>
                                <td></td>
                                <td>${ o.receiveDate }</td>
                            </tr>
                            <tr height="26">
                                <th>취소금액</th>
                                <td></td>
                                <td>${ o.totalPrice }원</td>
                            </tr>
                            <tr height="26">
                                <th>주문상태</th>
                                <td></td>
                                <td>${ o.orderStatus }</td>
                                
                            </tr>
                            <tr height="26">
                                <th>배송상태</th>
                                <td></td>
                                <td>${ o.deliveryStatus }</td>
                                <td style="text-align: right; padding-right: 10px;" width="300"></td>
                            </tr>
                            <tr height="30" >
                            	<td class="endTd" colspan="6"></td>
                            </tr>
                            </c:forEach>
                        </table>
						

                    </div>
			
                </td>
            </tr>
    
        </table>
        
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
    <script>
        $(function () {

            $("#mypage-view-cancel").hide();

            $("#show-order").click(function () {

                $(this).css("color","black").css("border-bottom-width","2px").css("border-bottom-color","rgb(0 0 0)"); // 핑크 치우려면 이 컬러 지우면 댐
                // $("#show-cancel").css("color","rgb(209 209 209)").css("border-bottom-width","1px").css("border-bottom-color","rgb(209 209 209)");
                $("#show-cancel").css("color","rgb(209 209 209)").css("border-bottom-width","1px").css("border-bottom-color","rgb(209 209 209)");

                $("#mypage-view-order").show();
                $("#mypage-view-cancel").hide();

            });

            $("#show-cancel").click(function () {

                $(this).css("color","black").css("border-bottom-width","2px").css("border-bottom-color","rgb(0 0 0)"); // 핑크 치우려면 이 컬러 지우면 댐
                $("#show-order").css("color","rgb(209 209 209)").css("border-bottom-width","1px").css("border-bottom-color","rgb(209 209 209)");

                $("#mypage-view-order").hide();
                $("#mypage-view-cancel").show();

            });

            
			var refundPrice;
			
			$(".mypage-pay-cancel").click(function () { 
				
				console.log("클릭됨");
				
				var receiptId = $(this).next().val();
				console.log("receipId=" + $(this).next().val());
				console.log(receiptId)
				var refundPrice =$(this).next().next().val();
				console.log(refundPrice);
				console.log("refundPrice ="+ $(this).next().next().val());
				
				
				$.ajax({
					url : "cancelPay.me",
					data : {
						receiptId : $(this).next().val()
					},
					type : "POST",
					success : function (result) {
						
							console.log("수정이 되었음");
							console.log(result);
							
							console.log(refundPrice);
						
							$("#real-submit-button").trigger("click");
							
							$.ajax({
								url : "goGetToken.do",
								type : "post",
								success : function(token) {
									
									console.log("token 생성됨 : " + token);
									
									$.ajax({
										url : "cancelRequest.do",
										data : {
											receiptId : receiptId,
											price : refundPrice
											},
										type : "post",
										success : function(result) {
	
											alert("결제가 취소되었습니다.");
											console.log("이제 refund.me");
											console.log(refundPrice);
											
											location.reload();
										
										}, error : function() {
											console.log("안되면 집ㄱ");
										}
									});
									
									
								}, error : function() {
									console.log("토큰 생성 실패");
								}
							});
						
					},
					error : function () {
						console.log("실패");
					}
					
				});

			});
            
			$("#category-orderList").css("font-weight", "700");
			
        });

    </script>
	
	
	
	
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br><br>
	
	
	

	

</body>
</html>
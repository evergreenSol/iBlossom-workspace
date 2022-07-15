<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 주문상세내역</title>
<link href="resources/css/khs.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<c:choose>
		<c:when test="${ loginUser.grLevel == 1 }">
			<c:set var="discount" value="0"/>
		</c:when>
		<c:when test="${ loginUser.grLevel == 2 }">
			<c:set var="discount" value="1000"/>
		</c:when>
		<c:when test="${ loginUser.grLevel == 3 }">
			<c:set var="discount" value="2000"/>
		</c:when>
		<c:otherwise>
			<c:set var="discount" value="3000"/>
		</c:otherwise>
	</c:choose>

	<div class="mypage-wrap">
	
		<br><br>
        <jsp:include page="myPage_Header.jsp"/>
        
        <br>
        
        <table class="mypage-body">
        	<tr>
            	<td class="body_l" style="vertical-align: top;" width="300">
            		<jsp:include page="myPage_Category.jsp"/>
            	</td>
                <td class="body_r" width="900" style="vertical-align: top;">
                    <div class="delete">
                    
                    <h2>나의 주문 상세 내역</h2>
                        <!-- h2? h3? -->
                        <!-- <hr color="lightgray"> -->
                        <!--
                        <table style="text-align: center">
                            <tr>
                                <td height="300" width="900" >주문내역이 없습니다.</td>
                            </tr>
                        </table>
                        -->
                        
                       
                        
                        <table>
                            <tr>
                                <td colspan="2"><p style="font-size: 18px; font-weight: 600">${o.orderDate}</p></td>
                                <td></td>
                                <td width="650" align="right">주문번호 : <span style="padding-right: 10px;">${o.orderNo}</span></td>  
                            </tr>
                            <c:forEach var="d" items="${list}">
                            <tr>
                                <td rowspan="5" width="100" height="100"><img src="${d.thumbnail}" style="width:100%"></td>
                                <th width="80">상품명</th>
                                <td width="10"></td>
                                <td class="productName" width="80">
                                    ${d.flowerName}
                                </td>
                            </tr>
                            <tr>
                                <th>수령일</th>
                                <td></td>
                                <td>${o.receiveDate}</td>
                            </tr>
                            <tr>
                                <th>가격</th>
                                <td></td>
                                <td>${ d.onePrice }원</td>
                            </tr>
                            <tr>
                                <th>수량</th>
                                <td></td>
                                <td>${ d.oneQuantity }개</td>
                            </tr>
                            <tr>
                                <th>배송상태</th>
                                <td></td>
                                <td>${o.deliveryStatus}</td>
                            </tr>
                            <tr height="30"></tr>
                            </c:forEach>
                        </table>


                        <p style="font-size: 18px; font-weight: 600; margin-top: 60px;">배송지</p>

                        <div class="mypage-delivery-to" >
                            <span style="font-size: 16px; font-weight: 600;">
                                ${o.receiveUser}
                                <span style="margin-left: 15px;">${o.receivePhone}</span>
                                <span style="margin-left: 15px;">보내는 사람 (${loginUser.userName})</span>
                            </span>
                            <p style="font-size: 14px; margin: 0px;">[${o.postcode}] ${o.orderAddress}</p>                            
                        </div>


                        <p style="font-size: 18px; font-weight: 600; margin-top: 60px;">결제정보</p>
                        <table>
                        
                            <tr>
								<td width="120">주 문 금 액</td>
								<td width="680"></td>
								<td width="100"><span>${o.totalPrice + 3000 + discount}</span><span>원</span></td>
							</tr>
							<tr height="20"></tr>
							<tr>
								<td>배 송 비</td>
								<td></td>
								<td><span>3000</span><span>원</span></td>
							</tr>
							<tr height="20"></tr>
							<tr>
								<td>등 급 할 인</td>
								<td></td>
								<td>-<span>${discount}</span><span>원</span></td>
							</tr>
							<tr height="20"></tr>
							<tr>
								<td>결 제 방 법</td>
								<td></td>
								<td>카드</td>
							</tr>
							<tr height="20"></tr>
							<tr>
								<td>결 제 일</td>
								<td></td>
								<td>${o.orderDate}</td>
							</tr>
							<tr height="20"></tr>
							<tr>
								<td>총 결 제 금 액</td>
								<td></td>
								<td><span>${o.totalPrice}</span><span>원</span></td>
							</tr>
                        
                        
                        </table>

                        <br><br>


                    </div>
			
                </td>
            </tr>
    
        </table>
    
    </div>
    	
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    

<script>
	$(function () {
		$("#category-orderList").css("font-weight", "700");
	});
</script>

</body>
</html>
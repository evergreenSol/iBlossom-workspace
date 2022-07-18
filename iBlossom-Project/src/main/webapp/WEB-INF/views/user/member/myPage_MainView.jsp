<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | MyPage</title>
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
                        <!-- <h2>상품 주문내역</h2> -->
                        <div style="margin : 20px 0px;">
						<span class="mainView-title">주문배송조회</span><span id="mainView-subTitle">(최근 1개월)</span>
                        </div>
                        <div class="mypage-first">
                            <div class="delivery">
                                <b>${ ready }</b>
                                <span>배송 전</span>
                            </div
                            ><div class="delivery">
                                <b>${ shipping }</b>
                                <span>배송 중</span>
                            </div
                            ><div class="delivery">
                                <b>${ complete }</b>
                                <span>배송 완료</span>
                            </div>
                        </div>

                        <br><br>

                        <span class="mainView-title">나의 주문내역</span>
                        <!-- <hr color="lightgray"> -->
                        <!--
                        <table style="text-align: center">
                            <tr>
                                <td height="300" width="900" >주문내역이 없습니다.</td>
                            </tr>
                        </table>
                        -->

                        <table>
                        <c:forEach var="o" items="${list}">
                        
                            <tr>
                                <td colspan="2"><p style="font-size: 18px; font-weight: 600; margin-top: 18px; margin-bottom: 10px;">${o.orderDate }</p></td>
                                <td></td>
                                <td width="650" align="right"><a href="orderDetailView.me?orderNo=${o.orderNo}" class="moreBtn" style="padding-right : 10px;">주문상세</a></td>  
 
                            </tr>
                            <tr>
                                <td rowspan="5" width="150" height="100"><img src="${o.thumbnail}" style="width:100%"></td>
                                <!-- 사진은 ajax로 넣기 (모든게 로드 된 뒤에 ajax로 주문번호에 해당되는 상품 상세 조회 후 그 상품의 사진경로 가져오기)-->
                                <th width="80">주문번호</th>
                                <td width="10"></td>
                                <td class="orderNo" width="80">
                                    ${o.orderNo}
                                </td>
                            </tr>
                            <tr>
                                <th>수령일</th>
                                <td></td>
                                <td>${o.receiveDate}</td>
                            </tr>
                            <tr>
                                <th>결제금액</th>
                                <td></td>
                                <td><fmt:formatNumber value="${ o.totalPrice }" pattern="###,###"/>원</td>
                            </tr>
                            <tr>
                                <th>주문상태</th>
                                <td></td>
                                <td>${o.orderStatus}</td>
                            </tr>
                            <tr>
                                <th>배송상태</th>
                                <td></td>
                                <td>${o.deliveryStatus}</td>
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
	
	
	
	
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br><br>
	
	
	
	
	
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	

</body>
</html>
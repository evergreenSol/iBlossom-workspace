<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 개별주문내역</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="resources/css/ldo-admin.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

    <!-- admin 어드민 관리자 메뉴 wrap -->
    <div id="admin-menu-wrap">

        <!-- 메뉴 첫번째줄 div -->
        <div id="admin-menu-1">

            <!-- 로고 -->
            <div id="admin-logo-div">
                <a href="${ pageContext.request.contextPath }/" id="admin-logo-a">
                    <img src="resources/images/iBlossom_logo_black.png">
                 </a>
             </div>

            <!-- 로그인 div -->
            <div id="admin-login-div">

                <span id="admin-login-text">admin</span>

                <!-- 로그인 아이콘  -->
                <a href="logout.me" id="admin-login-a">
                    <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-person-fill" viewBox="0 0 16 16">
                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                    </svg>
                </a>

            </div>

        </div>
        
        <!------------------------------------------------------------------->

        <!-- 메뉴 두번째줄 div -->
        <div id="admin-menu-2">

            <!-- 메뉴 div -->
            <div id="admin-navi-div">

                <!-- 메뉴 -->
                <ul id="admin-navi">
                    <li><a href="list.me" class="admin-navi-menu">회원관리</a></li>
                    <li><a href="adminList.or" class="admin-navi-menu" style="font-weight: 700;">주문정보관리</a></li>
                    <li>
                        <a href="subMemberListView.su" class="admin-navi-menu">정기구독관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="subMemberListView.su">구독회원관리</a></li>
                            <li><a href="listView.sp">구독상품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="list.pr" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="reviewList.pr" class="admin-navi-menu">리뷰관리</a></li>
                    <li><a href="classList.ad" class="admin-navi-menu">클래스관리</a>
                    	<ul class="admin-navi-ul">
                            <li><a href="classAddForm.ad">클래스 추가</a></li>
                            <li><a href="classList.ad">클래스 예약내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="qnaList.ad" class="admin-navi-menu">고객센터관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="qnaList.ad">1:1 문의</a></li>
                            <li><a href="noticeList.ad">공지사항</a></li>
                        </ul>
                    </li>
                    <li>
                    	<a href="https://dashboard.tawk.to/#/monitoring" target="_blank" class="admin-navi-menu" id="admin-navi-chat">채팅관리</a>
                   	</li>
                </ul>

            </div>

        </div>

    </div>
    
    <!------------------------------------------------------------------->

    <!-- admin 관리자페이지 주문정보관리 -->
    <div id="admin-member-wrap">

        <span id="admin-member-title">개별 주문 내역</span>
        
        <hr id="admin-member-hr">

        <br>

		<div class="detail-wrap"><br>
				
	         <!-- 주문정보 영역 -->
	         <table class="admin-order-detail-table">
	
	            <caption class="table-caption">&nbsp;주문정보</caption>
	            
	            <tr>
	                <td class="admin-table-head">주문번호</td>
	                <td class="admin-table-content">${ o.orderNo }</td>
	                <td class="admin-table-head">주문자</td>
	                <td class="admin-table-content">${ o.receiveUser }</td>
	            </tr>
	            
	            <tr>
	                <td class="admin-table-head">수령일</td>
	                <td class="admin-table-content">${ o.receiveDate }</td>
	                <td class="admin-table-head">수령자</td>
	                <td class="admin-table-content">${ o.receiveUser }</td>
	            </tr>
	
	            <tr>
	                <td class="admin-table-head">주문일자</td>
	                <td class="admin-table-content">${ o.orderDate }</td>
	                <td class="admin-table-head">주문상태</td>
	                <td class="admin-table-content">${ o.deliveryStatus }</td>
	            </tr>
	
	        </table>
	        
	        <br><br>
	
	        <!-- 배송정보 영역 -->
	        <table class="admin-order-detail-table">
	
	            <caption class="table-caption">&nbsp;배송정보</caption>
	            
	            <tr>
	                <td class="admin-table-head">배송주소</td>
	                <td class="admin-table-content">[${ o.postcode }] ${ o.orderAddress }</td>
	                <td class="admin-table-head">연락처</td>
	                <td class="admin-table-content">${ o.receivePhone }</td>
	            </tr>
	
	        </table>
	        
	        <br><br>
	
	        <!-- 결제정보 영역 -->
	        <table class="admin-order-detail-table">
	
	            <caption class="table-caption">&nbsp;결제정보</caption>
	            
	            <tr>
	                <td class="admin-table-head">주문금액</td>
	                <td class="admin-table-content">
						<fmt:formatNumber value="${ o.totalPrice }" pattern="###,###"/>원
					</td>
	                <td class="admin-table-head">배송비</td>
	                <td class="admin-table-content">3,000원</td>
	            </tr>
	
	        </table>
	        
	        <br><br>
	
	        <!-- 상세정보 영역 -->
	        <table class="admin-order-detail-table">
	            
	            <caption class="table-caption">&nbsp;상세정보</caption>
	            
	            <tr class="admin-table-head detail-th">
	                <th class="detail-th-1">상세주문번호</th>
	                <th class="detail-th-2">상품번호</th>
	                <th class="detail-th-3">상품명</th>
	                <th class="detail-th-4">수량</th>
	                <th class="detail-th-5">가격</th>
	            </tr>
	
	            <c:forEach var="d" items="${ list }">
		            <tr class="admin-table-content">
		                <td>${ d.dorderNo }</td>
		                <td>${ d.productNo }</td>
		                <td>${ d.flowerName }</td>
		                <td>${ d.oneQuantity }개</td>
		                <td>
		                	<fmt:formatNumber value="${ d.onePrice }" pattern="###,###"/>원
		                </td>
		            </tr>
	        	</c:forEach>
	        	
	        </table>
        
            <br><br>
    
		    <div>
		    	<a href="adminList.or" id="admin-order-pre-btn">&lt; 이전으로</a>    	
		    </div>
		    
        </div>

    </div>

	<br><br><br><br><br>

</body>
</html>
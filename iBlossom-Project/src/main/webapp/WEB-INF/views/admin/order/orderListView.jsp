<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 전체주문내역</title>
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
                    <li>
                        <a href="adminList.or" class="admin-navi-menu" style="font-weight: 700;">주문정보관리</a>
                        <!-- <a href="adminList.or?cpage=1" class="admin-navi-menu" style="font-weight: 700;"> -->
                    </li>
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

        <span id="admin-member-title">전체 주문 내역</span>
        
        <hr id="admin-member-hr">

        <br>   

        <!-- 전체 주문 내역 메뉴바 항목 14개 -->
        <!-- 주문번호, 회원번호, 주문자, 주문일, 수령자, 수령일, 수령자 전화번호, 
        	  배송지, 우편번호, 총결제금액, 결제번호, 주문상태, 배송상태, 상세보기 -->
        <div class="admin-list-wrap">
            
            <table class="admin-order-list-table">
            
                <!-- 전체 주문 내역 > 메뉴바 -->
                <thead id="admin-order-list-thead">
                    <tr>
                        <th width="50px;">주문번호</th>
                        <th width="50px;">회원번호</th>
                        <th width="100px;">주문자</th>
                        <th width="100px;">주문일</th>
                        <th width="100px;">수령일</th>
                        <!-- <th>수령자 연락처</th> -->
                        <!-- <th>배송지</th> -->
                        <!-- <th>우편번호</th> -->
                        <th width="100px;">총결제금액</th>
                        <!-- <th>결제번호</th> -->
                        <th width="100px;">주문상태</th>
                        <th width="100px;">배송상태</th>
                    </tr>
                </thead>

                <!-- 전체 주문 내역 > 내용 -->
                <tbody> 
                <c:forEach var="o" items="${ list }">
		            <c:choose>
				        <c:when test="${ empty list }">
				        	<p style="text-align:center; font-size:20px;">존재하는 주문 내역이 없습니다.</p>
				        </c:when>
				        <c:otherwise>
				        <tr>
	                    	<!-- 주문번호 -->
	                        <td>
	                        	<button type="button" class="admin-table-btn" 
	                        	onclick="location.href='adminDetail.or?orderNo=${o.orderNo}'">${o.orderNo}</button>
	                        </td>
	                        
	                        <!-- 회원번호 -->
	                        <td>${ o.userNo }</td>
	                        
	                        <!-- 주문자 -->
	                        <td>${ o.receiveUser }</td>
	                        
	                        <!-- 주문일 -->
	                        <td>${ o.orderDate }</td>
	                        
	                        <!-- 수령일 -->
	                        <td>${ o.receiveDate }</td>
	                        
	                        <!-- 수령자 연락처 -->
	                        <!-- <td>010-0000-0000</td> -->
	                        
	                        <!-- 배송지 -->
	                        <!-- <td>서울시 영등포구</td> -->
	                        
	                        <!-- 우편번호 -->
	                        <!-- <td>00123</td> -->
	                        
	                        <!-- 총결제금액 -->
	                        <td>${ o.totalPrice }원</td>
	                        
	                        <!-- 결제번호 -->
	                        <!-- <td>1</td> -->
	                        
	                        <!-- 주문상태 -->
	                        <td>${ o.orderStatus }</td>
	                        
	                        <!-- 배송상태 -->
	                        <td>${ o.deliveryStatus }</td>
	                        <!--  
	                        <c:if test="${ (o.deliveryStatus ne '배송완료') or (o.deliveryStatus ne '배송중') }">
                               	<td style="text-align: right; padding-right: 10px;" width="300">
                               		<button class="mypage-pay-cancel" >취소하기</button>
                               		<input type="hidden" value="${o.receiptId}">
                               		<input type="hidden" value="${o.totalPrice}">
                               	</td>
                            </c:if>
                            -->
                    	</tr>         
						</c:otherwise>
		        	</c:choose>
		        </c:forEach> 
            </tbody>

            </table>
            
        </div>

	    <div>
	        <span><a></a></span>
	    </div>
	    
	</div>
	
	<br><br><br>
		
	<!------------------------------------------------------------------->

    <!-- 페이징 처리  -->
   	<div id="pagingArea">
      <ul class="pagination">

         <c:choose>
            <c:when test="${ pi.currentPage eq 1 }">
               <li class="page-item disabled"><a class="page-link" href="#">◀</a></li>
            </c:when>
            <c:otherwise>
               <li class="page-item"><a class="page-link"
                  href="adminList.or?cpage=${ pi.currentPage - 1 }">◀</a></li>
            </c:otherwise>
         </c:choose>

		<%--
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	           <li class="page-item"><a class="page-link" href="list.me?cpage=${ p }">${ p }</a></li>
	        </c:forEach>
	    --%>
         
          <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	      	  <c:choose>
		       	  <c:when test="${ pi.currentPage eq p }">
		              <li class="page-item"><a class="page-link"  style="color : #ff2393; font-weight:700;"
		           	      href="adminList.or?cpage=${ p }">${ p }</a></li>
		          </c:when>
		          <c:otherwise>
		              <li class="page-item"><a class="page-link" 
		                  href="adminList.or?cpage=${ p }">${ p }</a></li>
		          </c:otherwise>
	          </c:choose>
     	  </c:forEach>

	         <c:choose>
	            <c:when test="${ pi.currentPage eq pi.maxPage }">
	               <li class="page-item disabled"><a class="page-link" href="#">▶</a></li>
	            </c:when>
	            <c:otherwise>
	               <li class="page-item"><a class="page-link"
	                   href="adminList.or?cpage=${ pi.currentPage + 1 }">▶</a></li>
	            </c:otherwise>
	         </c:choose>
	         
      	</ul>
	 </div>
    
</body>
</html>
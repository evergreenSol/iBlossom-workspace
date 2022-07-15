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
                <a href="" id="admin-login-a">
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
						<!--  회원번호로 정보를 받아야 하기 때문에 필요 없음 ! 
	                       <ul class="admin-navi-ul">
	                           <li><a href="adminList.or">전체주문내역</a></li>
	                           <li><a href="adminDetail.or">개별주문내역</a></li>
	                       </ul>
                        -->
                    </li>
                    
                    <li>
                        <a href="" class="admin-navi-menu">정기구독관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="subMemberListView.su">구독회원관리</a></li>
                            <li><a href="listView.sp">구독상품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="list.pr" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="reviewList.pr" class="admin-navi-menu">리뷰관리</a></li>
                    <li><a href="" class="admin-navi-menu">클래스관리</a></li>
                    <li>
                        <a href="" class="admin-navi-menu">고객센터관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="">1:1 문의</a></li>
                            <li><a href="">FAQ</a></li>
                        </ul>
                    </li>
                    <li><a href="" class="admin-navi-menu" id="admin-navi-chat">채팅관리</a></li>
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
            
                <!-- 메뉴바 -->
                <thead id="admin-order-list-thead">

                    <tr>
                        <th style="width:47px;">주문번호</th>
                        <th style="width:47px;">회원번호</th>
                        <th style="width:35px;">주문자</th>
                        <th style="width:35px;">주문일</th>
                        <th style="width:35px;">수령자</th>
                        <th style="width:35px;">수령일</th>
                        <th>수령자 연락처</th>
                        <th style="width:155px;">배송지</th>
                        <th style="width:47px;">우편번호</th>
                        <th style="width:58px;">총결제금액</th>
                        <th style="width:47px;">결제번호</th>
                        <th style="width:47px;">주문상태</th>
                        <th style="width:47px;">배송상태</th>
                    </tr>

                </thead>

                <!-- 전체 주문 내역 내용 -->
                <tbody>

                    <!-- <c:forEach var="o" items="${ list }">  -->  
                    <tr>
                        <td>
                        	<button type="button" class="admin-table-btn" onclick="location.href=''">1</button>
                        </td>
                        <td>001</td>
                        <td>아무개</td>
                        <td>20220621</td>
                        <td>아무개</td>
                        <td>20220623</td>
                        <td>010-0000-0000</td>
                        <td>서울시 영등포구</td>
                        <td>00123</td>
                        <td>31,900원</td>
                        <td>1</td>
                        <td>결제완료</td>
                        <td>배송중</td>
                    </tr>
                    <!-- </c:forEach>  -->

                    <!-- 2 -->
                    <tr>
                        <td>
                        	<button type="button" class="admin-table-btn" onclick="location.href=''">2</button>
                        </td>
                        <td>002</td>
                        <td>박말똥</td>
                        <td>20220622</td>
                        <td>박말똥</td>
                        <td>20220624</td>
                        <td>010-0000-0000</td>
                        <td>서울시 강서구</td>
                        <td>00456</td>
                        <td>24,900원</td>
                        <td>2</td>
                        <td>결제완료</td>
                        <td>배송완료</td>
                    </tr>

                    <!-- 3 -->
		            <c:choose>
			            <c:when test="${ empty list }">
			                 <p style="text-align:center; font-size:20px;">존재하는 주문 내역이 없습니다.</p>
			            </c:when>
			            <c:otherwise>
			            	<c:forEach var="o" items="${ list }">
			                    <tr>
			                        <td>
			                        	<button type="button" class="admin-table-btn" onclick="location.href=''">${ o.orderNo }</button>
			                        </td>
			                        <td>002</td>
			                        <td>고영희</td>
			                        <td>20220622</td>
			                        <td>고영희</td>
			                        <td>20220624</td>
			                        <td>010-0000-0000</td>
			                        <td>서울시 양천구</td>
			                        <td>00456</td>
			                        <td>22,900원</td>
			                        <td>3</td>
			                        <td>결제완료</td>
			                        <td>배송완료</td>                       
			                    </tr>
				             </c:forEach>                 
				        </c:otherwise>   
		                </c:choose>
                </tbody>

            </table>
            
        </div>

	    <div>
	        <span><a></a></span>
	    </div>
	    
	</div>
	
	<br><br><br>
		
	<!------------------------------------------------------------------->

    <!-- 페이징 처리 -->
    
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

			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<li class="page-item"><a class="page-link"
					href="adminList.or?cpage=${ p }">${ p }</a></li>
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
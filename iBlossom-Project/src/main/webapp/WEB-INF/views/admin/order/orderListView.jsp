<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_Order_Full order details</title>
<link href="resources/css/ldo-admin.css" rel="stylesheet">
</head>
<body>

    <!-- admin 어드민 관리자 메뉴 wrap -->
    <div id="admin-menu-wrap">

        <!-- 메뉴 첫번째줄 div -->
        <div id="admin-menu-1">

            <!-- 로고 -->
            <div id="admin-logo-div">
                <a href="" id="admin-logo-a">
                    <img src="img/iBlossom_logo_black.png">
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

        <!-- 메뉴 두번째줄 div -->
        <div id="admin-menu-2">

            <!-- 메뉴 div -->
            <div id="admin-navi-div">

                <!-- 메뉴 -->
                <ul id="admin-navi">
                    <li><a href="" class="admin-navi-menu">회원관리</a></li>
                    <li>
                        <a href="" class="admin-navi-menu" style="font-weight: 700;" >주문정보관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="">전체주문내역</a></li>
                            <li><a href="">개별주문내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="" class="admin-navi-menu">정기구독관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="">구독회원관리</a></li>
                            <li><a href="">구독상품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="" class="admin-navi-menu">리뷰관리</a></li>
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

    <!-- admin 관리자페이지 회원관리 -->
    <div id="admin-member-wrap">

        <span id="admin-member-title">전체 주문 내역</span>
        <hr id="admin-member-hr">

        <br>

        <!-- 전체 주문 내역 메뉴바 항목 14개 -->
        <!-- 주문번호, 회원번호, 주문자, 주문일, 수령자, 수령일, 수령자 전화번호, 배송지, 우편번호, 총결제금액, 결제번호, 주문상태, 배송상태, 상세보기 -->
        <div>
            
            <table class="admin-order-list-table">
                <!-- 메뉴바 -->
                <thead id="admin-order-list-thead">

                    <tr >
                        <th>주문번호</th>
                        <th>회원번호</th>
                        <th>주문자</th>
                        <th>주문일</th>
                        <th>수령자</th>
                        <th>수령일</th>
                        <th>수령자 전화번호</th>
                        <th>배송지</th>
                        <th>우편번호</th>
                        <th>총결제금액</th>
                        <th>결제번호</th>
                        <th>주문상태</th>
                        <th>배송상태</th>
                        <th>상세보기</th>
                    </tr>

                </thead>

                <!-- 전체 주문 내역 내용 -->
                <tbody>

                    <!-- 1 -->
                    <tr>
                        <td>20220621001</td>
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
                        <td><button type="button">V</button></td>
                    </tr>

                    <!-- 2 -->
                    <tr>
                        <td>20220622002</td>
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
                        <td><button type="button">V</button></td>
                    </tr>

                    <!-- 3 -->
                    <tr>
                        <td>20220622002</td>
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
                        <td><button type="button">V</button></td>
                    </tr>
                </tbody>

            </table>
            
        </div>

    </div>

    <div>
        <span><a></a></span>
    </div>

    <!-- 페이징 처리 -->
    <!-- 
    <div class="admin-order-paging">

        <ul class="admin-order-paging-ul">

            <li class="admin-order-page-item">
                <a class="admin-order-page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <li class="admin-order-page-item"><a class="admin-order-page-link" href="#">1</a></li>
            <li class="admin-order-page-item"><a class="admin-order-page-link" href="#">2</a></li>
            <li class="admin-order-page-item"><a class="admin-order-page-link" href="#">3</a></li>
            <li class="admin-order-page-item"><a class="admin-order-page-link" href="#">4</a></li>
            <li class="admin-order-page-item"><a class="admin-order-page-link" href="#">5</a></li>
            
            <li class="admin-order-page-item">
                <a class="admin-order-page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>

        </ul>

    </div>
    -->
</body>
</html>
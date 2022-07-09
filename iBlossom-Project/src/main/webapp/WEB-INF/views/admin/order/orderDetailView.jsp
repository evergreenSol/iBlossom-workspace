<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_Order_Individual order details</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="resources/css/ldo-admin.css" rel="stylesheet">
<style>

	/* 개별 주문 내역 */
	
	/* 개별주문내역 - table */
	.admin-order-detail-table {
	    margin: auto; /* 표 중간 */
	    text-align: center; /* 글자 가운데 정렬 */
	    border-collapse: collapse; /* 테두리 사이의 간격을 없애고 싶다면 */
	    width: 1000px;
	}
	
	/* 개별주문내역 - td 전체 */
	.admin-order-detail-table>tbody>tr>td {
	    border: 1px solid rgba(226, 226, 226, 0.982);
	    padding: 18px;
	    font-size: small;
	}
	
	/* 개별주문내역 - table > 머리 */
	.admin-table-head {
	    /*
	    background-color: #86848481;
	    color : black;
	    */
	    background-color: #444444;
	    color : white;
	    width : 70px;
	    font-weight: bold;
	}
	
	/* 개별주문내역 - table > 내용 */
	.admin-table-content {
	    width: 300px;
	}
	
	/* 개별주문내역 - table 머리말 */
	.table-caption { 
	    text-align: left;
	    margin-bottom: 10px;
	    font-weight: bold;
	    font-size: large;
	}
	
	/* 개별주문내역 - 상세정보 table 헤드 */
	.detail-th>th {
	    padding: 18px;
	    font-size: small;
	}
	
	/* 개별주문내역 - 상세정보 너비 조정 */
	.detail-th-1 { width: 80px; }
	.detail-th-2 { width: 130px; }
	.detail-th-4 { width: 60px; }
	.detail-th-5 { width: 100px; }
	
	/* 테이블 감싸는 div */
	.detail-wrap {
		width: 100%;
	}
	
	/* 이전으로 버튼 */
	#admin-order-pre-btn {
		text-decoration: none;
		color: dimgray;
		font-size: larger;
		float: right;
		margin-right: 100px;
	}
	
	/* 이전으로 버튼 호버시 */
	#admin-order-pre-btn:hover {
		color: black;
		font-weight: 600;
	}

</style>
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
                    <li><a href="" class="admin-navi-menu">회원관리</a></li>
                    <li>
                        <a href="" class="admin-navi-menu" style="font-weight: 700;" >주문정보관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="adminList.or">전체주문내역</a></li>
                            <li><a href="adminDetail.or">개별주문내역</a></li>
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
    
    <!------------------------------------------------------------------->

    <!-- admin 관리자페이지 주문정보관리 -->
    <div id="admin-member-wrap">

        <span id="admin-member-title">개별 주문 내역</span>
        
        <hr id="admin-member-hr">

        <br>

		<div class="detail-wrap">
				
	         <!-- 주문정보 영역 -->
	         <table class="admin-order-detail-table">
	
	            <caption class="table-caption">주문정보</caption>
	            
	            <tr>
	                <td class="admin-table-head">주문번호</td>
	                <td class="admin-table-content">1</td>
	                <td class="admin-table-head">주문자</td>
	                <td class="admin-table-content">아무개</td>
	            </tr>
	
	            <tr>
	                <td class="admin-table-head">주문일자</td>
	                <td class="admin-table-content">2022-06-21</td>
	                <td class="admin-table-head">주문상태</td>
	                <td class="admin-table-content">결제완료</td>
	            </tr>
	
	        </table>
	        
	        <br><br>
	
	        <!-- 배송정보 영역 -->
	        <table class="admin-order-detail-table">
	
	            <caption class="table-caption">배송정보</caption>
	            
	            <tr>
	                <td class="admin-table-head">배송주소</td>
	                <td class="admin-table-content">서울시 영등포구</td>
	                <td class="admin-table-head">연락처</td>
	                <td class="admin-table-content">010-0000-0000</td>
	            </tr>
	
	        </table>
	        
	        <br><br>
	
	        <!-- 결제정보 영역 -->
	        <table class="admin-order-detail-table">
	
	            <caption class="table-caption">결제정보</caption>
	            
	            <tr>
	                <td class="admin-table-head">주문금액</td>
	                <td class="admin-table-content">31,800원</td>
	                <td class="admin-table-head">배송비</td>
	                <td class="admin-table-content">0원</td>
	            </tr>
	
	        </table>
	        
	        <br><br>
	
	        <!-- 상세정보 영역 -->
	        <table class="admin-order-detail-table">
	            
	            <caption class="table-caption">상세정보</caption>
	            
	            <tr class="admin-table-head detail-th">
	                <th class="detail-th-1">상품번호</th>
	                <th class="detail-th-2">카테고리</th>
	                <th class="detail-th-3">상품명</th>
	                <th class="detail-th-4">수량</th>
	                <th class="detail-th-5">가격</th>
	            </tr>
	
	            <!-- 1 -->
	            <tr class="admin-table-content">
	                <td>001</td>
	                <td>꽃다발</td>
	                <td>프리지아</td>
	                <td>1개</td>
	                <td>18,000원</td>
	            </tr>
	
	            <!-- 2 -->
	            <tr class="admin-table-content">
	                <td>001</td>
	                <td>꽃다발</td>
	                <td>프리지아</td>
	                <td>1개</td>
	                <td>18,000원</td>
	            </tr>
	
	            <!-- 3 -->
	            <tr class="admin-table-content">
	                <td>001</td>
	                <td>꽃다발</td>
	                <td>프리지아</td>
	                <td>1개</td>
	                <td>18,000원</td>
	            </tr>
	        
	        </table>
        
            <br><br><br>
    
		    <div>
		    	<a href="adminList.or" id="admin-order-pre-btn">&lt; 이전으로</a>    	
		    </div>
		    
        </div>

    </div>
    


	<br><br><br><br><br>

</body>
</html>
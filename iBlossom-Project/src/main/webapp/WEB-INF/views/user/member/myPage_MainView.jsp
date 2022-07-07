<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | MyPage</title>
<link href="resources/css/khs.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

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
                        <!-- <h2>상품 주문내역</h2> -->
						<h2>주문배송조회</h2>
                        <div class="mypage-first">
                            <div class="delivery">
                                <b>0</b>
                                <span>배송 전</span>
                            </div
                            ><div class="delivery">
                                <b>0</b>
                                <span>배송 중</span>
                            </div
                            ><div class="delivery">
                                <b>0</b>
                                <span>배송 완료</span>
                            </div>
                        </div>

                        <br><br>

                        <h2>나의주문내역</h2>
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
                                <td colspan="2"><p style="font-size: 18px; font-weight: 600">2022-06-23</p></td>
                                <td></td>
                                <td width="650" align="right"><a href="orderDetailView.me" class="moreBtn" style="padding-right : 10px;">주문상세</a></td>  
 
                            </tr>
                            <tr>
                                <td rowspan="5" width="100" height="100"><img src="https://kukka-2-media-123.s3.amazonaws.com/static/kukkart_new/img/common/thumbnail_mypage.png"></td>
                                <!-- 사진은 ajax로 넣기 (모든게 로드 된 뒤에 ajax로 주문번호에 해당되는 상품 상세 조회 후 그 상품의 사진경로 가져오기)-->
                                <th width="80">주문번호</th>
                                <td width="10"></td>
                                <td class="orderNo" width="80">
                                    1
                                </td>
                            </tr>
                            <tr>
                                <th>수령일</th>
                                <td></td>
                                <td>2022-06-25</td>
                            </tr>
                            <tr>
                                <th>결제금액</th>
                                <td></td>
                                <td>19000원</td>
                            </tr>
                            <tr>
                                <th>주문상태</th>
                                <td></td>
                                <td>결제완료</td>
                            </tr>
                            <tr>
                                <th>배송상태</th>
                                <td></td>
                                <td>배송완료</td>
                            </tr>
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
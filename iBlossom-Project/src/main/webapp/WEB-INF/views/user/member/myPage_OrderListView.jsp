<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 주문내역</title>
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
                                주문 / 배송 <span>(1)</span>
                            </button>
                        </div
                        ><div class="mypage-show-order">
                            <button type="button" id="show-cancel">
                                취소 / 환불 <span>(1)</span>
                            </button>
                        </div>

                        <table id="mypage-view-order">
                            <tr>  
                                <td colspan="2"><p style="font-size: 18px; font-weight: 600">2022-06-23</p></td>
                                <td></td>
                                <td colspan="2" width="650" align="right"><a href="orderDetailView.me" class="moreBtn" style="padding-right: 10px; color:black;">주문상세</a></td>  
                            </tr>
                            <tr height="26">
                                <td rowspan="5" width="100" height="100"><img src="" style="width:100%"></td>
                                <!-- 사진은 ajax로 넣기 (모든게 로드 된 뒤에 ajax로 주문번호에 해당되는 상품 상세 조회 후 그 상품의 사진경로 가져오기)-->
                                <th width="80" >주문번호</th>
                                <td width="10" ></td>
                                <td class="orderNo" width="90">
                                    1
                                </td>
                                
                            </tr>
                            <tr height="26">
                                <th>수령일</th>
                                <td></td>
                                <td>2022-06-25</td>
                            </tr>
                            <tr height="26">
                                <th>결제금액</th>
                                <td></td>
                                <td>19000원</td>
                            </tr>
                            <tr height="26">
                                <th>주문상태</th>
                                <td></td>
                                <td>결제완료</td>
                                
                            </tr>
                            <tr height="26">
                                <th>배송상태</th>
                                <td></td>
                                <td>배송완료</td>
                                <td style="text-align: right; padding-right: 10px;" width="300"><a class="mypage-pay-cancel" href="">취소하기</a></td>
                            </tr>
                        </table>


                        <table id="mypage-view-cancel">
                            <tr >
                                <td colspan="2"><p style="font-size: 18px; font-weight: 600">2022-06-23</p></td>
                                <td></td>
                                <td colspan="2" width="650" align="right"><a href="" class="moreBtn" style="padding-right: 10px; color:black;">주문상세</a></td>  
 
                            </tr>
                            <tr height="26">
                                <td rowspan="5" width="100" height="100"><img src="https://kukka-2-media-123.s3.amazonaws.com/static/kukkart_new/img/common/thumbnail_mypage.png" style="width:100%"></td>
                                <!-- 사진은 ajax로 넣기 (모든게 로드 된 뒤에 ajax로 주문번호에 해당되는 상품 상세 조회 후 그 상품의 사진경로 가져오기)-->
                                <th width="80">주문번호</th>
                                <td width="10"></td>
                                <td class="orderNo" width="90">
                                    1
                                </td>
                            </tr>
                            <tr height="26">
                                <th>수령일</th>
                                <td></td>
                                <td>2022-06-25</td>
                            </tr>
                            <tr height="26">
                                <th>결제금액</th>
                                <td></td>
                                <td>19000원</td>
                            </tr>
                            <tr height="26">
                                <th>주문상태</th>
                                <td></td>
                                <td>결제완료</td>
                                
                            </tr>
                            <tr height="26">
                                <th>배송상태</th>
                                <td></td>
                                <td>배송완료</td>
                                <td style="text-align: right; padding-right: 10px;" width="300"></td>
                            </tr>
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

                $(this).css("color","black").css("border-bottom-width","2px").css("border-bottom-color","rgb(255 35 147)"); // 핑크 치우려면 이 컬러 지우면 댐
                // $("#show-cancel").css("color","rgb(209 209 209)").css("border-bottom-width","1px").css("border-bottom-color","rgb(209 209 209)");
                $("#show-cancel").css("color","rgb(209 209 209)").css("border-bottom-width","1px").css("border-bottom-color","rgb(209 209 209)");

                $("#mypage-view-order").show();
                $("#mypage-view-cancel").hide();

            });

            $("#show-cancel").click(function () {

                $(this).css("color","black").css("border-bottom-width","2px").css("border-bottom-color","rgb(255 35 147)"); // 핑크 치우려면 이 컬러 지우면 댐
                $("#show-order").css("color","rgb(209 209 209)").css("border-bottom-width","1px").css("border-bottom-color","rgb(209 209 209)");

                console.log("찍")
                $("#mypage-view-order").hide();
                $("#mypage-view-cancel").show();

            });

        });

    </script>
	
	
	
	
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br><br>
	
	
	

	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 구독내역</title>
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
                    
                    	<h2>나의 정기구독</h2>
                        <div class="mypage-subscribe" style="text-align: center">
                            <span style="font-size: 16px; font-weight: 600;">
                                김한솔님은
                                <span class="subscribe-name"> 구독상품 1 </span>
                                <span>을 구독중이십니다.</span>
                            </span>
                        </div>


                        
                        <table>
                            <tr>
                                <td colspan="2"><p style="font-size: 18px; font-weight: 600">2022-06-23</p></td>
                                <td></td>
                                <td width="490" align="right"></td>
 
                            </tr>
                            <tr>
                                <td rowspan="5" width="100" height="100"><img src=""></td>
                                <th width="80">상품명</th>
                                <td width="10"></td>
                                <td class="productName" width="80">
                                    꽃이름
                                </td>
                            </tr>
                            <tr>
                                <th>받는분</th>
                                <td></td>
                                <td>김한솔</td>
                            </tr>
                            <tr>
                                <th>구독내용</th>
                                <td></td>
                                <td>정기결제</td>
                            </tr>
                            <tr>
                                <th>회차</th>
                                <td></td>
                                <!-- 만약에 구독개월스 컬럼이 0이면,  아래처럼 arraylist의 사이즈 뽑으면 될듯?-->
                                <td>1회 / 해지시까지</td>
                                <!-- 만약에  구독개월수 컬럼이 0이 아니면, 
                                
                                    <td> 4회(배송전인 컬럼 중 가장 작은 컬럼) / 12(arrayList의 사이즈)회
                                -->
                            </tr>
                            <tr>
                                <th>주문상태</th>
                                <td></td>
                                <td>구독중</td>
                                <td colspan="3" style="text-align: right; padding-right: 10px;"><a href="" class="mypage-subscribe-cancel">구독취소</a></td>
                            </tr>
                        </table>

                        <br><br>

                        <p style="font-size: 18px; font-weight: 600;">나의 구독 일정</p>
                        <div style="width: 100%">
                            <table align="center" style="text-align: center; font-size: 14px; width: 100%">
                                <thead style="background: rgb(248, 248, 248); border-style: none;">
                                    <tr height="40">
                                        <th>회차</th>
                                        <th width="200">수령일</th>
                                        <th>배송상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr height="40">
                                        <td>1회차</td>
                                        <td>2022-07-01</td>
                                        <td>배송완료</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <br><br>

                        <p style="font-size: 18px; font-weight: 600">배송지</p>

                        <div class="mypage-delivery-to" >
                            <span style="font-size: 16px; font-weight: 600;">
                                김한솔
                                <span>010-5273-5545</span>
                                <span>보내는 사람 (김한솔)</span>
                            </span>
                            <p style="font-size: 14px; margin: 0px;">[postcode] 인천광역시 부평구 창휘로 28 605호</p>                            
                        </div>

                        <br><br>

                        <p style="font-size: 18px; font-weight: 600">결제 내역</p>
                        <div style="width: 100%">
                            <table align="center" style="text-align: center; font-size: 14px; width: 100%">
                                <thead style="background: rgb(248, 248, 248); border-style: none;">
                                    <tr height="40">
                                        <th>회차</th>
                                        <th width="200">결제일</th>
                                        <th>수령일</th>
                                        <th>배송상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr height="40">
                                        <td>1회차</td>
                                        <td>2022-06-23</td>
                                        <td>2022-07-01</td>
                                        <td>배송완료</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <br><br>

                    </div>
			
                </td>
            </tr>
    
        </table>
    
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
</body>
</html>
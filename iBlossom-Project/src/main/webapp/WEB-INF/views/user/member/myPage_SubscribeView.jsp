<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 나의 구독</title>
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
                                <span class="subscribe-name"> ${ list3m[0].subProductName } </span>
                                <span>을 구독중이십니다.</span>
                            </span>
                        </div>
                        
                        <c:forEach var="i"  begin="0" end="${ list3m.size() -1 }" >
	                        <table>
	                            <tr>
	                                <td colspan="2"><p style="font-size: 18px; font-weight: 600">${ list3m[i].subDate }</p></td>
	                                <td></td>
	                                <td width="490" align="right"></td>
	 
	                            </tr>
	                            <tr>
	                                <td rowspan="5" width="100" height="100"><img src="${ list3m[i].subChangeName }" width="100px" height="100px"></td>
	                                <th width="80">상품명</th>
	                                <td width="10"></td>
	                                <td class="productName" width="80">
	                                    ${ list3m[i].subProductName }
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>받는분</th>
	                                <td></td>
	                                <td>${ list3m[i].subReceiverUser }</td>
	                            </tr>
	                            <tr>
	                                <th>구독내용</th>
	                                <td></td>
	                                <td class="subLevel">${ list3m[i].subLevel }</td>
	                            </tr>
	                            <tr>
	                                <th>회차</th>
	                                <td></td>
	                                <!-- 만약에 구독개월스 컬럼이 0이면,  아래처럼 arraylist의 사이즈 뽑으면 될듯?-->
	                                <td>${i+1}회 / 해지시까지</td>
	                                <!-- 만약에  구독개월수 컬럼이 0이 아니면, 
	                                
	                                    <td> 4회(배송전인 컬럼 중 가장 작은 컬럼) / 12(arrayList의 사이즈)회
	                                -->
	                            </tr>
	                            
	                            <tr>
	                                <th>주문상태</th>
	                                <td></td>
	                                <td>${ list3m[i].deliverStatus }</td>
	                                <td colspan="3" style="text-align: right; padding-right: 10px;"><a href="" class="mypage-subscribe-cancel">구독취소</a></td>
	                            </tr>
	                        </table>
                        </c:forEach>

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
                        <c:forEach var="i"  begin="0" end="${ list.size() -1 }" >
	                                    <tr height="40">
	                                        <td>${ i+1 }회차</td>
	                                        <td>${ list3m[i].deliverAt }</td>
	                                        <td>${list3m[i].deliverStatus }</td>
	                                    </tr>
                        </c:forEach>
	                                </tbody>
	                            </table>
	                        </div>

                        <br><br>

                        <p style="font-size: 18px; font-weight: 600">배송지</p>

                        <div class="mypage-delivery-to" >
                        <c:forEach var="i"  begin="0" end="0" >
                            <span style="font-size: 16px; font-weight: 600;">
                                ${ list3m[0].subReceiverUser }
                                <span>${ list3m[0].subReceiverPhone }</span>
                                <span>보내는 사람 (${ loginUser.userName })</span>
                            </span>
                            <p style="font-size: 14px; margin: 0px;">[${ list3m[0].subReceiverUser }] ${ list3m[0].deliverTo }</p> 
                        </c:forEach>                         
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
                                <c:forEach var="i"  begin="0" end="${ list.size() -1 }" >
                                    <tr height="40">
                                        <td>${ i+1 }회차</td>
                                        <td>${ list3m[i].subDate }</td>
                                        <td>${ list3m[i].deliverAt }</td>
                                        <td>${ list3m[i].deliverStatus }</td>
                                    </tr>
                                </c:forEach>
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
    
    
    <script>
    	$(function () {
    		
    		console.log($(".subLevel").text());
    		if($(".subLevel").text() == "666666") {
    			$(".subLevel").text("6개월 구독");
    		}
    		
    	});
    </script>
    
</body>
</html>
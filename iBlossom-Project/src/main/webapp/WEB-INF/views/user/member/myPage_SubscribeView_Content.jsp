<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독</title>
</head>
<body>


	<div class="mypage-subscribe" id="subscribe-title" style="text-align: center">
	    <span style="font-size: 16px; font-weight: 600;">
	        ${ sessionScope.loginUser.userName }님의 구독상품: 
	        <span class="subscribe-name"> ${ list[0].subProductName } </span>
	        <span>입니다.</span>
	    </span>
	</div>
	
	<!-- 멘트: ㅁㅁ 님은 ㅁㅁㅁ 구독중이십니다. or -->
	
	
	<div id="subscribe-content" class="subscribe-content">
                        
		<c:forEach var="i"  begin="0" end="${ list.size() -1 }" >
			<table>
	               <tr>
	                   <td colspan="2"><p style="font-size: 18px; font-weight: 600">${ list[i].subDate }</p></td>
	                   <td></td>
	                   <td width="490" align="right"></td>
	
	               </tr>
	               <tr>
	                   <td rowspan="5" width="100" height="100"><img src="${ list[i].subChangeName }" width="100px" height="100px"></td>
	                   <th width="80">상품명</th>
	                   <td width="10"></td>
	                   <td class="productName" width="80">
	                       ${ list[i].subProductName }
	                   </td>
	               </tr>
	               <tr>
	                   <th>받는분</th>
	                   <td></td>
	                   <td>${ list[i].subReceiverUser }</td>
	               </tr>
	               <tr>
	                   <th>구독내용</th>
	                   <td></td>
	                   <c:if test="${list[0].subLevel eq 1}">
	                   		<td class="subLevel">정기 구독
	                   </c:if>
	                   <c:if test="${list[0].subLevel ne 1}">
		                   <td class="subLevel">${list[0].subLevel}개월 구독</td>
	                   </c:if>
	               </tr>
	               <tr>
	                   <th>회차</th>
	                   <td></td>
	                   <!-- 만약에 구독개월스 컬럼이 0이면,  아래처럼 arraylist의 사이즈 뽑으면 될듯?-->
	                   <td>${i+1}회 / ${ list.size() }회</td>
	                   <!-- 만약에  구독개월수 컬럼이 0이 아니면, 
	                   
	                       <td> 4회(배송전인 컬럼 중 가장 작은 컬럼) / 12(arrayList의 사이즈)회
	                   -->
	               </tr>
	               
	               <tr>
	                   <th>주문상태</th>
	                   <td></td>
	                   <td>${ list[i].deliverStatus }</td>
	                   <td colspan="3" style="text-align: right; padding-right: 10px;"></td>
	               </tr>
		</table>
		</c:forEach>
		
		<br><br>
			<div style="margin-bottom: 18px;">
				<span style="font-size: 18px; font-weight: 600;">나의 구독 일정</span>
				<div class="mypage-subscribe-cancel-area" style="display:inline; margin-left: 595px;">
					<button type="button" class="mypage-subscribe-cancel">구독취소</button>
					<input type="hidden" value="${ list[0].receiptId }" name="receiptId">
				</div>
			</div>
			<div style="width: 100%">
				<table align="center" style="text-align: center; font-size: 14px; width: 100%">
					<thead style="background: rgb(248, 248, 248); border-style: none;">
						<tr height="40">
							<th>회차</th>
							<th width="400">수령일</th>
							<th>배송상태</th>
				        </tr>
				    </thead>
				    <tbody>
			<c:forEach var="i"  begin="0" end="${ list.size() -1 }" >
				    	<tr height="40">
							<td>${ i+1 }회차</td>
							<td>${ list[i].deliverAt }</td>
							<td>${list[i].deliverStatus }</td>
						</tr>
			</c:forEach>
				    </tbody>
				</table>
			</div>
			<input type="hidden" value="${ list[0].subLevel }" name="subLevel">


		
		<br><br>
		
		<p style="font-size: 18px; font-weight: 600">배송지</p>
		
		<div class="mypage-delivery-to" >
		<c:forEach var="i"  begin="0" end="0" >
			<span style="font-size: 16px; font-weight: 600;">
				${ list[0].subReceiverUser }
				<span>${ list[0].subReceiverPhone }</span>
				<span>보내는 사람 (${ loginUser.userName })</span>
		    </span>
			<p style="font-size: 14px; margin: 0px;">[${ list[0].subReceiverPostcode }] ${ list[0].deliverTo }</p> 
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
						<td>${ list[i].subDate }</td>
						<td>${ list[i].deliverAt }</td>
						<td>${ list[i].deliverStatus }</td>
					</tr>
				</c:forEach>
		        </tbody>
			</table>
		</div>
	</div>
	
	<script>
		$(function () {
			
			

			$(".mypage-subscribe").on("click", function() {
				
                $(this).next().slideDown("1500");
                
            });
			
			
		});
	
	</script>
    
	

</body>
</html>
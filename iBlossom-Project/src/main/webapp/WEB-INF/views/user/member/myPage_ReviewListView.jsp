<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Membership</title>
<link href="resources/css/khs.css" rel="stylesheet">
<link href="resources/css/modal_mypage_review.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="mypage-wrap">
	
        <jsp:include page="myPage_Header.jsp"/>
        
        
        <table class="mypage-body">
        	<tr>
            	<td class="body_l" style="vertical-align: top;" width="300">
            		<jsp:include page="myPage_Category.jsp"/>
            	</td>
                <td class="body_r" width="900" style="vertical-align: top;">
                    <div class="delete">
                   		<h2>리뷰 내역</h2>
                    
                    	<div style="width: 100%">
                            <table align="center" style="text-align: center; font-size: 14px; width: 100%; border-collapse: collapse;" id="reviewTable">
                                <thead style="background: rgb(248, 248, 248); border-style: none;">
                                    <tr height="40">
                                        <th width="150">리뷰 상품</th>
                                        <th width="500">제목</th>
                                        <th width="150">리뷰 날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${ not empty list }">
                                <c:forEach var="r" items="${list}">
                                    <tr height="40">
                                    	<input type="hidden" value="${r.reviewNo}">
                                        <td>${ r.flowerName }</td>
                                        <td>${ r.reviewTitle }</td>
                                        <td>${ r.createDate }</td>
                                    </tr>
                                </c:forEach>
                                </c:if>
                                <c:if test="${ empty list }">
                                	
                                <tr>
                                	<td height="300" width="900" colspan="4" id="no-qna">
                                		회원님께서 남기신 리뷰가 없습니다.
                                	</td>
                                </tr>	
                               
                                </c:if>
                                
                                </tbody>
                            </table>
                        </div>

                    </div>
			
                </td>
            </tr>
    
        </table>
        
        
        <div id="modal" class="modal-overlay">
		<form action="update.re" method="post" enctype="multipart/form-data">

			<div class="modal-window" style="height: 550px">
				<input type="text" name="productNo" value="${ p.productNo }">
				<input type="text" name="userNo" value="${loginUser.userNo}">
				<div class="title">
					<span style="font-size: 20px; margin-top: 10px;">구매평 작성</span>
				</div>
				<div class="close-area">
					<img src="resources/images/x.png" style="width: 15px;">
				</div>

				<div class="content">
					<hr>

					<div
						style="height: 50px; border: 1px solid gainsboro; margin-top: 40px; text-align: center;">
						<p>${p.flowerName}</p>
					</div>
					<br>
					<div>
						<input type="text" name="reviewTitle"
							style="width: 370px; height: 30px; border: 1px solid gray;">
					</div>
					<br>
					<textarea rows="2" cols="10" onkeyup="counter(this,150)"
						name="reviewContent"
						placeholder="꽃 파손이나 배송등 문제사항은 구매평에 남겨주시면 확인이 어렵습니다."></textarea>
					<div style="text-align: right;">
						<span id="reCount">0 / 150</span>
					</div>

					<br> <br> <input type="file" name="upReviewPhoto">
					<div class="modal-button-area" align="center">

						<!--<button onclick="modalOff()">취소</button>-->
						<button type="submit" id="sign">등록</button>
					</div>
				</div>

				<script>
		            function counter(text,length){
		                var limit = length;
		                var str = text.value.length;
		                if(str>limit){
		                    alert("최대 150자까지 입력 가능합니다.");
		                    text.value = text.value.substring(0,limit);
		                    text.focus();
		                }
		                document.getElementById("reCount").innerHTML = text.value.length + " / " + limit;
		            }
		        </script>


			</div>
		</form>
	</div>
        
        
        
        
        
        
        
    
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
 
<script>
 	$(function () {
 		
 		
 		$("#category-review").css("font-weight", "700");
 		
 		
 	});
 	
 	$("#reviewTable>tbody tr").click( function () {
			console.log("click");
			console.log($(this).children().eq(0).val());
			
			var reviewNo = $(this).children().eq(0).val();
			
			location.href="reviewDetailView.me?reviewNo=" + reviewNo;
			
	});
 	
    

</script>
 


</body>
</html>
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
                   		<h2><a href="detailList.pr?pno=${ r.productNo }" style="font-decoration: none;">${ r.flowerName }</a> / 리뷰 내역</h2>
                    
                    	<form id="postForm" action="updateMy.re" method="post" enctype="multipart/form-data">
                    	<input type="hidden" name="reviewNo" value="${r.reviewNo}">
                    	
                    	<div style="width: 100%; margin-top: 20px;">
                            <table align="center" style="text-align: left; font-size: 16px; width: 100%; border-collapse: collapse;">
                                <tr height="40" >
                                    <td width="750" >
                                    <input name="reviewTitle" type="text" value="${r.reviewTitle }" style="font-size: 20px; font-weight: 600; width:460px">
                                    </td>
                                    <td width="150" style="color: gray">${r.createDate }</td>
                                 
                                </tr>
                                <tr>
                                	<td colspan="2">
                                	<img src="${r.reviewPhoto}" style="width:300px;">
                                        <input type ="file" name="reReviewPhoto" value="${r.reviewPhoto}">	
                                	</td>
                                </tr>
                                <tr height="40" ></tr>
                                <tr>
                               		<td colspan="2">
                               		<textarea rows="2" cols="10" onkeyup="counter(this,150)"
                               		 style="font-size: 16px; width:460px; height: 120px; resize:none" name="reviewContent">${r.reviewContent }</textarea>
                               		 	<div style="margin-left:415px">
											<span id="reCount" >0 / 150</span>
										</div>
                               		</td>
                                </tr>
                            </table>
	                            <button type="submit" id="insertReviewBtn" style="margin-top:40px; width: 130px;height: 50px; background-color: black; 	color: white; font-weight: 700;">수정등록하기</button>
	            
	           
                        </div>
                        
                        </form>

                    </div>
			
                </td>
            </tr>
    
        </table>
        
    </div>
    
     <br><br><br> <br><br><br>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
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
    
    <script>
 	$(function () {
 		
 		$("#category-review").css("font-weight", "700");
 		
 	});
    </script>
    



</body>
</html>
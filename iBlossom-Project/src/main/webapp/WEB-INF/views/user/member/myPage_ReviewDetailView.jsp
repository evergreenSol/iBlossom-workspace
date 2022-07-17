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
                    
                    	<form action="" method="post" enctype="multipart/form-data">
                    	
                    	<div style="width: 100%; margin-top: 20px;">
                            <table align="center" style="text-align: left; font-size: 16px; width: 100%; border-collapse: collapse;">
                                <tr height="40" >
                                    <td width="750" >
                                    <input name="reviewTitle" type="text" value="${r.reviewTitle }" style="font-size: 20px; font-weight: 600; border:none; width:100%">
                                    </td>
                                    <td width="150" style="color: gray">${r.createDate }</td>
                                </tr>
                                <tr>
                                	<td colspan="2">
                                	<img src="${r.reviewPhoto}" style="width:400px;"></img>
                                	</td>
                                </tr>
                                <tr height="40" ></tr>
                                <tr>
                               		<td colspan="2">
                               		<textarea style="font-size: 16px; width: 100%; height: 120px; border:none; resize:none">${r.reviewContent }</textarea>
                               		</td>
                                </tr>
                            </table>
                            
                            <div class="mypage-review-wrap" align="center">
	                            <button type="button" class="mypage-review" onclick="">삭제하기</button>
	                            <button type="submit" class="mypage-review" onclick="">수정하기</button>
	                        </div>
                        </div>
                        
                        </form>

                    </div>
			
                </td>
            </tr>
    
        </table>
        
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
 	$(function () {
 		
 		$("#category-review").css("font-weight", "700");
 		
 	});
    </script>


</body>
</html>
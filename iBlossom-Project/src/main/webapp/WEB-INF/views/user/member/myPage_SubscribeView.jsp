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
                    	
						<c:if test="${ not empty listReg }">
							<jsp:include page="myPage_SubscribeView_Regular.jsp"/>
						</c:if>
						<c:if test="${ not empty list3m }">
							<jsp:include page="myPage_SubscribeView_3Month.jsp"/>
						</c:if>
						<c:if test="${ not empty list6m }">
							<jsp:include page="myPage_SubscribeView_6Month.jsp"/>
						</c:if>
						<c:if test="${ not empty list12m }">
							<jsp:include page="myPage_SubscribeView_12Month.jsp"/>
						</c:if>
						<c:if test="${ empty listReg and empty list3m and empty list6m and empty list12m }">
							<div class="mypage-subscribe" style="text-align: center">
							    <span style="font-size: 16px; font-weight: 600;">
							        ${ sessionScope.loginUser.userName }님은
							        <span class="subscribe-name"></span>
							        <span>구독중인 상품이 없습니다.</span>
							    </span>
							</div>							
						</c:if>
                        
                    </div>
			
                </td>
            </tr>
    
        </table>
    
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    
    <script>
    	$(function () {
    		
    		$("#subscribe-regular-show").on("click", function() {
    			
   				$("#subscribe-regular").slideToggle("1500");

            });
    		
    		$("#subscribe-3m-show").on("click", function() {

    			$("#subscribe-3m").slideToggle("1500");
    			
            });
    		
    		$("#subscribe-6m-show").on("click", function() {
    			
                $("#subscribe-6m").slideToggle("1500");
            });
    		
    		$("#subscribe-12m-show").on("click", function() {
    			
                $("#subscribe-12m").slideToggle("1500");
            });
    		
    	});
    	
    	
    	
    </script>
    
</body>
</html>
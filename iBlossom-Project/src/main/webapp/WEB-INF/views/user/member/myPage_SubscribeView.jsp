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
                
                	<c:choose>
                		<c:when test="${ empty receiptIdList}">
	                		<div class="mypage-subscribe" style="text-align: center">
							    <span style="font-size: 16px; font-weight: 600;">
							        ${ sessionScope.loginUser.userName }님은
							        <span class="subscribe-name"></span>
							        <span>현재 구독중인 상품이 없습니다.</span>
							    </span>
							</div>
                		</c:when>
                		<c:otherwise>
	                		<c:forEach var="i"  begin="1" end="${receiptIdList.size()}">
		                    	<div class="delete" id="delete${i}">
		                    	</div>
	                   		</c:forEach>
                		</c:otherwise>
                	</c:choose>
                    
                </td>
            </tr>
    
        </table>
    
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    
    <script>
	
    var str = '${receiptIdList}';
    str = str.slice(1);
    str = str.slice(0, -1);
   
 	/*
    var receiptIdList = new Array();
    receiptIdList = list.split(',');
    
    console.log(list);
    console.log(receiptIdList);
	*/

    var arr = str.split(', ');
    // console.log(arr);
    // console.log(arr.length);
    
    
   	$(function () {
   		// console.log(arr.length);
   		
   		
   		$(".mypage-subscribe").on("click", function() {
   			
               $(".subscribe-content").slideToggle("1500");
           });
   		
			for(var i = 0; i < arr.length; i++) {
				console.log(i);
    			// console.log($(".body_r").children().eq(i));
    			// console.log($(".body_r").find("div:eq("+ i +")"));
	    		(function(i) {
	    			$.ajax({
		    			url : "subscribeRealView.me",
		    			type:"post",
		    			dataType : "text",
		    			async: true,
		    			data : {
		    				receiptId : arr[i] 
		    			},
		    			success : function (result) {
		    				// console.log(result);
		    				console.log(i);
		    				var num = i + 1;
		    				// console.log(num);
		    				$("#delete"+ num +"").html(result);
		    				//$(".body_r").children().eq(i).html(result);
		    				//$(".body_r").find("div:eq("+ i +")").html(result);
		    			},
		    			error : function () {
		    				console.log("실패");
		    			}
		    		});
	    		})(i);
    		/*
    		$.ajax({
    			url : "subscribeRealView.me",
    			type:"post",
    			dataType : "text",
    			data : {
    				receiptId : arr[1] 
    			},
    			success : function (result) {
    				console.log(result);
    				$("#delete2").html(result)
    			},
    			error : function () {
    				console.log("실패");
    			}
    		});
    		
    		$.ajax({
    			url : "subscribeRealView.me",
    			type:"post",
    			dataType : "text",
    			data : {
    				receiptId : arr[2] 
    			},
    			success : function (result) {
    				console.log(result);
    				$("#delete3").html(result)
    			},
    			error : function () {
    				console.log("실패");
    			}
    		});
    		*/
    		
   		}
   		
			
			var refundPrice;
			
			var subPrice = ${ list[0].subPrice }
			
			
			$(".mypage-subscribe-cancel").click(function () { 
				
				console.log();
		
				$.ajax({
					url : "cancelSubscribe.me",
					data : {
						receiptId : $(this).next().val()
					},
					type : "POST",
					success : function (result) {
						
							console.log("수정이 되었음");
							console.log(result);
							
							refundPrice = result * subPrice;
							console.log(refundPrice);
						
						$.ajax({
							url : "goGetToken.do",
							type : "post",
							success : function(token) {
								
								console.log("token 생성됨 : " + token);
								
								$.ajax({
									url : "cancelRequest.do",
									data : {
										receiptId : $(this).next().val(),
										price : refundPrice
										},
									type : "post",
									success : function(result) {

										alert("구독 취소되었습니다.");
										
										location.reload();
									
									}, error : function() {
										console.log("안되면 집ㄱ");
									}
								});
								
								
							}, error : function() {
								console.log("토큰 생성 실패");
							}
						});
						
					},
					error : function () {
						console.log("실패");
					}
					
				});
			});
			
			
			
			
   	});
  
    	
    </script>
    
    	
</body>
</html>
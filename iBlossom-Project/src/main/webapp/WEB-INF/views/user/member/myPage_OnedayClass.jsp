<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 원데이클래스</title>
<link href="resources/css/khs.css" rel="stylesheet">
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
                        <h2>나의 클래스</h2>
                        <!-- <hr color="lightgray"> -->
                        <!--
                        <table style="text-align: center">
                            <tr>
                                <td height="300" width="900" >주문내역이 없습니다.</td>
                            </tr>
                        </table>
                        -->

						<!--  
                        <table style="text-align: center">
                            <tr>
                                <td height="300" width="900" >등록된 클래스 정보가 존재하지 않습니다.</td>
                            </tr>
                        </table>
                        -->
						
						<c:if test="${ empty list }">
						<table style="text-align: center">
                            <tr>
                                <td height="300" width="900"  id="no-class">등록된 클래스 정보가 존재하지 않습니다.</td>
                            </tr>
                        </table>
						</c:if>
						
						<c:forEach var="c" items="${ list }">
                        <table>
                            <tr>
                                <td colspan="2"></td>
                                <td></td>
                                <td width="440" align="right"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td rowspan="5" width="150" height=""><img src="resources/images/onedayclass_main.jpg" width="100%"></td>
                                <th width="90">클래스명</th>
                                <td width="10"></td>
                                <td class="productName" width="80">
                                    ${c.className }
                                </td>
                            </tr>
                            <tr>
                                <th>수업일</th>
                                <td></td>
                               
                                <td>${c.classDate }</td>
                            </tr>
                            <tr>
                                <th>수업료</th>
                                <td></td>
                                <td>${c.price}원</td>
                            </tr>
                            <tr>
                                <th>진행여부</th>
                                <td></td>
                                <c:if test="${c.classStatus eq 'N'}">
                                <td>미진행</td>
                                </c:if>
                                <c:if test="${c.classStatus eq 'Y'}">
                                <td>완료</td>
                                </c:if>
                                <td colspan="3" style="text-align: right; padding-right: 10px;">
                                </td>
                            </tr>
                        </table>
                        </c:forEach>

                        <br><br>

                        <div class="mypage-to-class-wrap">
                            <button class="mypage-to-class" id="mypage-to-class">클래스 보러 가기</button>
                        </div>

                        <br><br>
                        

                    </div>
			
                </td>
            </tr>
    
        </table>
    
    </div>
    
    <br><br>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
    	$(function () {
    		$("#mypage-to-class").click(function() {
    			location.href="classDetail.cl";
    		});
    		
    		$("#category-onedayclass").css("font-weight", "700");
    		
    		/*
    		$(".smsBtn").click(function () {
    			
    			var result = confirm("예약 확인 문자를 받으시겠습니까?" + "\r" + "(단 한번만 발송 가능합니다.)"); 
    			if(result == true) {
    				
    				$(this).attr("disabled", true);
    				console.log($(this).next().val());
    				console.log($(this).next().next().val());
    			}
    			else {
    				
    			}
    			

    			$.ajax({
    				url:"sendOnedayClassMessage.do",
    				data : {
    					classDate : $(this).next().val(),
    					className : $(this).next().next().val(),
    					price : $(this).next().next().next().val()
    				},
    				success : function (result) {
    					console.log(result)	
    				},
    				error : function () {
    					
    				}
    				
    			});
				
    			
    		});
    		*/
    		
    		
    	});
    </script>
             
</body>
</html>
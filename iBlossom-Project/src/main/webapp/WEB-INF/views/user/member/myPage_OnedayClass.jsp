<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | 원데이클래스</title>
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

                        <table>
                            <tr>
                                <td colspan="2"></td>
                                <td></td>
                                <td width="490" align="right"></td>
                            </tr>
                            <tr>
                                <td rowspan="5" width="100" height="100"><img src=""></td>
                                <th width="80">클래스명</th>
                                <td width="10"></td>
                                <td class="productName" width="80">
                                    꽃으로 100억 벌기
                                </td>
                            </tr>
                            <tr>
                                <th>수업일</th>
                                <td></td>
                                <td>2022-02-08</td>
                            </tr>
                            <tr>
                                <th>수업료</th>
                                <td></td>
                                <td>14000원</td>
                                <td colspan="3" style="text-align: right; padding-right: 10px;"><button>결제내역</button></td>
                            </tr>
                            
                        </table>

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
    	});
    </script>
             
</body>
</html>
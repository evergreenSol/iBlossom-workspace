<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Membership</title>
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
                   		<h2>리뷰 내역</h2>
                    
                    	<div style="width: 100%">
                            <table align="center" style="text-align: center; font-size: 14px; width: 100%">
                                <thead style="background: rgb(248, 248, 248); border-style: none;">
                                    <tr height="40">
                                        <th width="150">리뷰 상품</th>
                                        <th width="500">제목</th>
                                        <th width="150">리뷰 날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr height="40">
                                        <td>장미꽃다발</td>
                                        <td>꽃이 너무 이뻐요</td>
                                        <td>2022-05-19</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
			
                </td>
            </tr>
    
        </table>
    
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
 

</body>
</html>
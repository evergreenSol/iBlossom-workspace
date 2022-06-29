<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iBlossom | Time To Blossom</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js" type="application/javascript"></script>

</head>
<body>
	<jsp:include page="WEB-INF/views/common/header.jsp" />
	
	<button onclick="getBillingKey();">구독하기</button>
	<button onclick="cancelSubscribe();">구독취소</button>

	<jsp:include page="WEB-INF/views/common/bootpay.jsp" />
	
	<jsp:include page="WEB-INF/views/common/footer.jsp" />
</body>
</html>
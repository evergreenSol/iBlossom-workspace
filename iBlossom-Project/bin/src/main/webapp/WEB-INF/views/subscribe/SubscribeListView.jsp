<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SubscribeListView</title>
<style>
    div, span, table {
        border : solid black 1px;
    }

    /* tr { display: block; float: left; }
    th, td { display: block; } */
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
 	<!-- 사진 영역 -->
    <div class="banner">
        <span class="banner_title">정기구독</span>
    </div>
    
    <div class="wrap">
        <div class="info">
            <table>
                <tr>
                    <td height="150px" width="20%">이미지1</td>
                    <td width="20/3%"></td>
                    <td width="20%">이미지 2</td>
                    <td width="20/3%"></td>
                    <td width="20%">이미지 3</td>
                    <td width="20/3%"></td>
                    <td width="20%">이미지 4</td>
                </tr>
                <tr> <!-- 글씨체 변경 -->
                    <td>STEP1. 구독할 꽃다발을 선택해주세요</td>
                    <td></td>
                    <td>STEP2. 구독기간을 선택해주세요</td>
                    <td></td>
                    <td>STEP3. 첫 결제를 완료하고 구독을 등록해주세요</td>
                    <td></td>
                    <td>STEP4. 고르신 꽃다발을 받아보세요!</td>
                </tr>
            </table>
        </div>

        <div class="subscription">
            <br>
            <h1>정기구독</h1>

            <h3>STEP1. 구독할 꽃다발을 선택해주세요</h3>
            
            <!-- 구독 상품 전체 리스트 조회-->
            <!-- tr 마다 따로 c:forEach 로 -->
            <table class="sub_list"> 
                <!-- <c:forEach var="s" items="${ list }">--> <!-- SUB_PRODUCT 테이블로부터 읽어오기-->   
                <tr>
                    <td height="300px" width="250px" id="subproduct_img">정기구독 상품 리스트에서 썸네일<!--<img src="${ s.subChangeName }"--></td>
                    <td id="subproduct_name">정기구독 삼품 리스트에서 제목<!-- ${ s.subProductName }--></td>
                    <td height="25px"></td>
                </tr>
                <!-- </c:forEach>-->
            </table>
            <br><br>
            <!-- hidden 으로 숨겼다가 정기구독 상품 리스트 클릭시 hidden 제거 (ajax 사용)-->
            <!-- SUBSCRIBE 테이블로 보내주기 (ajax)-->

            <h3>STEP2. 구독기간을 선택해주세요</h3>
            
            <div class="sub_period">
                <img id="thumbnail" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/660px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg"></img>
                <div id="sub_period">
                    <table>
                        <tr>
                            <td colspan="2">첫 수령일을 선택하세요</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="date" required></td>
                        </tr>
                        <tr>
                            <td colspan="2">구독기간을 선택해주세요</td>
                        </tr>
                        <tr> <!-- 같은 function에 매개변수만 다르게 해서 넘겨주면 편할듯?-->
                            <td><button onclick="">정기결제</button></td>
                            <td><button onclick="">6개월</button></td>
                        </tr>
                        <tr>
                            <td><button onclick="">3개월</button></td>
                            <td><button onclick="">12개월</button></td>
                        </tr>
                    </table>
                </div>
            </div>
            <br><br>
            <!-- hidden 으로 숨겼다가 정기구독 상품 수령일+구독일 선택시 hidden 제거 (ajax 사용)-->
            <!-- SUBSCRIBE 테이블로부터 읽어오기-->
            <h3>내가 고른 상품 정보</h3>
            <div class="subscription_product">
                <img id="thumbnail" src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/660px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg"><!--<img src="${ s.subFilePath }"--></img>
                <hr>
                <table class="product_info">
                    <tr>
                        <th>구독상품</th>
                        <th>첫 수령일</th>
                        <th>구독기간</th>
                        <th>구독 상품금액</th>
                        <th onclick=""><button>이전</button></th>
                    </tr>
                    <tr>
                        <td>구독상품<!--${ s.subProductNo }--></td>
                        <td>첫 수령일<!--${ s.deliverAt }--></td>
                        <td>구독기간<!--${ s.subLevel }개월--></td>
                        <td>구독 상품금액<!--${ s.subPrice * s.subLevel }--></td>
                        <td><button onclick="">결제</button></td>
                    </tr>
                </table>
            </div>   
            <br><br><br>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
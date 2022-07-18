 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/modal_mypage.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

    <table class="mypage-grade">
        <tr>
            <td class="grade-second" width="375">
                <div style="margin-left: 20px;">
                    <p id="p_second" style="margin:0;">회원등급</p>

                    <c:choose>
                   		<c:when test="${ loginUser.grLevel eq '1'}">
	                    	<span class="member-grade">일반</span>
	                    </c:when>
	                    <c:when test="${ loginUser.grLevel eq '2'}">
	                    	<span class="member-grade">SILVER</span>
	                    </c:when>
	                    <c:when test="${ loginUser.grLevel eq '3' }">
	                    	<span class="member-grade">GOLD</span>
	                    </c:when>
	                    <c:otherwise>
	                    	<span class="member-grade">DIAMOND</span>
	                    </c:otherwise>
                    </c:choose>
					
                    <a class="view-grade">혜택보기 >></a>
                </div>
            </td>
            <td class="grade-first">
                <p id="hello" style="margin-left: 10px">안녕하세요. ${ loginUser.userName }님</p>
            </td>
            
            <td class="grade-third">
                <div>
                    <p id="p_third" style="margin:0;">iBlossom과 함께한 일상</p>
                    <span class="member-period"></span>
                </div>
            </td>
            
            
        </tr>
    </table>
        <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <img src="resources/images/pc_layer_close.png" class="close-area"></img>
            
            <div class="title" style="text-align: center">
                등급현황 및 혜택
            </div>
            <br>
            <hr></hr>

            <!-- <div class="close-area">X</div> -->
            <div class="grade-content">
                <table align="center">
                    <tr>
                        <td id="icon-grade-silver">
                            <img src="resources/images/mb_ico_grade_status_silver.png">
                            <br>
                            <span>SILVER</span>
                        </td>
                        <td id="icon-grade-gold">
                            <img src="resources/images/mb_ico_grade_status_gold.png">
                            <br>
                            <span>GOLD</span>
                        </td>
                        <td id="icon-grade-diamond">
                            <img src="resources/images/mb_ico_grade_status_diamond.png">
                            <br>
                            <span>DIAMOND</span>
                        </td>
                    </tr>
                </table>

                <br><br>

                <div id="modal-purchase">
                    내 구입 금액: &nbsp;&nbsp;&nbsp;<span><fmt:formatNumber value="${ loginUser.purchase }" pattern="###,###"/> 원</span>
                </div>

                <br><br>

                <table align="center" id="grade-benefit">
                    <tr height="60">
                        <th width="40">회원등급</th>
                        <th width="100">일반</th>
                        <th width="100">SILVER</th>
                        <th width="100">GOLD</th>
                        <th width="100">DIAMOND</th>
                    </tr>
                    <tr height="60">
                        <td>등급조건</td>
                        <td>일반회원</td>
                        <td>
                            20만원 <br>
                            이상구매
                        </td>
                        <td>
                            30만원 <br>이상구매
                        </td>
                        <td>
                            40만원 <br>이상구매

                        </td>
                    </tr>
                    <tr> 
                        <td>혜택</td>
                        <td>없음</td>
                        <td>10% 할인</td>
                        <td>15% 할인</td>
                        <td>20% 할인</td>
                    </tr>
                    <tr height="10"></tr>
                    <tr>
                        <td colspan="5" style="text-align:left;">* 할인 혜택은 꽃 구매에 한함(구독상품 제외)</td>
                    </tr>

                </table>
            </div>


            <div class="modal-button-area" align="center">
                <!-- <button>확인</button> -->
            </div>
        </div>
    </div>

    
    <script>

	    const btnModal = document.querySelector('.view-grade');
	
	    function modalOn() {
	    modal.style.display = "flex"
	    }
	    
	    function isModalOn() {
	        return modal.style.display === "flex"
	    }
	    
	    function modalOff() {
	        modal.style.display = "none"
	    }
	    
	    btnModal.addEventListener("click", e => {
	        modal.style.display = "flex"
	    });
	
	    const closeBtn = modal.querySelector(".close-area")
	    closeBtn.addEventListener("click", e => {
	        modal.style.display = "none"
	    });
	    
	    
	    // 날짜 구하기
	    
	    var result;
	    
	    var now = new Date();
	    
	    var year = now.getFullYear();
	    var month = now.getMonth()+1;
	    var day = now.getDate();
	    
	    // console.log(now);
	    
	    var date = "${ loginUser.enrollDate }";
	    // var date = "2022-05-23";
	    // console.log(date);
	    
	    var dateArr = date.split("-");
	    
	    userYear = dateArr[0];
	    userMonth = dateArr[1];
	    userDay = dateArr[2];
		
	    /*
	    console.log(userYear);
	    console.log(dateArr[1]);
	    console.log(dateArr[2]);
		*/
	    
		// var startDate = new Date(2022, 07, 07);
	    var startDate = new Date(userYear, userMonth, userDay);
	    // var startDate = new Date(userYear, userMonth, userDay);
	    
	    // console.log(startDate);
	    
	    var endDate = new Date(year, month, day);
	    // console.log(endDate);
	    
	    var btMs = endDate.getTime() - startDate.getTime();
	    var btDay = btMs / (1000 * 60 * 60 * 24) + 1;
	    
	    if(btDay == 1) {
	    	result = "오늘이 첫 날입니다!";
	    	//console.log(result);
	    	
	    }
	    else {
	    	result = btDay + " 일";
		    //console.log("차이: " + result);
	    }
	    
	    $(".member-period").text(result);
	    
	    
    </script>
  
    
    
    

</body>
</html>
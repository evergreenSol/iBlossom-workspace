<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/modal_mypage.css" rel="stylesheet">
</head>
<body>

    <table class="mypage-grade">
        <tr>
            <td class="grade-first">
                <h1 style="margin-left: 15px">안녕하세요. 김한솔님</h1>
            </td>
            <td class="grade-second">
                <div style="margin-left: 100px;">
                    <h3 style="margin:0;">회원등급</h3>
                    <span class="member-grade">GOLD</span>&nbsp;&nbsp;<a class="view-grade">혜택보기 >></a>
                </div>
            </td>
            <td class="grade-third">
                <div>
                    <h3 style="margin:0;">iBlossom과 함께한 일상</h3>
                    <span class="member-period">100일</span>
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
                    내 구입 금액: &nbsp;&nbsp;&nbsp;<span>0 원</span>
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
                        <td>1000원 할인</td>
                        <td>2000원 할인</td>
                        <td>3000원 할인</td>
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
	    
    </script>
  
    
    
    

</body>
</html>
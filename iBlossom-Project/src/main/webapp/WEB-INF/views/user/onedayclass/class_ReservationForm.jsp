<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/kms.css" rel="stylesheet">
<style type="text/css">
/*수정 모달창*/
#modal.modal-overlay {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    display: none;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    /* background: rgba(255, 255, 255, 0.25); */
    background: rgba(0, 0, 0, 0.712);
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
    backdrop-filter: blur(1.5px);
    -webkit-backdrop-filter: blur(1.5px);
    /* backdrop-filter: blur(3.5px);
    -webkit-backdrop-filter: blur(3.5px); */
    border-radius: 10px;
    border: 1px solid rgba(255, 255, 255, 0.18);
    }
    #modal .modal-window {
    /* background: rgba( 69, 139, 197, 0.70 ); */
    position: absolute;
    top: 50%;
    left: 50%;

    width: 220px;
    height: 340px;

    padding: 40px;

    text-align: center;

    background-color: rgb(255, 255, 255);
    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

    transform: translateX(-50%) translateY(-50%);

    text-align: left; 

    }
    #modal .title {
    padding-left: 10px;
    display: inline;
    /* text-shadow: 1px 1px 2px gray; */
    color: black;

    }
    #modal .title h2 {
    display: inline;
    }
    #modal .close-area {
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
    /* text-shadow: 1px 1px 2px gray; */
    color: black;
    }

    #modal .content {
    margin-top: 20px;
    padding: 0px 10px;
    /* text-shadow: 1px 1px 2px gray; */
    color: black;
    }

    #info{
    font-size: 15px;
    color: gray;
    padding-top: 25px;
    }

    #name, #phone, #email {
    font-size: 15px;
    padding-top: 8px;
    width: 150px;
    cursor: pointer;
    border: 0;
    }

    #class-update-cancel, #class-update-confirm{
    width:100px;
    height:50px;
    margin-top: 60px;
    background-color: white;
    border: none;
    cursor: pointer;
    font-weight: 600;
    }

    #class-update-confirm:hover{
    color: #ff2393;
    }
</style>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
   <div id="class-container-wrap">

    <div id='pay-full' align='center'>
        <div id='pay-left'>
            <h2 id="payTitle">결제하기</h2>
            <div class='pay-info1'>
                <div id="pay-content1">주문 상품 정보</div>
                <div id="pay-image"><img src="resources/images/onedayclass_main.jpg" width="120px" style="float:left;"></div>
                <div id="pay-content1_1">원데이클래스</div>
                <!-- 
                 <div id="pay-content1_2" name="">2022-07-22 14:00</div>
                 -->
                <div id="pay-content1_2" name="">${ date }</div>
                <div id="pay-content1_3">60,000원</div>
            </div>
            <div class='pay-info2'>
                <div id="pay-content2">주문자 정보</div>
                <div id="pay-content2_1" name="user_name">홍길동</div>
                <button type="submit" id="class-update-btn" class="class-update-btn" >수정</button>
                <div id="pay-content2_2" name="phone">010-1111-2222</div>
                <div id="pay-content2_3" name="email">asdf@naver.com</div>                
            </div>            
        </div>
        
        <div id='pay-right'>
            <div class='pay'>
                <div id="pay-content3">결제수단</div>
                <div id="pay-content3_1"><input type="radio" style="width:15px;height:15px;border:1px;" checked> 부트페이</div>
                <div id="pay-content3_2"><input type="checkbox" checked>구매조건 확인 및 결제 진행에 동의</div>
            </div>
            
            <button type="submit" id="pay-btn" class="">결제하기</button>
        </div>
    </div>
</div>
        <!-- 수정 모달창 -->
        <div id="modal" class="modal-overlay">
            <div class="modal-window">
                <div class="title">
                </div>
                <div class="close-area">X</div>
                <div class="content">
                    <div id="info">이름</div>
                    <input type="text" id="name" name="" value="홍길동" maxlength="8">
                <div id="info">연락처</div>
                    <input type="text" id="phone" name="" value="010-1111-2222" maxlength="13">
                <div id="info">이메일</div>
                    <input type="text" id="email" name="" value="asdf@naver.com" maxlength="25">
                    
                </div>
                <div class="modal-button-area" align="center">
    
                    <button type="reset" id="class-update-cancel" style="float:left" data-dismiss="modal">취소</button>
                    <button type="submit" id="class-update-confirm">확인</button>
                </div>
            </div>
        </div>
        
    
        <script>
    
            const btnModal = document.querySelector('.class-update-btn');
      
            fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
                .then(response => response.text())
                .then(result => loremIpsum.innerHTML = result)
    
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
            })
    
            const closeBtn = modal.querySelector(".close-area")
            closeBtn.addEventListener("click", e => {
                modal.style.display = "none"
            })
        </script>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
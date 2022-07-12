<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
 <link href="resources/css/jsa.css" rel="stylesheet">
<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/> -->
</head>
<body>

<jsp:include page="../../common/header.jsp" />

    <br><br><br>


	<div id="wrap_detail1">
		<div style="width: 1000px; margin: auto;">
			<form name="form" method="get" id="form" action="insertCo.ca">
				<input type="hidden" name="productNo" value="${ p.productNo }">
				<table>
					<tr class="tr1" valign="top">
						<td rowspan="6"><img src="resources/images/flower3.PNG">

						<select id="test5">

								<option value='' selected disabled style="text-align: center;">
									---------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									---------</option>
								<c:forEach var="i" begin="0" end="${list.size()}">
									<option value="${list[i].flowerName }">${list[i].flowerName }${list[i].productNo}</option>
								</c:forEach>
						</select></td>
						<td class="pp" style="padding-top: 20px;"><b
							style="font-size: 25px;">조합형</b></td>
					</tr>

					<%-- <c:forEach var="i" begin="0" end="${list.size() -1}">
						<input type="text" name="cartList[${i}].productNo" value="${list[i].productNo }"> 
						<input type="text" name="cartList[${i}].productCount" id="cartList${i}" class="productCount" value="1"> 
						<input type="text" name="cartList[${i}].productPrice" value="${list[i].price }"> 
						<input type="text" name="" value="${list[i].flowerName }"> 
					</c:forEach> --%>
					<tr>
						<td class="pp">
							<hr>
					</tr>
					<tr>
						<td class="pp"><b>내가 직접 고르고 선물해보세요~ </b><br> 감동이 2배 <br>
							<hr style="margin-bottom: 10px;"></td>
					</tr>
					<tr>
						<td class="pp">

    <div id="wrap_detail1">
        <div style="width: 1000px;margin: auto;">
            <table>
            
                <tr valign="top">
                    <td rowspan="6"><img src="resources/images/flower3.PNG">
                   
                        <select id="test5">
                        
                            <option value='' selected disabled style="text-align: center;">
                                ---------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ---------
                            </option>
                        <c:forEach var="v" items ="${list}">
                            <option value="${v.flowerName }">${v.flowerName }</option>
                              </c:forEach>
                        </select>
                      
                    </td>
                    <td class="pp" style="padding-top: 20px;"><b style="font-size:25px;">조합형</b></td>
                </tr>
            
                <tr>
                    <td class="pp">
                        <hr>

                </tr>
                <tr>
                    <td class="pp">
                        <b>내가 직접 고르고 선물해보세요~ </b><br>
                        감동이 2배
                        <br>
                        <hr style="margin-bottom:10px;">
                    </td>
                </tr>
                <tr>
                    <!-- <td class="pp">


                        <p>수령일 : <input type="text" class="datepicker" id="datepicker"></p>


        </div>
        <!-- </td> -->
        </tr>
        <tr>
            <td>
                <div id="countBox1">

                    <form name="form" method="get">
                       
                </div>
                <br>
                <div style="margin-left: 20px">
                배송비:
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                3,000 원<br><br>
                총 주문금액 :
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              
                
                 <input type="text"
                    style="border:none; font-weight:700; font-size:15px; background-color: rgba(224, 224, 224, 0.001); padding-left: 60px; width: 50px;"
                    name="sum" size="11" id="sum" readonly value="0">&nbsp;&nbsp;원
                </div>
                </form>
            </td>
        </tr>

        <tr>
        
            <td>
            <br><br>
                <input type="submit" value="장바구니" id="btn1">

            </td>


<!-- 						<td><br>
						<br> 
						 함수 태워서 인풋 히든값에 넣기
						<button onclick="sub()" value="장바구니" id="btn1"></button>
						</td>
 -->
        </tr>
      
        </table>
<!-- 

        <select name="job">
            <option value="">조합할 꽃을 선택하세요</option>
            <option value="rose">장미</option>
            <option value="sunflower">해바라기</option>
            <option value="hydrangea"> 수국</option>
        </select>

        상세 정보 버튼 시작
        <div class="categorize review-box" style="height: 100px; margin-top: 30px;">
            <div class="reviewBox" id="combination_content" onclick="getList();">상세정보</div>
            <div class="reviewBox" id="combination_review" onclick="test4();">리뷰</div>
        </div>

        상세정보 폼

        <div id="cobinationContent">
            <div id="combinationPhoto" style="overflow : hidden;">
                <br><br><br>
            </div> -->


		<!-- 리뷰 작성폼-->

	</div>

	<c:forEach var="e" items="${list}">
		<input type="hidden" value="${e.price }" id="${e.flowerName }">
	</c:forEach>
<input type="text" id="test">

   <!--      </div> -->




    </div>

    <!-- 리뷰 작성폼-->

    </div>

	<c:forEach var="e" items ="${list}">
     <input type="hidden" value="${e.price }"  id="${e.flowerName }">
     </c:forEach>


    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
        integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- 수량 올릴 시 가격 변동-->
 
    <script>
        var height = 0;
        var sell_price;
        var amount;
        var shtml;
        var sumAll = 0;

       /*  var num = 0;
        var length = "${fn:length(list)}"; */
        
/* 
        $(document).ready(function () {
            //test3();
            getList();
           
        });

        $('#test5').change(function () {
            var name = this.value;
        	var price = $("#"+name).val();
       
            height = height + 80;
            shtml = '<div id="countWrite1">'
            shtml += '<div onclick="removeItem(\'' + name + '\')" id="removeItem"><img src="resources/images/x.png" style="width: 15px; float:right"></div>'
            shtml += '<input type="text" id="name_' + name + '" value="' + name + '"  style="border: none; padding-left: 10px; padding-top: 5px;"><br><br>';

            shtml += '<input type= "hidden" id="sell_price_' + name + '"value="'+price+'">'
            
    

            shtml += '<input type=hidden id="sell_price_' + name + '"value="'+price+'">'

            shtml += '<input type="button" value=" - " onclick="del(\'' + name + '\')"style="margin-left: 10px;">'
            shtml += '<input type="hidden" id="'+num+'"  name="'+num+'">'
            shtml += '<input type="text" id="amount_' + name + '"value="1" size="1" >'

            shtml += '<input type="button" value=" + " onclick="add(\'' + name +'\')"><br><br><br></div>'
            

            shtml += '<input type="button" value=" + " onclick="add(\'' + name + '\')"><br><br><br></div>'

            if (height > 480) {
                $('#countBox1').height(height);
            }
            if ($("#countBox1").find("#amount_" + name).length != 0) {
                alert("이미 선택된 꽃입니다.");
                return;
            }
			
            $("#countBox1").append(shtml);
            sumAll = sumAll + parseInt($("#sell_price_" + name).val());
            $("#sum").val(sumAll);

        });

		function sub(){
			
			for (var i=0; i<length; i++){
				var y=$("#"+i).next().val();
				$("#"+i).val(y);
				console.log(y);
			}
			$("#form").submit();
		}
        function add(name) {
            console.log(name);
            sell_price = $('#sell_price_' + name).val();
            // console.log(sell_price)
            hm = $('#amount_' + name).val();
            // console.log(hm)
            sum = $("#sum").val();
            // console.log(sum)
            $('#amount_' + name).val(parseInt(hm) + 1);
            sumAll = sumAll + parseInt(sell_price);
            $('#sum').val(sumAll);

        }

        function del(name) {
            $('#sell_price_' + name).val()
            sell_price = $('#sell_price_' + name).val();
            console.log(sell_price)
            hm = $('#amount_' + name).val();
            console.log(hm)
            sum = $('#sum').val();
            console.log(sum)
            if (hm > 1) {
                $('#amount_' + name).val(hm - 1);
                sumAll = sumAll - parseInt(sell_price);
                $('#sum').val(sumAll);
            }
        }

        function removeItem(name){
            var delValue = $("#sell_price_"+name).val();
            var ea = $("#amount_"+name).val();
            sumAll = sumAll - (parseInt(delValue)*parseInt(ea));
            
            $("#sum").val(sumAll);
            $("#name_"+name).parent().remove();
        
        } */


        // function change() {
        //     hm = $('#amount_' + name).val();
        //     sum = document.form.sum;


        //     if (hm < 0) {
        //         HTMLDListElement = 0;
        //     }

        //     sum.value = parseInt(hm.value) * sell_price + 3000;
        // }



    </script>




   <script>
   
	   function getList(){
		   var combinationContent;
		   $('#combination_content').css("background-color", "rgba(224, 224, 224, 0.29)");
           $('#combination_content').css("color", "black");
           $('#combination_review').css("background-color", "white");
           $('#combination_review').css("color", "rgb(190, 190, 190)");
           
		   $.ajax({
		       type : "POST",            // HTTP method type(GET, POST) 형식이다.
		       url : "combinationDetailList",      // 컨트롤러에서 대기중인 URL 주소이다.
		       success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		           // 응답코드 > 0000
		           $('#combinationPhoto').children().remove();
		            combinationContent = '<table>';
		           for(var i = 0; i < res.length; i++) {
		               combinationContent += '<tr>';
		               combinationContent += '<td>';
		               combinationContent += '<img src="'+res[i].thumbNail+'" class="combination_img">';
		               combinationContent += '</td>';
		               combinationContent += '<tr>';
		               combinationContent += '<td>';
		               combinationContent += '<p>';
		               combinationContent += res[i].flowerName;
		               combinationContent += '</p>';
		               combinationContent += '</td>';
		               combinationContent += '</tr>';
		           }
		           combinationContent += '</table>';
		           $('#combinationPhoto').append(combinationContent);
		           
		       },
		       error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		           alert("통신 실패.")
		       }
		   });
	
	   }
   
   
   
        	function test3() {

            $('#combination_content').css("background-color", "rgba(224, 224, 224, 0.29)");
            $('#combination_content').css("color", "black");
            $('#combination_review').css("background-color", "white");
            $('#combination_review').css("color", "rgb(190, 190, 190)");
            var combinationContent;
            $('#combinationPhoto').children().remove();
			var data={};
			var listArr = [];
			<c:forEach var="p" items="${list}" varStatus="status">
				listArr[<c:out value='${status.index}'/>] = "<c:out value='${p}'/>";
				
				console.log("<c:out value='${p}'/>");
			</c:forEach>
			
			
			console.log(listArr[0]);
			console.log(listArr[0].thumbNail);
			
            for(var i=0; i < listArr.length; i++){
            	
            	console.log(listArr[i].thumbnail);
            	console.log(i);
            }
            
            combinationContent = '<table>';
            combinationContent += '<tr>';
            combinationContent += '<td>';
            combinationContent += '<img src="'+'${v.thumbNail}'+'" class="combination_img">';
            combinationContent += '</td>';
            combinationContent += '<tr>';
            combinationContent += '<td>';
            combinationContent += '<p>';
            combinationContent += '수국';
            combinationContent += '</p>';
            combinationContent += '</td>';
            combinationContent += '</tr>';
            combinationContent += '</table>';

            $('#combinationPhoto').append(combinationContent);
        }
    </script>
 
    <script>
        function test4() {
            $('#combination_review').css("background-color", "rgba(224, 224, 224, 0.29)");
            $('#combination_review').css("color", "black");
            $('#combination_content').css("background-color", "white");
            $('#combination_content').css("color", "rgb(190, 190, 190)");
            var combinationreview;
            $('#combinationPhoto').children().remove();

            combinationreview = '<input type="button" id="btn_rv" value="구매평 작성" onclick="modalOn();">';
            combinationreview += ' <br><br>';
            combinationreview += ' <hr>';
            combinationreview += '<div class="reviewbb">';
            combinationreview += '<img class="img2" src="resources/images/flower1.jpg">';
            combinationreview += '<text class="text1">진짜 마음에 들어요</text>';
            combinationreview += '<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
            combinationreview += '</div>';
            combinationreview += '<div class="reviewbb">';
            combinationreview += '<img class="img2" src="resources/images/flower1.jpg">';
            combinationreview += '<text class="text1">진짜 마음에 들어요</text>';
            combinationreview += '<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
            combinationreview += '</div>';
            combinationreview += '<div class="reviewbb">';
            combinationreview += '<img class="img2" src="resources/images/flower1.jpg">';
            combinationreview += '<text class="text1">진짜 마음에 들어요</text>';
            combinationreview += '<span class="span1">우와 이쁘다 진짜 제 마음에 속 들어요</span>';
            combinationreview += '</div>';
            combinationreview += '<br><br><br><br><br>';


            $('#combinationPhoto').append(combinationreview);
        }
    </script>



    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <span style="font-size: 20px; margin-top:10px;">구매평 작성</span>
            </div>
            <div class="close-area" onclick="modalOff()"><img src="resources/images/x.png" style="width: 15px;"></div>

            <div class="content">
                <hr>

                <div style="height: 50px; border: 1px solid gainsboro; margin-top:40px; text-align: center;">
                    <p>버닝, 푸에고</p>
                </div>
                <br>
                <textarea rows="2" cols="10" onkeyup="counter(this,100)" name="contents"
                    placeholder="꽃 파손이나 배송등 문제사항은 구매평에 남겨주시면 확인이 어렵습니다."></textarea>
                <div style="text-align:right;">
                    <span id="reCount">0 / 100</span>
                </div>

                <br><br><br>
                <input type="file">

            </div>

            <script>
                function counter(text, length) {
                    var limit = length;
                    var str = text.value.length;
                    if (str > limit) {
                        alert("최대 100자까지 입력 가능합니다.");
                        text.value = text.value.substring(0, limit);
                        text.focus();
                    }
                    document.getElementById("reCount").innerHTML = text.value.length + " / " + limit;
                }
            </script>


            <div class="modal-button-area" align="center">

                <!--<button onclick="modalOff()">취소</button>-->
                <button id="sign">등록</button>
            </div>
        </div>
    </div>


    <script>

        const loremIpsum = document.querySelector('.modal');
        const btnModal = document.querySelector('.view-grade');

        /* fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
             .then(response => response.text())
             .then(result => loremIpsum.innerHTML = result)
 */
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

        const closeBtn = modal.querySelector(".close-area");
        closeBtn.addEventListener("click", e => {
            modal.style.display = "none"
        });
    </script>
    
    <jsp:include page="../../common/footer.jsp" />
</body>

</html>
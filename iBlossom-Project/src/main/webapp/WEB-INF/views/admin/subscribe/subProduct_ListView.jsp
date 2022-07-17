<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin | 구독 상품</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="resources/css/kdh.css" rel="stylesheet">
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
<link rel="icon" href="resources/images/iBlossom-con4.ico" type="image/x-icon">
</head>
<body>

    <!-- admin 어드민 관리자 메뉴 wrap -->
    <div id="admin-menu-wrap">

        <!-- 메뉴 첫번째줄 div -->
        <div id="admin-menu-1">

            <!-- 로고 -->
            <div id="admin-logo-div">
                <a href="" id="admin-logo-a">
                    <img src="resources/images/iBlossom_logo_black.png">
                 </a>
             </div>

            <!-- 로그인 div -->
            <div id="admin-login-div">

                <span id="admin-login-text">admin</span>

                <!-- 로그인 아이콘  -->
                <a href="" id="admin-login-a">
                    <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-person-fill" viewBox="0 0 16 16">
                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                    </svg>
                </a>

            </div>

        </div>

        <!-- 메뉴 두번째줄 div -->
        <div id="admin-menu-2">

            <!-- 메뉴 div -->
            <div id="admin-navi-div">

                <!-- 메뉴 -->
                <ul id="admin-navi">
                    <li><a href="" class="admin-navi-menu">회원관리</a></li>
                    <li>
                        <a href="" class="admin-navi-menu">주문정보관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="">전체주문내역</a></li>
                            <li><a href="">개별주문내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="" class="admin-navi-menu" style="font-weight: 700;">정기구독관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="subMemberListView.su">구독회원관리</a></li>
                            <li><a href="listView.sp">구독상품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="" class="admin-navi-menu">상품관리</a></li>
                    <li><a href="" class="admin-navi-menu">리뷰관리</a></li>
                    <li><a href="" class="admin-navi-menu">클래스관리</a></li>
                    <li>
                        <a href="" class="admin-navi-menu">고객센터관리</a>
                        <ul class="admin-navi-ul">
                            <li><a href="">1:1 문의</a></li>
                            <li><a href="">FAQ</a></li>
                        </ul>
                    </li>
                    <li><a href="https://dashboard.tawk.to/#/monitoring" target="_blank" class="admin-navi-menu" id="admin-navi-chat">채팅관리</a></li>
                </ul>

            </div>

        </div>

    </div>

    <!-- admin 관리자페이지 회원관리 -->
    <div id="admin-member-wrap">

        <span id="admin-member-title">회원관리</span>
        <hr id="admin-member-hr">

        <!-- 여기서부터는, 훈련생 여러분들 각자 작업 하면 된다 실시 -->
        <div class="wrap">
           <c:choose> 
              <c:when test="${ empty list }">
                 <h4>아직 진열된 상품이 없습니다.</h4>
              </c:when>
              <c:otherwise> <!-- 진열된 상품 -->
                 <c:forEach var="sp" items="${ list }"> <!-- SUB_PRODUCT 테이블로부터 읽어오기 -->   
                    <div class="admin_sub_product"> 
                         <h3>상품명</h3>
                         <input type="text" class="admin_subproduct_name" value="${ sp.subProductName }">
                         <h3>썸네일</h3>
                         <input id="admin_fileUpdate" type="file" name="subfile" hidden>
                          <table class="admin_product">
                              <tr>
                                  <td width="40%" height="300px" id="updateImg">
                                        <img id="admin_subproduct_img" src="${ sp.subChangeName }">
                                  </td>
                                  <td width="60%">
                                       <textarea class="admin_subproduct_description">${ sp.subProductDescription }</textarea>
                                  </td>
                              </tr>
                          </table>
                         <h3>가격</h3>
                         <input type="text" class="admin_price" value="${ sp.subPrice }"><span>원</span>
                       <br>
                       <br>     
           			   <button id="deleteSubProduct" onclick="postFormSubmit(${ sp.subProductNo }, 1);">삭제</button>
           			   <button id="updateSubProduct" onclick="postFormSubmit(${ sp.subProductNo }, 2, this);">수정</button>
                    </div>
                 </c:forEach>
              </c:otherwise>
           </c:choose>
           <br>
           <hr>
           <br>
           <!-- 상품 추가용 -->
           <div class="new_subproduct" hidden>
              <form method="post" action="insert.sp" enctype="multipart/form-data">
                <h3>상품명</h3>
                   <input type="text" class="admin_subproduct_name" name="subProductName">
                   <h3>썸네일</h3>
                   <input id="admin_fileUpload" type="file" name="subfile" hidden>
                    <table class="admin_product">
                        <tr>
                            <td width="40%" height="300px" id="insertImg">
                                  <div id="insertCaption">여기를 클릭해 사진파일을 첨부해주세요</div>
                                  <img id="admin_preview_img">
                            </td>
                            <td width="60%">
                                 <textarea class="admin_subproduct_description" name="subProductDescription"></textarea>
                            </td>
                        </tr>
                    </table>
                   <h3>가격</h3>
                   <input type="text" class="admin_price" name="subPrice" required><span>원</span>
              <br>
              <br>
              <button id="insertSubProduct" type="submit">추가</button>
              <button id="reload" onclick="location.reload();">이전</button>
              </form>      
           </div>
           <button id="showHidden" onclick="showHidden();">추가</button>
        </div>
        

    </div>
    
    <script>
    // 상품 추가 버튼 클릭 시
      function showHidden() {
         $('.new_subproduct').removeAttr("hidden")
         $('#showHidden').attr("hidden","true")
         $('#deleteSubProduct').attr("hidden","true")
      }

      // 상품 삭제 또는 수정 버튼 클릭 시
      function postFormSubmit(spno, num, value) {
    	
    	var spName = $(value).siblings(".admin_subproduct_name").val();
    	var spDes = $(value).siblings(".admin_product").find(".admin_subproduct_description").val();
    	var price = $(value).siblings(".admin_price").val()
    	
    	// num 값에 따라 수정으로 보내주던가 삭제로 보내주던가
    	if(num == 1) {
  			var url = "delete.sp"
  		}
  		else {
  			var url = "update.sp"
  		}
    	  $.ajax({
    		url : url,
    		type : "post",
    		data : { 
    			subProductNo : spno,
    			subProductName : spName,
    			subProductDescription : spDes,
    			subPrice : price
    		},
    		success : function(result) {
    			if(num == 1) {
    	  			alert("상품 삭제에 성공 했습니다.");
    	  			location.href="listView.sp"
    	  		}
    			else if(num == 2) {
    	  			alert("상품 정보 수정에 성공 했습니다.");
    	  			location.href="listView.sp" 
    	  		}
    	  		else {
    	  			alert("상품에 반영되지 않았습니다");
    	  			location.href="listView.sp"
    	  		}
    		},
    		error : function() {
    			console.log("ajax 통신 실패");
    		}
    	})   
      }
		
      // 상품 추가시 사진 넣을 때 영역 클릭으로 사진 추가
      $('#insertImg').click(function() {
    	  $('#insertCaption').css("display","none");
          $('#admin_fileUpload').click()
       }); 
      
  	  // 영역에 사진이 새로 추가될 때 마다 readURL 호출
      $(function() {
          $("#admin_fileUpload").on('change', function(){
              readURL(this);
          });
      });
      
  	  // 추가된 사진 경로 불러오기용 메소드
      function readURL(input) {
          if (input.files && input.files[0]) {
             var reader = new FileReader();
             reader.onload = function (e) {
                $('#admin_preview_img').attr('src', e.target.result);
             }
             reader.readAsDataURL(input.files[0]);
          }
      }
      
      // 가격 input 입력제한
      var regExp = /[^0-9]/gi;
      
      $(document).ready(function(){
          
          $("#admin_price").on("focusout", function() {
              var x = $(this).val();
              if (x.length > 0) {
                  if (x.match(regExp)) {
                     x = x.replace(regExp, "");
                  }
                  $(this).val(x);
              }
          }).on("keyup", function() {
              $(this).val($(this).val().replace(regExp, ""));
          });
   
      });
      
   </script>
</body>
</html>
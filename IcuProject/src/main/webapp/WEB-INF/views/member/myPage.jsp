<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 마이페이지</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/myPage.css" />

</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../member/myNavbar.jsp"/>
    <br><br>
	<!-- Logo -->
    <div id="main__logo">
      <img src="resources/images/navbarLogo.png" />
    </div>

    <div id="whole">
      <div id="imgAndInfo">
        <div id="viewAndEnroll">
          <div id="view" class="titleImg">
          <!-- 올린 파일이 들어가는 자리 -->
          <c:choose>
          
          <c:when test="${!empty profile}">
          	<img class='viewImg' src="${contextPath }${profile.filePath }${profile.changeName}">
          </c:when>

          </c:choose>
          </div>
            <form id="enrollForm" action="${contextPath }/insertImg.me" encType="multipart/form-data" method="post">
          <div id="enroll">
          	<c:if test='${empty profile }'>
              <img id="preview" /> <Br>
             </c:if>
            <label class="input-file-button" for="upfile">
			  업로드
			</label>
              <input type="file" id="upfile" class="form-control" name="upfile" onchange="readURL(this);" style="display:none"/>
              <input type="hidden" name="originName" value="${image.originName }"/>
			        <input type="hidden" name="changefile" value="${image.changeName }"/>
              <div class='deleteBtn'>
                <c:if test="${empty profile}">
                    <button id="enrollBtn" type="submit" class="btn btn-primary" disabled>등록하기</button>
                </c:if>
                <c:if test="${!empty profile}">
                  <input type="hidden" id="mode" name="mode" value=""/>                   
                  <input type="hidden" name="profile" value="${profile }"/>  
                  <button id="enrollBtn" type="submit" class="btn btn-primary" disabled onclick="modeUpdate();">수정하기</button>
	              <button id="deleteBtn" type="submit" class="btn btn-danger" onclick="modeDelete();">삭제하기</button>
                </c:if>
              </div>
          </div>
            </form>
        </div>
        <div id="info">
          <h4><span class="info">${loginUser.memNickname}</span></h4><br>
          <span class="info">아이디 : </span><span class="info">${loginUser.memId}</span><br><br>
          <span class="info">이름   : </span><span class="info">${loginUser.memName}</span><br><br>
          <span class="info">연락처 : </span><span class="info">${loginUser.phone}</span><br><br>
          <span class="info">이메일 : </span><span class="info">${loginUser.email}</span><br><br>
          <span class="info">가입일 : </span><span class="info">${loginUser.enrollDate}</span><br><br>
        </div>
		<br>
      </div>
        <div id="updateButton">
          <a class="btn" href="${contextPath}/memUpdateForm.me">수정하러 가기</a>
        </div>
      
    </div>
    
    <!-- 실시간 문의 -->
    <jsp:include page="../common/chatForm.jsp"/>
    
    <script>
    function readURL(input) {
    	  if (input.files && input.files[0]) {
    	    var reader = new FileReader();
    	    /* var fileInput = document.getElementById("upfile"); */
    	    reader.onload = function(e) {
    	    
	    	      document.getElementById('preview').src = e.target.result;
	    	      $("#enrollBtn").attr("disabled",false);		
    	    	
    	      
    	    };
    	    reader.readAsDataURL(input.files[0]);
    	  } else {
    	    document.getElementById('preview').src = "";
    	  }
    	}
    
    
    	function modeUpdate(){
			$('#mode').val('update');
    	}
    	
    	function modeDelete(){
			$('#mode').val('delete');
    	}
    	
        function validate() {
          var fileInput = document.getElementById("upfile");
          if (fileInput.val != "" ) {
            $("#enrollBtn").attr("disabled",false);
          }
        };

        function refreshProfile(){
          location.reload();
        }

        function deleteBtn(){
          console.log("${profile.fileNo}");
          $.ajax({
              url : "${contextPath}/deleteImg.me",
              data : {
                  fileNo : "${profile.fileNo}"
              },
              type : "post",
              success : function(result){
                if(result == "1"){
                  
                  return "redirect:myPage.me";
                  
                  
                } else{
                  Swal.fire({
                    icon: 'error',
                    title: '프로필 삭제 실패.'
                  });
                }
              }
              
            });
            refreshProfile();

        }
    </script>
</body>
</html>
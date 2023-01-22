<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/myPage.css" />

</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
	<!-- Logo -->
    <div id="main__logo">
      <img src="resources/images/navbarLogo.png" />
    </div>

    <div id="whole">
      <div id="imgAndInfo">
        <div id="viewAndEnroll">
          <div id="view" class="titleImg">
          <!-- 올린 파일이 들어가는 자리 -->
          <img class='view-img' src="${contextPath }${image.changeName}">
          </div>
          <div id="enroll">
            <form id="enrollForm" action="${contextPath }/insertImg.me" encType="multipart/form-data" method="post">
              <input type="file" id="upfile" class="form-control" name="upfile"/>
              <input type="hidden" name="originName" value="${image.originName }"/>
			  <input type="hidden" name="changeName" value="${image.changeName }"/>
              <div align="center">   
					<button type="submit" class="btn btn-primary">등록하기</button>
			  </div>
            </form>
          </div>
        </div>
        <div id="info">
          <h4><input type="text" name="memNickname" value="${loginUser.memNickname}" readonly/></h4><br>
          아이디 : <input type="text" name="memId" value="${loginUser.memId}" readonly><br><br>
          이름   : <input type="text" name="memName" value="${loginUser.memName}" readonly><br><br>
          연락처 : <input type="text" name="phone" value="${loginUser.phone}" readonly><br><br>
          이메일 : <input type="text" name="email" value="${loginUser.email}" readonly><br><br>
          가입일 : <input type="text" name="enrolldate" value="${loginUser.enrollDate}" readonly><br><br>
        </div>
        <br>
      </div>
      <div id="updateButton">
        <a class="btn" href="${contextPath}/memUpdateForm.me">정보 수정</a>
      </div>
      
    </div>

</body>
</html>
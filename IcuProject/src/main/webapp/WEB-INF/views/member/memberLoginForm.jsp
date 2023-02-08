<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 로그인</title>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/03_logIn.css" />

</head>
<body>
    <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

    <!-- Logo -->
    <div id="main__logo">
      <img src="resources/images/navbarLogo.png" />
    </div>

    <!-- id / pwd input -->
    <!-- 회원가입 / 아이디, 비밀번호 찾기 -->
   <form id="memberLogin" action="${contextPath }/login.me" method="post">
    <div id="input__container">
      <div class="input__id">
        <i class="fa-regular fa-user"></i>
        <input
          class="info-id info"
          type="text"
          placeholder="아이디"
          id="memId"
          name="memId"
          
        />
      </div>
      
      <div class="input__pwd">
        <i class="fa-solid fa-lock"></i>
        <input
          class="info-pwd info"
          type="password"
          placeholder="비밀번호"
           id="memPwd"
          name="memPwd"
        />
      </div>
      
    </div>

    <!-- login , naver , kakao -->
    <div id="loginButton">
      <div class="login__button loginbtn">
        <button type="submit">로그인</button>
      </div>
    </div>
    
    <div class="join-container">
        <a href="${contextPath }/agreeForm.me">회원가입 &nbsp;|&nbsp; </a>
        <a href="${contextPath }/find.me">아이디 / 비밀번호 찾기</a>
      </div>
	</form>
	<br>
	<!-- 네이버 로그인  -->
    <div id="naver_id_login" style="text-align:center">
      <a id="naverlogin" href="${url}">
	  <img src="resources/images/naverLogo.png" /><span>네이버 로그인</span>
  	  </a>
    </div>
	  
    <!-- 카카오 로그인 -->
    <div class="kakao__button loginbtn" style="text-align:center">
	 <button type ="button" class = "btn" onclick="location.href='${urlKakao}'">
	 	<img class='kakaoImg' src="resources/images/kakao_login_large_wide.png">
	 </button>
    </div>

    <!-- 구글 로그인 -->
    <div class="google__button loginbtn" style="text-align:center">
	 <button type ="button" class = "btn" onclick="location.href='${urlGoogle}'">
	 	<img class='googleImg' src="resources/images/google_logo.png">
	 </button>
    </div>
    
    <br><br>
		
	<p class="contact__rights" style='color:gray;'>Copyright © 2023 <span style='color:var(--color-orange)'>ICU</span> Inc. All rights reserved.</p>	
  
  	<script>
  	 $(function(){
         if('${flag}' == 'showAlert'){
        	 Swal.fire({
                 icon:'error',
                 title: "로그인 실패"
           		});
        	}
     });
  	</script>
	
    <script src="resources/js/02_mainPage.js" defer></script>
    <script src="resources/js/main.js" defer></script>
  </body>
</html>
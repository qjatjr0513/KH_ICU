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
        <span>아이디</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          class="info-id info"
          type="text"
          placeholder="아이디를 입력해주세요."
          id="memId"
          name="memId"
          
        />
      </div>
      <div class="input__pwd">
        <span>비밀번호</span> &nbsp;&nbsp;
        <input
          class="info-pwd info"
          type="password"
          placeholder="비밀번호를 입력해주세요."
           id="memPwd"
          name="memPwd"
        />
      </div>
      <div class="join-container">
        <a href="${contextPath }/agreeForm.me">회원가입 &nbsp;|&nbsp; </a>
        <a href="${contextPath }/find.me">아이디 / 비밀번호 찾기</a>
      </div>
    </div>

    <!-- login , naver , kakao -->
    <div id="loginButton">
      <div class="login__button loginbtn">
        <button type="submit">로그인</button>
      </div>
    </div>
	</form>
	
    <div id="naver_id_login" style="text-align:center">
      <a id="naverlogin" href="${url}">
	  <img width="223" src="resources/images/naver_btn.png" style="height:60px; width:400px;"/>
  	  </a>
    </div>
	  
    <div class="kakao__button loginbtn" style="text-align:center">
     <!-- 카카오 로그인 -->
	 <a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=faf6b25930399b2135403b6474fb775f&redirect_uri=http://localhost:8088/icu/kakaoLogin&response_type=code">
		<img src="resources/images/kakao_login_large_wide.png" style="height:60px">
	 </a>
    </div>
		
  
	
    <script src="resources/js/02_mainPage.js" defer></script>
    <script src="resources/js/main.js" defer></script>
  </body>
</html>
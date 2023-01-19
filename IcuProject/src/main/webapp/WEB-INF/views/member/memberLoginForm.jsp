<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 로그인</title>
<!-- bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>

    <!-- animate.css -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />

    <!-- 웹사이트에 아이콘 추가 -->
    <link rel="icon" type="image/png" href="resources/images/navbarLogo.png" />

    <!-- Font Awesome cdn -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- css -->
    <link rel="stylesheet" href="resources/css/03_logIn.css" />

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
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
        <div id="naver_id_login" style="text-align:center">
      	<a id="naverlogin" href="${url}">
			<img width="223" src="resources/images/naver_btn.png" style="height:60px; width:400px;"/>
	  	</a>
	  </div>
      <div class="kakao__button loginbtn">
      <!-- 카카오 로그인 -->
      <c:if test="${userId eq null}">
		<a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=faf6b25930399b2135403b6474fb775f&redirect_uri=http://localhost:8088/icu/kakaoLogin&response_type=code">
			<img src="resources/images/kakao_login_large_wide.png" style="height:60px">
		</a>
	  </c:if>
	  
		<c:if test="${userId ne null}">
	        <div class="kakao__button loginbtn">
	       	   <button type="button" onclick="location.href='${contextPath}/logout'">
	             <img src="resources/images/kakaoLogo.png" />카카오톡 로그아웃
	           </button>
		    </div>
    	</c:if>
      </div>
		
  
    </div>
	</form>
	
    <script src="resources/js/02_mainPage.js" defer></script>
    <script src="resources/js/main.js" defer></script>
  </body>
</html>
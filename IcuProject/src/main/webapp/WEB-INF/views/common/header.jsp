<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU 헤더</title>
</head>
<body>
	<!-- Navbar -->
    <nav id="navbar">
      <div class="navbar__logo">
        <a href="#">
          <img class="logoImg" src="resources/images/navbarLogo.png" alt="cloudLogo" width="150px">
        </a>
      </div>
      
      <ul class="navbar__menu">
        <li class="navbar__menu__item active1" data-link="#home">파티만들기</li>
        <li class="navbar__menu__item" data-link="#about">파티찾기</li>
        <li class="navbar__menu__item" data-link="#skills">이벤트</li>
        <li class="navbar__menu__item" data-link="#work">자주 묻는 질문</li>
        <li class="navbar__menu__item" data-link="#testimonials">
          <a href="${contextPath }/login.me" style="text-decoration: none; color:black;">로그인</a>
        </li>
      </ul>
      
      <!-- Toggle button -->
      <button class="navbar__toggle-btn">
        <i class="fa-solid fa-bars"></i>
      </button>
    </nav>
</body>
</html>
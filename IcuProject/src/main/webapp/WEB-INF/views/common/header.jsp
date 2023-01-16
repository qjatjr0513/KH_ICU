<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <li class="navbar__menu__item" data-link="#skills">
           <a href="${contextPath }/contentList.co" style="text-decoration: none; color:black;">컨텐츠 찾기</a>
        </li>

        <li class="navbar__menu__item" data-link="#work">자주 묻는 질문</li>
        <li class="navbar__menu__item" data-link="#testimonials">
        <c:choose>
        	<c:when test="${ empty loginUser }">
        	<!-- 로그인 전 -->
          		<a href="${contextPath }/loginForm.me" style="text-decoration: none; color:black;">로그인</a>
          	</c:when>
          	<c:otherwise>
          		<label>${loginUser.memName }님 환영합니다.</label>&nbsp;&nbsp;
          		<a href="${contextPath }/myPage.me">마이페이지</a>
				<a href="${contextPath }/logout.me">로그아웃</a>
          	</c:otherwise>
          </c:choose>
        </li>
      </ul>
      
      <!-- Toggle button -->
      <button class="navbar__toggle-btn">
        <i class="fa-solid fa-bars"></i>
      </button>
    </nav>
</body>
</html>
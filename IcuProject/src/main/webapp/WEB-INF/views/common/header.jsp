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
        <li class="navbar__menu__item active1" data-link="#home">
        	<a href="${contextPath }/partyEnroll.py" style="text-decoration: none; color:black;">파티만들기</a></li>
        <li class="navbar__menu__item" data-link="#about">
        	 <a href="${contextPath }/findParty.py" style="text-decoration: none; color:black;">파티찾기</a></li>
        </li>
        <li class="navbar__menu__item" data-link="#skills">
           <a href="${contextPath }/contentList.co" style="text-decoration: none; color:black;">컨텐츠 찾기</a>
        </li>

        <li class="navbar__menu__item" data-link="#work">자주 묻는 질문</li>
        <li class="navbar__menu__item">
        	<a href="${contextPath }/board/list.bo" style="text-decoration: none; color:black;">자유게시판</a></li>
        <li class="navbar__menu__item">FAQ</li>
        &nbsp;&nbsp;
        <li>
        <c:choose>
          	<c:when test="${userId ne null}">
        		<div class="dropdown">
		          <button
		            class="btn btn-secondary dropdown-toggle profile"
		            type="button"
		            data-bs-toggle="dropdown"
		            aria-expanded="false"
		          >
		            <i class="fa-solid fa-user fa-lg"></i>
		          </button>
		          <ul class="dropdown-menu">
		            <li><span class="dropdown-item">${userNick }</span></li>
		            <li><a class="dropdown-item" href="${contextPath }/myPage.me">마이페이지</a></li>
		            <li><a class="dropdown-item" href="${contextPath }/logout">로그아웃</a></li>
		          </ul>
		        </div>
          	</c:when>
        	<c:when test="${ empty loginUser }">
        	<!-- 로그인 전 -->
          		<a href="${contextPath }/loginForm.me" style="text-decoration: none; color:black;">로그인</a>
          	</c:when>
          	<c:otherwise>
          		<div class="dropdown">
		          <button
		            class="btn btn-secondary dropdown-toggle profile"
		            type="button"
		            data-bs-toggle="dropdown"
		            aria-expanded="false"
		          >
		            <i class="fa-solid fa-user fa-lg"></i>
		          </button>
		          <ul class="dropdown-menu">
		            <li><span class="dropdown-item">${loginUser.memName}</span></li>
		            <li><a class="dropdown-item" href="${contextPath }/myPage.me">마이페이지</a></li>
		            <li><a class="dropdown-item" href="${contextPath }/logout.me">로그아웃</a></li>
		          </ul>
		        </div>
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
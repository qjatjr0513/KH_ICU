<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회 페이지</title>
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    <br><br><br><br>
    <ul>
	    <li class="navbar__menu__item" data-link="#work">
	      	<a href="${contextPath }/chat/chatRoomList" style="text-decoration: none; color:black;">실시간 문의</a>
	      	</li>
	
	        <li class="navbar__menu__item">
	        <a href="${contextPath }/faqList.fq" style="text-decoration: none; color:black;">FAQ</a></li>
	        &nbsp;&nbsp;
     </ul>
</body>
</html>
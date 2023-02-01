<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/admin_main.css?" />
</head>
<body>
	<!-- 왼쪽 수직 navbar -->
    <section id="vertical-navbar" >
      <div class="navbar-container">
        <div class="member__manage">
          <h2>회원정보</h2>
          <ul>
            <li><a href="${contextPath}/myPage.me">회원정보 수정</a></li>
            <li><a href="${contextPath}/memDeleteForm.me">회원탈퇴</a></li>
          </ul>
          <hr />
        </div>
        <div class="party__manage">
          <h2>파티 메뉴</h2>
          <ul>
            <li><a href="${contextPath }/CurrentParty.py">참여중인 파티</a></li>
            <li><a href="${contextPath }/LastParty.py">참여했던 파티</a></li>
          </ul>
          <hr />
        </div>
        <div class="pay__manage">
          <h2><a href="${contextPath }/myPayListForm.pe">결제 내역</a></h2>
        </div>
      </div>
    </section>
</body>
</html>
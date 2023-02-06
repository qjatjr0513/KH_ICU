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
    <section id="vertical-navbar">
      <div class="navbar-container">
        <div class="member__manage">
          <h2>회원 정보 관리</h2>
          <ul>
            <li><a href="${contextPath}/memListForm.me">회원정보조회</a></li>
            <li><a href="${contextPath}/memBlackListForm.me">블랙리스트 관리</a></li>
          </ul>
          <hr />
        </div>
        <div class="party__manage">
          <h2>파티 관리</h2>
          <ul>
            <li><a href="${contextPath }/current.py">진행중인 파티</a></li>
            <li><a href="${contextPath }/end.py">종료된 파티</a></li>
          </ul>
          <hr />
        </div>
        <div class="contents__manage">
          <h2><a href="${contextPath }/contentListForm.co">컨텐츠 관리</a></h2>
          <hr />
        </div>
        <div class="faq__manage">
          <h2><a href="${contextPath }/faqList.fq">FAQ 관리</a></h2>
          <hr />
        </div>
        <div class="notice__manage">
          <h2><a href="${contextPath }/noticeList.bo">공지사항 관리</a></h2>
          <hr />
        </div>
        <div class="pay__manage">
          <h2><a href="${contextPath }/payManageListForm.pe">결제 관리</a></h2>
          <hr />
        </div>
        <div class="inquiry__manage">
          <h2><a href="${contextPath }/chat/chatRoomList">실시간 문의</a></h2>
        </div>
      </div>
    </section>
</body>
</html>
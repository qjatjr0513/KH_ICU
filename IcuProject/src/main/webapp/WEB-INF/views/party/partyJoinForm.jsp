<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
    <link rel="stylesheet" href="resources/css/10_application.css" />

</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 파티신청 div -->
    <section id="application">
      <div class="app-container">
        <h2>파티 신청</h2>
      </div>
      <hr />
      <div class="table-container">
        <table class="first-table">
          <tr>
            <td>서비스</td>
            <td><span>넷플릭스</span></td>
          </tr>
          <tr>
            <td>제목</td>
            <td><span>파티 제목</span></td>
          </tr>
          <tr>
            <td>아이디</td>
            <td><span>사용자 아이디</span></td>
          </tr>
          <tr>
            <td>닉네임</td>
            <td><span>사용자 닉네임</span></td>
          </tr>
        </table>
        <hr />
      </div>
      <div class="table-container">
        <table class="second-table">
          <tr>
            <td>결제 금액</td>
            <td><span>11,360원</span></td>
          </tr>
          <tr>
            <td>종료 일자</td>
            <td><span>2023/10/20 (100일)</span></td>
          </tr>
        </table>
      </div>
      <br />
      <div class="btn-group2">
        <button>이전</button>
        <button>결제</button>
      </div>
    </section>
</body>
</html>
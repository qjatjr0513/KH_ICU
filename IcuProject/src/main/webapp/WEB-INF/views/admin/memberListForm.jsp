<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회 페이지</title>

	<!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/admin_01_manageMeber.css" />

</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../admin/adminNavbar.jsp"/>
    
    <!-- 회원정보조회 -->
    <section id="memberInfo">
      <h2>회원정보조회</h2>
      <hr />
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">회원번호</th>
            <th scope="col">이름 (닉네임)</th>
            <th scope="col">생년월일</th>
            <th scope="col">휴대폰 번호</th>
            <th scope="col">가입일</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>이범석 (aaa)</td>
            <td>2023-01-01</td>
            <td>010-1111-2222</td>
            <td>2023-01-01</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>서경주 (bbb)</td>
            <td>2023-01-01</td>
            <td>010-1111-2222</td>
            <td>2023-01-01</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>이상엽 (ccc)</td>
            <td>2023-01-01</td>
            <td>010-1111-2222</td>
            <td>2023-01-01</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>한대웅 (ddd)</td>
            <td>2023-01-01</td>
            <td>010-1111-2222</td>
            <td>2023-01-01</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>황종수 (fff)</td>
            <td>2023-01-01</td>
            <td>010-1111-2222</td>
            <td>2023-01-01</td>
          </tr>
        </tbody>
      </table>

      <div aria-label="Page navigation example" class="pagination">
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </div>
    </section>
</body>
</html>
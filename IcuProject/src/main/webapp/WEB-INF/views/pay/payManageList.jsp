<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
    <link rel="stylesheet" href="resources/css/admin_07_payManage.css" />
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../admin/adminNavbar.jsp"/>
   
 <!-- 결제관리 -->
    <section id="payList">
      <h2>결제 관리</h2>
      <hr />
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">결제일자</th>
            <th scope="col">파티방 번호</th>
            <th scope="col">이름 (닉네임)</th>
            <th scope="col">서비스</th>
            <th scope="col">결제 수단</th>
            <th scope="col">결제 금액</th>
            <th scope="col">파티장 계좌번호</th>
            <th scope="col">송금</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">2023-01-01</th>
            <td>111111</td>
            <td>이범석 (aaa)</td>
            <td>NETFILX</td>
            <td>카카오 페이</td>
            <td>6000</td>
            <td>국민 010101-010101</td>
            <td><button>송금</button></td>
          </tr>
          <tr>
            <th scope="row">2023-01-01</th>
            <td>111111</td>
            <td>이범석 (aaa)</td>
            <td>NETFILX</td>
            <td>카카오 페이</td>
            <td>6000</td>
            <td>국민 010101-010101</td>
            <td><button>송금</button></td>
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

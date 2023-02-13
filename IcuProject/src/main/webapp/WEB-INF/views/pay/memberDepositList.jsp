<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${map.list }"/>
<c:set var="pi" value="${map.pi }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입금 목록 페이지</title>
</head>
	<!-- css -->
    <link rel="stylesheet" href="resources/css/admin_07_payManage.css" />
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../member/myNavbar.jsp"/>

   
 <!-- 결제내역 -->
    <section id="payList" class='animate__animated animate__fadeIn'>
      <h2 class='memberTitle'>입금 내역</h2>
      <hr />
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">입금 일자</th>
            <th scope="col">파티명</th>
            <th scope="col">서비스</th>
            <th scope="col">보낸 사람</th>
            <th scope="col">입금 금액</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${empty list }">
            <tr id="tableEmpty">
              <td colspan="5">조회할 입금내역이 없습니다</td>
            </tr>
          </c:if>
          <c:forEach var="d" items="${list }" >
            <tr>
              <th scope="row">${d.depDate}</th>
              <td>${d.paTitle}</td>
              <td>${d.ottName}</td> 
              <td>${d.memNickname}</td>
              <td>${d.depPrice}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <c:set var = "url" value="?cpage="/>
      <div aria-label="Page navigation example" class="pagination">
        <ul class="pagination">
          <c:choose>
            <c:when test="${pi.currentPage eq 1 }">
              <li class="page-item disabled" ><a class="page-link" aria-label="Previous" href="#">&laquo;</a></li>
            </c:when>
            <c:otherwise>
              <li class="page-item" ><a class="page-link" aria-label="Previous" href="${url }${pi.currentPage -1 }">&laquo;</a></li>
            </c:otherwise>
          </c:choose>
          
          <c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
          <li class="page-item"><a class="page-link" href="${url }${item }">${item}</a></li>
          </c:forEach>

          <c:choose>
            <c:when test="${pi.currentPage eq pi.maxPage }">
              <li class="page-item disabled"><a class="page-link" aria-label="Next" href="#">&raquo;</a></li>
            </c:when>
            <c:otherwise>
              <li class="page-item"><a class="page-link" aria-label="Next" href="${url }${pi.currentPage +1 }">&raquo;</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </section>
    
    <!-- 실시간 문의 -->
    <jsp:include page="../common/chatForm.jsp"/>
    
  </body>
</html>

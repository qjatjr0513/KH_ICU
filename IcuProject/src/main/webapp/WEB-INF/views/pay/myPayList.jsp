<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${map.list }"/>
<c:set var="pi" value="${map.pi }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 관리 페이지</title>

	<!-- css -->
    <link rel="stylesheet" href="resources/css/admin_07_payManage.css" />
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../member/myNavbar.jsp"/>

   
 <!-- 결제내역 -->
    <section id="payList">
      <h2>결제 내역</h2>
      <hr />
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">결제일자</th>
            <th scope="col">파티명</th>
            <th scope="col">서비스</th>
            <th scope="col">결제 수단</th>
            <th scope="col">결제 금액</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${empty list }">
            <tr id="tableEmpty">
              <td colspan="5">조회할 결제내역이 없습니다</td>
            </tr>
          </c:if>
          <c:forEach var="p" items="${list }" >
            <tr>
              <th scope="row">${p.payDate}</th>
              <td>${p.paTitle}</td>
              <td>${p.ottName}</td> 
              <td>${p.payment}</td>
              <td>${p.price}</td>
              <input type="hidden" name="payNo" value="${p.payNo}">
              <input type="hidden" name="payMemNo" value="${p.payMemNo}">
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
  </body>
</html>

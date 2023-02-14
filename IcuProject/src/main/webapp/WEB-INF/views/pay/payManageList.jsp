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
    <link rel="stylesheet" href="${contextPath }/resources/css/admin_07_payManage.css" />
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../admin/adminNavbar.jsp"/>
   
	<!-- 결제관리 -->
    <section id="payList" class='animate__animated animate__fadeIn'>
      <h2 class='memberTitle'>결제 관리</h2>
      <hr />
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">결제일자</th>
            <th scope="col">파티명</th>
            <th scope="col">이름 (닉네임)</th>
            <th scope="col">서비스</th>
            <th scope="col">결제 수단</th>
            <th scope="col">결제 금액</th>
            <th scope="col">파티장 계좌번호</th>
            <th scope="col">송금</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${empty list }">
            <tr id="tableEmpty">
              <th colspan="8">조회할 결제내역이 없습니다</th>
            </tr>
          </c:if>
          <c:forEach var="p" items="${list }" >
            <tr>
              <form id="remitConfirm" action="${contextPath }/admin/remitConfirm.pe?paName=${p.paName}&paMemNickName=${p.paMemNickName}&memNickName=${p.memNickName}&memNo=${p.memNo}&paNo=${p.paNo }&remPrice=${p.price}" method="post">
              <td scope="row">${p.payDate}</td>
              <td>${p.paTitle}</td>
              <td>${p.memName}(${p.memNickName})</td> 
              <td>${p.ottName}</td> 
              <td>${p.payment}</td>
              <td>${p.price}</td>
              <td>${p.account}</td>
              <c:choose>
                  <c:when test="${p.remitStatus eq 'N'}">
                    <td><button type="submit" class="btn btn-primary ">송금</button></td>
                  </c:when>
                  <c:otherwise>
                    <td>송금완료</td>
                  </c:otherwise>
              </c:choose>
              <input type="hidden" name="payNo" value="${p.payNo}">
              <input type="hidden" name="remitStatus" value="${p.remitStatus}">
              </form>
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

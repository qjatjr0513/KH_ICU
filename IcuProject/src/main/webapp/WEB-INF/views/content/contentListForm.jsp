<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${map.list }"/>
<c:set var="pi" value="${map.pi }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
    <link rel="stylesheet" href="resources/css/admin_05_contentsManage.css" />

</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../admin/adminNavbar.jsp"/>
    
    <!-- 컨텐츠 관리 -->
    <section id="blackList">
      <h2>컨텐츠 관리</h2>
      <hr />

      <button class="contents__enrollBtn" onclick="location.href='${contextPath}/contentEnrollForm.co'">새 컨텐츠 등록</button>
      <br /><br /><br />

      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">컨텐츠번호</th>
            <th scope="col">분류</th>
            <th scope="col">제목</th>
            <th scope="col">플랫폼</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="l" items="${list }">   
	          <tr onclick="movePage(${l.conNo });">
	            <th scope="row">${l.conNo }</th>
	            <td>${l.conCategory }</td>
	            <td>${l.conKTitle }</td>
	            <td>${l.ottName }</td>
	          </tr>
          </c:forEach> 
        </tbody>
      </table>
	  <c:set var = "url" value="?cpage="/>
	  
      <div aria-label="Page navigation example" class="pagination">
        <ul class="pagination">
					<c:choose>
						<c:when test="${pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${url }${pi.currentPage -1 }">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
						<li class="page-item"><a class="page-link" href="${url }${item }">${item}</a></li>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${url }${pi.currentPage +1 }">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
      </div>
    </section>
    <script>
		function movePage(cno){
	 		location.href = '${contextPath}/detail?conNo='+cno;
	 	}
    </script>
  </body>
</html>

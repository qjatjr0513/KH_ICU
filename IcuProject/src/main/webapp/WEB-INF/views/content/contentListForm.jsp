<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${list }"/>
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
    <script>
		function movePage(cno){
	 		location.href = '${contextPath}/detail?conNo='+cno;
	 	}
    </script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pi" value="${map.pi }"/>
<c:set var="list" value="${map.list }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
<br><br>
	<div class="content">
		<br><br>
		<div class="innerOuter" style="padding: 5% 10%;">
			<h2>FAQ</h2>
			<br>
			<!-- 로그인시에만 보이는 글쓰기 버튼. -->
			<c:if test="${ not empty loginUser }">
				<a class="btn btn-secondary" style="float:right;" href="${contextPath }/enrollForm.fq">작성하기</a>
			</c:if>
			<br><br><br>
			<table id="boardList" class="table table-hover" align="center">
				<thead>
					<tr>
						<th>글번호</th>
						<th>분류</th>
						<th>질문</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr id="tableEmpty">
							<td colspan="5">목록이 없습니다..</td>
						</tr>
					</c:if>
					
					<c:forEach var="f" items="${list }" >
					<tr>
						<td>${f.faqNo}</td>
						<c:choose>
							<c:when test="${f.faqType == 'AC' }">
							<td>계정문의</td>
							</c:when>
							<c:when test="${f.faqType == 'PY' }">
							<td>파티문의</td>
							</c:when>
							<c:otherwise>
							<td>결제문의</td>
							</c:otherwise>
						</c:choose>
						<td>${f.faqTitle }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>			
			
			<!-- 
				게시글 클릭했을때 게시글 상세보기화면으로 이동하는 스크립트 구현.
			 -->			
			<script>
			
			$(function(){
	            $("#boardList>tbody>tr").click(function(){
	               
// 	               if($(this.text() != $("#tableEmpty").text()){ // 클릭방지 기능 구현중.

	                  let bno = $(this).children().eq(0).text();
	                  
	                  location.href="${contextPath}/detail.bo/"+bno;
// 	               } 

	            });
	         });
			</script>
			

			<c:set var = "url" value="cpage="/>
			<!-- 페이지 이동기능 구현 -->
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">&lt</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${url }${pi.currentPage -1 }${sUrl}">&lt</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
						<li class="page-item"><a class="page-link" href="${url }${item }${sUrl}">${item}</a></li>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">&gt</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${url }${pi.currentPage +1 }${sUrl}">&gt</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<br><br>
	
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${map.list }"/>
<c:set var="pi" value="${map.pi }"/>
<c:if test="${!empty param.condition }">
	<c:set var="sUrl" value="&condition=${param.condition}&keyword=${param.keyword }"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/07_boardList.css">

<title>Insert title here</title>


</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br>
	<div class="content">
		<br><br>
		<div class="innerOuter" style="padding: 5% 10%;">
			<h2>자유게시판</h2>
			<br>
			<!-- 로그인시에만 보이는 글쓰기 버튼. -->
			<c:if test="${ not empty loginUser }">
				<a class="btn btn-secondary" style="float:right;" href="${contextPath }/board/enrollForm.bo">글쓰기</a>
			</c:if>
			<br><br><br>
			<table id="boardList" class="table table-hover" align="center">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<td colspan="5">게시글이 없습니다..</td>
					</c:if>
					
					<c:forEach var="b" items="${list }" >
					<tr onclick="movePage(bno)">
						<td class="bno">${b.boardNo }</td>
						<td>${b.boardTitle }</td>
						<td>${b.boardWriter }</td>
						<td>${b.createDate }</td>
						<td>${b.count}</td>
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

					let bno = $(this).children().eq(0).text(); // 1, 2
					// 현재 내가클릭한 tr의 자손들중 0번째에 위치한 자식의 textnode내용을 가져온다.
					
					location.href="${contextPath}/board/detail/"+bno;

				});
			});
			</script>
			
			
			<!-- 검색 기능 구현 -->
			<br clear="both"><br>
			<form id = "searchForm" method="get" align="center">
				<div class="select">
					<select class="custom-select" name="condition">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="text">
					<input type="text" class="form-control" name="keyword">
				</div>
				<button type="submit" class="searchBtn btn btn-secondary">검색</button>
			</form>
			<br><br><br><br>

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
	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
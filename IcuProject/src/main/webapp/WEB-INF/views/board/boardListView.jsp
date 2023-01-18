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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/07_boardList.css" />

<title>Insert title here</title>
<!-- 공통적으로 사용할 라이브러리 추가 -->
<!-- Jquery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <!-- bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>

    <!-- animate.css -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />

    <!-- 웹사이트에 아이콘 추가 -->
    <link rel="icon" type="image/png" href="../resources/images/navbarLogo.png" />

    <!-- Font Awesome cdn -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- css -->
    <link rel="stylesheet" href="resources/css/06_findId.css?1" />

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>

    <!-- sweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
				<a class="btn btn-secondary" style="float:right;" href="${contextPath }/enrollForm.bo">글쓰기</a>
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
						
						location.href="${contextPath}/detail.bo/"+bno;
						

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
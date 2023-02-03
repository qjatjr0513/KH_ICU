<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 문의 리스트</title>
	<!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/admin_09_chatManage.css" />
</head>
<body>

   <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../admin/adminNavbar.jsp"/>

    <!-- 결제관리 -->
    <section id="chatList">
      <h2>실시간 문의</h2>
      <hr />
      <!-- 로그인시에만 보이는 글쓰기 버튼. -->
			<c:if test="${ not empty loginUser }">
				<a class="btn btn-secondary" style="float:right;" href="${contextPath }/enrollForm.fq">작성하기</a>
			</c:if>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">방번호</th>
            <th scope="col">개설자</th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody>
					<c:choose>
						
						<%-- 채팅목록이 없을때 --%>
						<c:when test="${empty chatRoomList}">
							<tr>
								<td colspan="3">존재하는 채팅방이 없습니다.</td>
							</tr>
						</c:when>
						
						<%-- 채팅목록이 있을경우 --%>
						<c:otherwise>
							<c:forEach var="chatRoom" items="${chatRoomList }">
								<tr>
									<td>${chatRoom.chatRoomNo }</td>
									<td>
										${chatRoom.memNickname }
										
									</td>
										<c:if test="${loginUser.memNickname == chatRoom.memNickname || loginUser.memNickname == '관리자' }">
											<td><button class="btn btn-primary" onclick="location.href='${contextPath}/chat/room/${chatRoom.chatRoomNo}'">참여</button></td>
										</c:if>
									
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

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
    
</body>
</html>
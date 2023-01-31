<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

	<div class="content">
		<br><br>
		<div class="innerOuter" style="padding: 5% 10%;">
			<h2>실시간 문의</h2>
			<br><br>
			<table class="table table-hover" align="center">
				<thead>
					<tr>
						<th>방번호</th>
						<th>개설자</th>
					</tr>
				</thead>
				
				<tbody>
					<c:choose>
						
						<%-- 채팅목록이 없을때 --%>
						<c:when test="${empty chatRoomList}">
							<tr>
								<td colspan="4">존재하는 채팅방이 없습니다.</td>
							</tr>
						</c:when>
						
						<%-- 채팅목록이 있을경우 --%>
						<c:otherwise>
							<c:forEach var="chatRoom" items="${chatRoomList }">
								<tr>
									<td>${chatRoom.chatRoomNo }</td>
									<td>
										${chatRoom.memNickname }
										
										<c:if test="${loginUser.memNickname == chatRoom.memNickname || loginUser.memNickname == '관리자' }">
											<button class="btn btn-primary" onclick="location.href='${contextPath}/chat/room/${chatRoom.chatRoomNo}'">참여</button>
										</c:if>
									</td>
									
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
			<!-- 로그인이 되어있는 경우 --> 
			<c:if test="${!empty loginUser && loginUser.memId != 'admin' }">
				<div class="btn-area">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#chatModal">
					  채팅방만들기
					</button>
				</div>
			</c:if>
		</div>
		<br><br>
	</div>
	
	<div class="modal fade" id="chatModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- 모달 해더 -->
	      <div class="modal-header">
	        <h4 class="modal-title fs-5" id="exampleModalLabel">채팅방 만들기</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form action="${contextPath }/chat/openChatRoom" method="post">
	      	  <!--  모달 바디 -->
		      <div class="modal-body">
		         <label for="title" class="mr-sm-2">제목</label>
	             <input type="text" class="form-controll mb-2 mr-sm-2" placeholder="질문 제목" id="title" name="title"> 
		      </div>
		      <!-- 모달 푸터 -->
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-primary">만들기</button>
	            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
		      </div>
		   </form>
	    </div>
	  </div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#enrollForm>div{width:100%;}


</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br>
	<div class="content">
		<br><br>
		<div class="innerOuter" >
			<h2>게시글 작성하기</h2>
			<br>
			<form id="enrollForm" action="${contextPath }/board/insert.bo">
				<div >
					<div>
						<label for="title">제목 : </label>
						<input type="text" id="title" class="form-control" name="boardTitle" value="${b.boardTitle } " required>
					</div>
					<hr>
					<div>
						<label for="writer">작성자 : </label>
						<input type="text" id="writer" class="form-control" value="${loginUser.memNickname}" name="memNickname" readonly>
						<input type="hidden" name="boardWriter" value="${loginUser.memNo}">
					</div>
					<br>
					<div>
						<textarea id="content" style="resize:none;" cols="50" rows="20" class="form-control" name="boardContent" placeholder="내용을 입력해주세요." required></textarea>
					</div>
					<br>
				<input type="hidden" name="mode" value="${param.mode }"/>
				<input type="hidden" name="boardNo" value="${empty b.boardNo ? 0 : b.boardNo}"/>
				
				<div align="center">
					<a href="${contextPath }/board/list.bo" class="btn btn-danger">취소하기</a>
					<button type="submit" class="btn btn-primary">등록하기</button>
				</div>
			</form>
			
			
		</div>
	
	</div>

	
		
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
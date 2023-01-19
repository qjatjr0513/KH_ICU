<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <link rel="icon" type="image/png" href="resources/images/navbarLogo.png" />

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
<!--     <link rel="stylesheet" href="resources/css/05_enrollForm2.css" /> -->

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>

    <!-- Alert 창  -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
	table * {margin:5px;}
	table {
		width:100%;
	}
	/* div{
		border: 1px solid black;
	} */
</style>
</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
	<!-- Logo -->
    <div id="main__logo">
      <img src="resources/images/navbarLogo.png" />
    </div>
	<br><br>
	<div class="content">
		<br><br>
		<div class="innerOuter">
			<h2>${b.boardTitle }</h2>
			<div style="float:left;">
				<input type="text" id="writer" class="form-control" value="${loginUser.memNickname}" name="memNickname" readonly>
				<input type="hidden" name="boardWriter" value="${loginUser.memNo}">
			</div>
			<div style="float:right;">
				<c:if test="${not empty loginUser && loginUser.memNickname eq b.boardWriter }">
					<a class="btn btn-primary" href="${contextPath}/enrollForm.bo?mode=update&bno=${b.boardNo}">수정하기</a>
					<a class="btn btn-danger" href="${contextPath}/delete.bo?bno=${b.boardNo }">삭제하기</a>
				</c:if>
			</div>
			<br><br>
			
			<table id="contentArea" class="table">
				
				<tr>
					<td colspan="3">
					
					</td>
				</tr>
				<tr>
					<td colspan="4"><p style="height:150px;">${b.boardContent }</p></td>
				</tr>
			</table>
			<br>
			
			<div align="center">
				<a class="btn btn-primary" href="${contextPath }/list.bo">목록으로</a>
			</div>
			<br><br>
			
			<!-- 댓글등록기능 -->
			<table id="replyArea" class="table" align="center">
				<thead>
					<tr>
						<th colspan="2">
							<textarea class="form-control" name="replyContent" id="replyContent" rows="2" cols="55" 
							style="resize:none; width:100%;" placeholder="내용을 입력해주세요";></textarea>
						</th>
						<th style="vertical-align: middle;"><button class="btn btn-secondary" onclick="insertReply()">입력</button></th>
					</tr>
					<tr>
						<td colspan="3">댓글(<span id="rcount"></span>)</td>
					</tr>
				</thead>
				<tbody>
					<!-- 스크립트 구문으로 댓글 추가 -->
				
				</tbody>
			</table>
				<script>
					$(function(){
					selectReplyList();
						
					});
				
					function insertReply(){
						$.ajax({
							url : "${contextPath}/insertReply.bo",
							data : {
								refTno : ${empty b.boardNo ? "" : b.boardNo},
								replyContent : $("#replyContent").val()
							},
							type : "post",
							success : function(result){
								$("#replyContent").val("");
								if(result == "1"){
									alertify.alert("서비스 요청 성공", '댓글등록성공')
									
								}else{
									alertify.alert("서비스 요청 실패", '댓글등록실패')
									
								}
								selectReplyList();
							},
							complete : function(){
								$("#replyContent").val("");
							}
						});
					}
			
					function selectReplyList(){
						$.ajax({
							url : "${contextPath}/reply.bo",
							data : {bno : ${b.boardNo}},
							dataType : "json",
							success : function(result){
								console.log("성공");
								console.log(result);
								let html = "";
								
								for(let reply of result){
									html += "<tr>"
										+ "<td>" + reply.member.memNickname+"</td>"
										+ "<td>" + reply.replyContent+"</td>"
										+ "<td>" + reply.createDate+"</td>"
								   + "</tr>";
								}
								$("#replyArea tbody").html(html);
								$("#rcount").html(result.length);
							},
							error : function(){
								console.log("댓글리스트조회용 ajax통신 실패!");
							}
						});
					}
			
				</script>
						
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
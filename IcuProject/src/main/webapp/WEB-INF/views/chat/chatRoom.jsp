<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 문의</title>
<style>
	.chatting-area{
		margin : auto;
		height : 600px;
		width : 800px;
		margin-top : 50px;
		margin-bottom : 50px;
	}
	#exit-area{
		text-align: right;
		margin-bottom: 10px;
	}
	.display-chatting{
		width:100%;
		height:450px;
		border : 1px solid pink;
		overflow : auto;
		list-style : none;
		padding : 10px 10px;
	}
	.chat{
		display : inline-block;
		border-radius : 5px;
		padding: 5px;
		background-color : #eee;
	}
	.input-area{
		width:100%;
		display:flex;
	}
	#inputChatting{
		width:80%;
		resize:none;
	}
	#send{
		width:20%;
	}
	.myChat{
		text-align : right;
	}
	.myChat > p{
		background-color : yellow;
	}
	.chatDate{
		font-size : 10px;
	}
</style>
</head>
<body>
 	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    <br><br>
<div class="chatting-area">
		<div id="exit-area">
			<button class="btn btn-outline-danger" id="exit-btn">나가기</button>
		</div>
		<ul class="display-chatting">
			<c:forEach items="${list }" var="msg">
				<fmt:formatDate var="chatDate" value="${msg.createDate }" pattern="a hh:mm"/>
				
				<%-- 1) 내가 보낸 메세지 --%>
				<c:if test="${msg.memNo == loginUser.memNo}">
					<li class="myChat">
						<span class="chatDate">${chatDate }</span>
						<p class="chat">${msg.message }</p>
					</li>
				</c:if>
				
				<%-- 2) 남(이름)이 보낸 메세지 --%>
				<c:if test="${msg.memNo != loginUser.memNo}">
					<li class="">
						<b>${msg.memNickname }</b>
						<br>
						<p class="chat">${msg.message }</p>
						<span class="chatDate">${chatDate }</span>
					</li>
				</c:if>
				
			</c:forEach>
		</ul>
		
		
		<input 
         type="text" 
         class="inputChatting" 
         id="adminMsg"
         placeholder="내용 입력" 
         style="border: 0;
               width: 100%;
               background: #ddd;
               border-radius: 5px;
               height: 30px;
               padding-left: 5px;
               box-sizing: border-box;
               margin-top: 5px;"/>
		
	</div>
	
	<br><br>
     

	
	<script>
	
		//el 태그 통해 js변수 셋팅
		const memNo = "${loginUser.memNo}";
      	const memNickname = "${loginUser.memNickname}";
      	const chatRoomNo = "${chatRoomNo}";
		
 		
	</script>
	
	<script src="${contextPath }/resources/js/chat.js"></script>
</body>
</html>
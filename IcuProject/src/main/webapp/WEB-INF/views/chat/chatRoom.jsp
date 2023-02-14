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

.iphone {
  position: absolute;
  top: 53%;
  left: 55%;
  transform: translate(-50%, -50%);
  width: 380px;
  height: 640px;
  background: #262626;
  border-radius: 35px;
  box-shadow: inset 0 0 15px rgba(0, 0, 0, 0.2), 0 40px 100px rgba(0, 0, 0, 0.4);
  border:3px solid white;
}
.iphone:before {
  content: '';
  position: absolute;
  top: 15px;
  left: 15px;
  width: calc(100% - 30px);
  height: calc(100% - 30px);
 /*  background: #262626; */
  border-radius: 25px;
  box-shadow: inset 0 0 20px rgba(0, 0, 0, 0.2);
  transition: 0.5s;
}

.iphone:after {
  content: '';
  position: absolute;
  top: 15px;
  left: 50%;
  transform: translateX(-50%);
  width: 130px;
  height: 16px;
  background: #262626;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  z-index:5;
} 


.display-chatting::-webkit-scrollbar {
   	width: 10px;
  }
  .display-chatting::-webkit-scrollbar-thumb {
    background-color: white;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .display-chatting::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px;
}

p{
	font-size:16px !important;
}
	
	.chat-header{
		width:300px;
		margin-left:905px;
		margin-top:60px;
		text-align:center;
	}
	.chat-header > h2 {
		font-size:32px;
	}
	.chatting-area{
		margin : auto;
		height : 600px;
		width : 800px;
		margin-bottom : 50px;
		margin-top : 50px;
		padding:20px;
		background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
		
		border-radius:12px;
		box-shadow:0 0 5px 1px lightgray;
	}
	#exit-area{
		text-align: center;
		margin-bottom: 10px;
		width: 300px;
	    margin: auto;

	}
	.display-chatting{
		position:absolute;
		top:-5px;
		left:16px;
		width:91%;
		height:86%;
		border:1px solid gray;
		margin:auto;
		margin-top:20px;
		overflow : auto;
		list-style : none;
		padding : 10px 10px;
		background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
		border-top-left-radius:25px;
		border-top-right-radius:25px;
		z-index:2;
	}
	.chat{
		display : inline-block;
		border-radius : 5px;
		padding: 5px;
		background-color : lightblue;
	}
	.input-area{
		width:100%;
		display:flex;
	}
	.inputChatting:focus{
		outline:none;
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
	#exit-btn:hover{
		transform:scale(1.05);
		background-color: var(--color-orange) !important;

	}
	


</style>
</head>
<body>
 	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
        <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../admin/adminNavbar.jsp"/>
    <br><br>
    
		
	<div class='chat-header titleText'>
		<h2>실시간 문의</h2>
	</div>	
		
		<div class="iphone">
		
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
		
		<br>
		<input 
         type="text" 
         class="inputChatting" 
         id="adminMsg"
         placeholder="내용 입력" 
         style="border: 0;
               width: 91%;
               background: white;
               border-bottom-left-radius: 16px;
               border-bottom-right-radius: 16px;
               height: 50px;
               padding-left: 8px;
               box-sizing: border-box;
               margin-top:540px;
               margin-left:16px;
               position:absolute;
               "/>
		
		</div>
		
		
		
		
<!-- <div class="chatting-area">
		
		
	</div> -->
	
     <div id="exit-area">
		<button class="btn btn-outline-danger" id="exit-btn" 
		style='background-color:gray;
		border:none;
		color:white;
		transition: all 0.1s;
		margin-top:700px;
		margin-left:200px;
	
		'>나가기</button>
	</div>

	
	<script>
	
		//el 태그 통해 js변수 셋팅
		const memNo = "${loginUser.memNo}";
      	const memNickname = "${loginUser.memNickname}";
      	const chatRoomNo = "${chatRoomNo}";
		
 		
	</script>
	
	<script src="${contextPath }/resources/js/chat.js"></script>
</body>
</html>
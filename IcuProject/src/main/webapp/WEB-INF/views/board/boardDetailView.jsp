<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   
<style>
   table * {margin:5px;}
   table {
      width:100%;
   }
   /* div{
      border: 1px solid black;
   } */
</style>

    <!-- css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/06_findId.css?2" />

    
</head>
<body>
   <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
   <!-- Logo -->
    <div id="main__logo">
      <img src="resources/images/navbarLogo.png" />
    </div>
   <br>
   <div class="content">
      <br><br>
      <div class="innerOuter">
         <h2>${b.boardTitle }</h2>
         <div style="float:left;">
            <span id="writer" class="form-control" name="memNickname">${b.boardWriter}</span>
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
         
         <div class="card mb-2">
            <div class="card-header bg-light">
                    <i class="fa fa-comment fa"></i> REPLY
            </div>
            <div class="card-body">
               <ul class="list-group list-group-flush">
                   <li class="list-group-item">
                  <textarea class="form-control"  name="replyContent" id="replyContent" rows="3" placeholder="내용을 입력해주세요";></textarea>
                  <c:if test="${not empty loginUser}">
                  <button type="button"  class="btn btn-dark mt-3" onClick="insertReply();">댓글 입력</button>
                  </c:if>
                   </li>
               </ul>
            </div>
         </div>
         
         <table id="replyArea" class="table" align="center">
            <thead>
               <tr>
                  <td colspan="3">댓글(<span id="rcount"></span>)</td>
               </tr>
            </thead>
            <tbody>
               <!-- 스크립트 구문으로 댓글 추가 -->
            
            </tbody>
         </table>
            <script>
            const replyWriter = "${loginUser.memNickname}";
            const boardWriter = "${b.boardWriter}";
            const boardNo = "${b.boardNo}";
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
                        	console.log("reply::socket>>", socket);
                        	
                        	if(socket){
                        		if(replyWriter != boardWriter ){
                        		let socketMsg = "reply,"+ replyWriter + "," + boardWriter + "," + boardNo;
                        		console.log("sssssssmsg>>", socketMsg);
                        		// websocket에 보내기!! (reply, 댓글작성자, 게시글 작성자, 게시글 번호)
                        		socket.send(socketMsg)                        			
                        		}
                        	}
                        	
                           Swal.fire({
                                   icon:'success',
                                   title: "댓글등록 성공"
                             });
                           
                        }else{
                           Swal.fire({
                                   icon:'error',
                                   title: "댓글등록 실패"
                             });
                           
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
               
         $('#btnSend').on('click', function(evt){
        	 evt.preventDefault();
        	 if(socket.readyState !== 1) return;
        	 
        	 let msg = $("textarea#replyContent").val();
        	 socket.send(msg);
         });
            </script>
            
      </div>
   </div>
   
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>
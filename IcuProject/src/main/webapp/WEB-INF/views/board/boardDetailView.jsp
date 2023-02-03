<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
   #replyWriter-img{
        vertical-align: middle;
        width: 100%;
        border-radius: 50%;
   }
   #boardWriter-img{
      vertical-align: middle;
      width: 5%;
      border-radius: 50%;
   }
</style>



    
</head>
<body>
   <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
   <div class="content" style="margin-top: 50px;">
      <br><br>
      <div class="innerOuter">
         <h2>${b.boardTitle }</h2>
         <div style="float:left;">
            <span>
               <c:choose>
                  <c:when test="${!empty b.changeName}">
                     <img id="boardWriter-img" src="${contextPath }${b.filePath }${b.changeName}">
                  </c:when>
                  <c:otherwise>
                     <i class="fa-solid fa-user fa-lg"></i>
                </c:otherwise>
               </c:choose>
            </span>
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
                  <textarea class="form-control"  name="replyContent" id="replyContent" rows="3" placeholder="내용을 입력해주세요"; style="resize: none;"></textarea>
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
                  <td colspan="3"><b>댓글(${list.size()})</b></td>
               </tr>
            </thead>
            <tbody>
              <c:forEach var="r" items="${list }" varStatus="i">
				<tr>
               <td style="width: 30px;">
               <c:choose>
                  <c:when test="${!empty r.changeName}">
                     <img id="replyWriter-img" src="${contextPath }${r.filePath }${r.changeName}">
                  </c:when>
                  <c:otherwise>
                     <i class="fa-solid fa-user fa-lg"></i>
                </c:otherwise>
               </c:choose>
               </td>
               <td id="rWriter">${r.replyWriter }</td>
					<td id="rContent">${r.replyContent }</td>
					<td>${r.createDate }</td>
					<td><input type="hidden" id="rno" value="${r.replyNo }"/></td>
					<c:if test="${r.replyWriter == loginUser.memNickname }">
					<%-- <td><button type='button' class='btn btn-danger' data-bs-toggle='modal' id="replyUpdate" data-bs-target='#exampleModal' data-rno="${r.replyNo }">삭제</button></td> --%>
					<td><button type='button' class='btn btn-danger'  id="replyUpdate"  onclick="location.href='${contextPath}/deleteReply.bo?rno=${r.replyNo }&boardNo=${b.boardNo}'">삭제</button></td>
					</c:if>
				</tr>
			</c:forEach>
               
            </tbody>
         </table>
         
         <!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title fs-5" id="exampleModalLabel">댓글 수정창</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <div class="form-group">
                  <label for="replyNo">댓글 번호</label>
                  <input class="form-control" id="replyNo" name="replyNo" readonly>
	              </div>
	              <div class="form-group">
	                  <label for="replyText">댓글 내용</label>
	                  <input class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
	              </div>
	              <div class="form-group">
	                  <input type="hidden" class="form-control" name="replyWriter" readonly>
	              </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-success">수정</button>
		        <button type="button" class="btn btn-danger">삭제</button>
		      </div>
		    </div>
		  </div>
		</div>
            <script>
            const replyWriter = "${loginUser.memNo}";
            const boardWriter = "${b.boardWriter}";
            const boardNo = "${b.boardNo}";
            const boardWriterNo = "${b.boardWriterNo}";	

            
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
                        		let socketMsg = "reply,"+ replyWriter + "," + boardWriter + "," +boardWriterNo + "," + boardNo;
                        		console.log("sssssssmsg>>", socketMsg);
                        		// websocket에 보내기!! (reply, 댓글작성자, 게시글 작성자, 게시글 번호)
                        		socket.send(socketMsg)                        			
                        		}
                        	}
                        	
                           Swal.fire({
                                   icon:'success',
                                   title: "댓글등록 성공"
                             }).then(function(){
                            	 location.href=contextPath+"/detail.bo/"+boardNo;
                             })
                           
                        }else{
                           Swal.fire({
                                   icon:'error',
                                   title: "댓글등록 실패"
                             });
                        }
                     },
                     complete : function(){
                        $("#replyContent").val("");
                     }
                  });
               }
         
              
               
         $('#btnSend').on('click', function(evt){
        	 evt.preventDefault();
        	 if(socket.readyState !== 1) return;
        	 
        	 let msg = $("textarea#replyContent").val();
        	 console.log(msg);
        	 socket.send(msg);
         });
         
         $(function(){
	         if('${flag}' == 'showAlert'){
	        	 Swal.fire({
                     icon:'success',
                     title: "댓글삭제 성공"
               		});
	        	}
         });
         
         /*$("#replyUpdate").click(function () {

        	 
        	 var replyNo = document.getElementById("rno"+i).value;
       	     var replyText = document.getElementById("rContent"+i).innerText;
       	     var replyWriter = document.getElementById("rWriter"+i).innerText;
       	     
       	     $("#replyNo").val(replyNo);
       	     $("#replyText").val(replyText);
       	     $("#replyWriter").val(replyWriter);

        	});*/
            </script>
            
      </div>
   </div>
   
   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="p" value="${p}"/>
<c:set var="pj" value="${pj}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 파티 상세조회</title>

    <!-- css -->
    <link rel="stylesheet" href="../resources/css/09_partyDetail.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 

</head>
<body>
   <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

    <!-- header -->
    <form id="joinPartyMember" action="${contextPath }/joinPartyMember">
    <section id="service-title">
      <div class="${p.ottName} ott__name">
        <h2>${p.ottName}</h2>
        <h4>${p.paTitle}</h4>
      </div>
      <div class="info__partyOwner">
        <i class="fa-solid fa-user fa-lg">&nbsp;${p.memNickname}</i>
        <span>파티번호 : ${p.paNo}</span>
        <input type="hidden" name="paNo" value="${p.paNo}">
      </div>
      <hr />
      <div class="info__date">
        <span>종료일자 : ${p.endDate} (${p.leftDate}일)</span> <br />
        <span>금액 : ${p.totalPrice}원</span>
        <button id="join"> 참여 신청</button>
      </div>
    </section>
    <!-- User Profile -->
    <section id="userProfile">
      <div class="containerBox">
        <div class="photo-container">
          <div class="userInformation">
            <div class="userPhoto">
            <c:choose>
				<c:when test="${!empty p.changeName}">
                     <img id="replyWriter-img" src="${contextPath }${p.filePath }${p.changeName}">
                </c:when>
                <c:otherwise>
                     <i class="fa-solid fa-user fa-3x"></i>
                </c:otherwise>
            </c:choose>
			</div>
            <br />
            <div class="userNickName"> 
              <h4>(파티장) ${p.memNickname}</h4>
              <span>${p.startDate} 생성</span>
            </div>
          </div>
          
          <c:forEach var="pj" items="${pj}" begin="0" end="${fn:length(pj)}" step="1">
          <div class="userInformation">
            <div class="userPhoto">
            <c:choose>
            	<c:when test="${!empty pj.changeName}">
                     <img id="replyWriter-img" src="${contextPath }${pj.filePath }${pj.changeName}">
                </c:when>
                <c:otherwise>
                     <i class="fa-solid fa-user fa-3x"></i>
                </c:otherwise>
            </c:choose>
            </div>
            <br />
            <div class="userNickName">
              <h4>${pj.memNickname}</h4>
              <span>${pj.joinDate} 참여</span>
            </div>
          </div>
          </c:forEach>          
          
          <c:forEach begin="1" end="${p.crewNum - fn:length(pj)}" step="1">
          <div class="userInformation">
            <div class="userPhoto"><i class="fa-solid fa-user fa-3x"></i></div>
            <br />
            <div class="userNickName">
              <h4></h4>
              <span></span>
            </div>
          </div>
          </c:forEach>
          
        </div>
        <br />
      </div>
      <hr style="width: 50%; margin: auto" />
    </section>
    <br />
    
         <!-- 댓글등록기능 -->
         <div class="card mb-2" id="comment">
            <div class="card-header bg-light">
                    <i class="fa fa-comment fa"></i> REPLY
            </div>
            <div class="card-body">
               <ul class="list-group list-group-flush">
                   <li class="list-group-item">
                   <textarea class="form-control"  name="replyContent" id="replyContent" rows="3" placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
                   <c:if test="${not empty loginUser}">
                   <button type="button"  class="btn btn-dark mt-3" onclick="insertReply();">댓글 입력</button>
                   </c:if>
                   </li>
               </ul>
            </div>
         </div>
         
         <div id="comment">
         <table id="replyArea" class="table" align="center" >
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
					<td><button type='button' class='btn btn-danger'  id="replyUpdate"  onclick="location.href='${contextPath}/deleteReply.py?rno=${r.replyNo }&paNo=${p.paNo}'">삭제</button></td>
					</c:if>
				</tr>
			</c:forEach>
               
            </tbody>
         </table>
         </div>
    
    <script>

		// 파티장일 경우 참여하기 버튼 가리기 
	    $(function(){
	    	if(${loginUser.memNo} == ${p.paName}){
	    		document.getElementById("join").style.display = "none";
	    	}
	    });
	    
		// 댓글 
	    const replyWriterNo = "${loginUser.memNo}";
	    const replyWriter = "${loginUser.memNickname}";
        const memNickname = "${p.memNickname}";
        const paNo = "${p.paNo}";
        const paName = "${p.paName}";	

        
        function insertReply(){
           console.log("댓글버튼 실행");
           
           $.ajax({
              url : "${contextPath}/insertReply.pa",
              data : {
                 refTno : paNo,
                 replyContent : $("#replyContent").val()
              },
              type : "post",
              success : function(result){
                 $("#replyContent").val("");
                 if(result == "1"){
                 	console.log("party::socket>>", socket);
                 	
                 	if(socket){
                 		if(replyWriterNo != paNo ){
                 		let socketMsg = "party,"+ replyWriterNo+ "," + replyWriter + "," + memNickname + "," +paName + "," + paNo;
                 		console.log("sssssssmsg>>", socketMsg);
                 		// websocket에 보내기!! (reply, 댓글작성자, 게시글 작성자, 게시글 번호)
                 		socket.send(socketMsg)                        			
                 		}
                 	}
                 	
                    Swal.fire({
                            icon:'success',
                            title: "댓글등록 성공"
                      }).then(function(){
                     	 location.href=contextPath+"/partyDetail.py/"+paNo;
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
    </script>
  </body>
</html>
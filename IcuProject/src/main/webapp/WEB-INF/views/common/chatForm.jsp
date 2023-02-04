<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 문의</title>
</head>
<body>
	<!-- chatBot -->
     <button class="chatBot" id="chatBot">
       <i class="fa-solid fa-headset"></i>
     </button>

     <!-- 챗봇 누르면 나오는 div -->
     <section id="chatting">
       
       <div class="chat_wrap animate__animated animate__fadeInUp">
         <div class="chat_header">
           <h5>실시간 문의</h5>
           <button type="button" class="close__chatDiv" id="close">
             <i class="fa-solid fa-xmark fa-lg" style="color: white"></i>
           </button>
           <hr />
           <span><i class="fa-solid fa-user"></i>&nbsp;&nbsp;관리자</span
           ><br />
           <span id="cdate"></span>
         </div>

         
         <div class="inner" id="mg"></div>

         <input 
         type="text" 
         class="mymsg send-msg" 
         id="userMsg"
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
     </section>
</body>
     <script src="resources/js/02_mainPage.js?1" defer></script>
     
     <script>
     let memNo = ${loginUser.memNo};
     let chatRoomNo = 0;
     $("#chatBot").click(function(){
     	
     	$.ajax({
     		url : "${contextPath }/chat/openChatRoom",
     		type: "post",
     		data : {memNo : memNo},
             success : function(result){	
            	 chatRoomNo = result;
    			console.log(chatRoomNo);
    			chatWs =   new SockJS(contextPath+"/chat")
    			chatting(chatWs);
             },	
             error : function(){
            	 
              }
         })
     });

     
     
     $("#close").click(function(){
      	
      	$.ajax({
      		url : "${contextPath }/chat/exit",
      		type: "post",
      		data : {memNo : memNo,
      			    chatRoomNo : chatRoomNo},
              success : function(result){	
          			console.log("나가기 성공!!!")
     
              },
              error : function(){
             	 
               }
          });
     	 
       });
     
      
   	  const memNickname = "${loginUser.memNickname}";
   	  
	
      
      
      
      var userMsg = document.getElementById("userMsg");

      
      userMsg.addEventListener("keypress", function(key){
    	  if(key.key == "Enter"){
    		  const chatMessage = {
    		            "memNo" : memNo,
    		            "memNickname" : memNickname,
    		            "chatRoomNo" : chatRoomNo,
    		            "message" : userMsg.value
    		        }
    		  //console.log(chatMessage);
    		  chatWs.send(JSON.stringify(chatMessage));
    	  }
      });
      
/*  	  var adminMsg = document.getElementById("adminMsg");
      
 	 adminMsg.addEventListener("keypress", function(key){
    	  if(key.key == "Enter"){
    		  var adminMsgValue = adminMsg.value;
    		  console.log(adminMsgValue);
    	  }
      });  */
      

// 띄우는거, 관리자 페이지 새로고침 고치기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	
	function chatting(socket){
    	  socket.onopen = function(){ // 커넥션이 연결되면 실행
   			console.log('Info: connection user chat.');
   			
   		}
   		
    	  socket.onmessage = function (e){
    		  const chatMessage = JSON.parse(e.data);
    		  console.log(chatMessage);
   			
   		 var html = "";
   		 html +='<div class="item yourmsg send-msg on"><div class="box"><p class="msg" id="msg">' +
         chatMessage.message +
         '</p><span class="time">' +
         currentTime() +
         '</span></div></div>';
   		$("#mg").append(html);
   		 };
   				
   		socket.onclose = function (e) { 
   			console.log('Info: chat connection closed.');
   		};
   		socket.onerror = function (err) { console.log('Error:;', err);};
    }
	
			
      $(document).ready(function(){
    	  $("#cdate").append("무엇을 도와드릴까요? "+currentTime());
       });
 	 
 	 
 	 
 	 

     </script>
</html>
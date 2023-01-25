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
     <button class="chatBot">
       <i class="fa-solid fa-headset"></i>
     </button>

     <!-- 챗봇 누르면 나오는 div -->
     <section id="chatting">
       
       <div class="chat_wrap animate__animated animate__fadeInUp">
         <div class="chat_header">
           <h5>실시간 문의</h5>
           <button class="close__chatDiv">
             <i class="fa-solid fa-xmark fa-lg" style="color: white"></i>
           </button>
           <hr />
           <span><i class="fa-solid fa-user"></i>&nbsp;&nbsp;관리자</span
           ><br />
           <span>무엇을 도와드릴까요? 2020-02-02 17:00</span>
         </div>

         
         <div class="inner"></div>

         <input 
         type="text" 
         class="mymsg send-msg" 
         placeholder="내용 입력" 
         style="border: 0;
               width: 100%;
               background: #ddd;
               border-radius: 5px;
               height: 30px;
               padding-left: 5px;
               box-sizing: border-box;
               margin-top: 5px;"/>
         <input
           type="text"
           class="yourmsg send-msg"
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
     <script src="resources/js/02_mainPage.js" defer></script>
</body>
</html>
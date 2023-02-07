
chatWs =   new SockJS(contextPath+"/chat");
chatting(chatWs);
// 1. 페이지 로딩 완료시 채팅창을 맨 아래로 내리기.
// 채팅방
// 즉시 실행함수. IIFE
(function(){
	const displayChatting = document.getElementsByClassName("display-chatting")[0];
	
	if(displayChatting != null){
		displayChatting.scrollTop = displayChatting.scrollHeight;
	}
})();


$(function () {
    // 입력하고 엔터 누르면 채팅 입력
    $('.inputChatting').keypress(function (e) {
      if (e.keyCode == 13 && $(this).val().length) {

       // 메세지 입력시 필요한 데이터를 js객체로 생성.
       const chatMessage = {
           "memNo" : memNo,
           "memNickname" : memNickname,
           "chatRoomNo" : chatRoomNo,
           "message" : adminMsg.value
       }
   
       
       // JSON.parse(문자열) : JSON -> JS object로 변환
       // JSON.stringify(객체) : JS object -> JSON
       //console.log(chatMessage);
       //console.log(JSON.stringify(chatMessage));
   
       // chatSocket(웹소캣객체)를 이용하여 메세지 보내기
       // chatSocket.send(값) : 웹소켓 핸들러로 값을 보냄.
       const li = document.createElement("li");
       const p = document.createElement("p");
    
       p.classList.add("chat");
    
       p.innerHTML = adminMsg.value.replace(/\\n/gm , "<br>"); // 줄바꿈 처리
    
       // span태그 추가
       const span = document.createElement("span");
       span.classList.add("chatDate");
    
    //  span.innerText = chatMessage.createDate;
        span.innerText = currentTime();
    
        // 내가쓴 채팅 
       li.append(span, p);
       li.classList.add("myChat"); // 본인글일경우
        
        
        // 채팅방
        const displayChatting = document.getElementsByClassName("display-chatting")[0];
    
        // 채팅장에 채팅 추가
        displayChatting.append(li);
   
       chatWs.send(JSON.stringify(chatMessage));
       adminMsg.value = "";
    const inputChatting = document.getElementById("inputChatting");
      }
    });
  });
  
  

  










function chatting(socket){
// 웹소켓에서 sendMessage라는 함수가 실행되었을때, -> 메세지가 전달되었을때를 의미함.
socket.onmessage = function(e){
    // 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체이다.(어떤때마다 다른 이벤트핸들러가 발생함 )
    // e.data : 전달된 메세지 -> message.getPayload() -> (JSON형태)로 되어있음

    // 전달받은 메세지를 JS객체로 변환 
    const chatMessage = JSON.parse(e.data); // JSON Object로 변환.
    console.log(chatMessage);
    /*
        <li>
            <p>메시지</p>
            <span>메세지 보낸 날짜</span>
        </li>
    */
       const li = document.createElement("li");
       const p = document.createElement("p");
    
       p.classList.add("chat");
    
       p.innerHTML = chatMessage.message.replace(/\\n/gm , "<br>"); // 줄바꿈 처리
    
       // span태그 추가
       const span = document.createElement("span");
       span.classList.add("chatDate");
    
    //    span.innerText = chatMessage.createDate;
        span.innerText = currentTime();
    
        li.innerHTML = "<b>"+chatMessage.memNickname+"</b><br>";
        li.append(p, span);
    
        
        // 채팅방
        const displayChatting = document.getElementsByClassName("display-chatting")[0];
    
        // 채팅장에 채팅 추가
        displayChatting.append(li);
    
        // 채팅장을 제일 밑으로 내리기
        displayChatting.scrollTop = displayChatting.scrollHeight;
        // scrollTop : 스크롤 이동
        // scrollHeight : 스크롤이되는 요소의 전체 높이. ( 0 ~ scrollHeight)

};
}


var currentTime = function () {
    var date = new Date();
    var hh =  addZero(date.getHours());
    var mm =  addZero(date.getMinutes());
    var apm = hh > 12 ? '오후' : '오전';
    var ct = apm + ' ' + hh + ':' + mm + '';
    return ct;
  };

// 10보다 작은수가 매개변수로 들어오는경우 앞에 0을 붙여서 반환해주는 함수.
function addZero(number){
    return number < 10 ? "0"+number : number;
}

document.getElementById("exit-btn").addEventListener("click", exit);

function exit(){
	
	$.ajax({
		url : contextPath+"/chat/exit",
		data : {"chatRoomNo" : chatRoomNo, 
		        "memNo" : memNo },
		success : function(result){
			if(result == 1){
				location.href = contextPath+"/chat/chatRoomList";
			}else{
				location.href = contextPath+"/chat/chatRoomList";
			}
		}
	})
}



'ust strict';

// 채팅봇
let chatClick = document.querySelector('.chatBot');
let chatDiv = document.querySelector('.chat_wrap');
let closeBtn = document.querySelector('.close__chatDiv');


// 문의 버튼 누르면 채팅창 나오는 부분
chatClick.addEventListener('click', function () {
  chatClick.style.display = 'none';
  chatDiv.style.display = 'block';
});

// 닫기(x)버튼 누르면 채팅창 사라지는 부분
closeBtn.addEventListener('click', function () {
  chatDiv.classList.add('animate__fadeOutDown');
  chatDiv.classList.remove('animate__fadeOutDown');
  chatDiv.style.display = 'none';
  chatClick.style.display = 'block';
  $('#mg').empty();
});


// 채팅 치고 입력하는 부분
$(function () {
  // 입력하고 엔터 누르면 채팅 입력
  $('.send-msg').keypress(function (e) {
    if (e.keyCode == 13 && $(this).val().length) {
      // 메세지 내용
      var _val = $(this).val(); // 입력 내용 변수
      var _class = $(this).attr('class'); // 입력 내용 클래스 변수
      $(this).val('');
      var _tar = $('.chat_wrap .inner').append(
        '<div class="item ' +
          _class +
          '"><div class="box"><p class="msg" id="msg">' +
          _val +
          '</p><span class="time">' +
          currentTime() +
          '</span></div></div>'
      );// 동적으로 채팅 한 div를 추가
      var lastItem = $('.chat_wrap .inner').find('.item:last');
      setTimeout(function () {
        lastItem.addClass('on');
      }, 10); // 
      

      var position =
        lastItem.position().top + $('.chat_wrap .inner').scrollTop();
      console.log(position);// 스크롤 이동

      $('.chat_wrap .inner').stop().animate({ scrollTop: position }, 500);
    }
  });
});


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




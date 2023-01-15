'ust strict';

// 채팅봇
let chatClick = document.querySelector('.chatBot');
let chatDiv = document.querySelector('.chat_wrap');
let closeBtn = document.querySelector('.close__chatDiv');

chatClick.addEventListener('click', function () {
  chatClick.style.display = 'none';
  chatDiv.style.display = 'block';
});

closeBtn.addEventListener('click', function () {
  chatDiv.classList.add('animate__fadeOutDown');
  chatDiv.classList.remove('animate__fadeOutDown');
  chatDiv.style.display = 'none';
  chatClick.style.display = 'block';
});

$(function () {
  $('.send-msg').keypress(function (e) {
    if (e.keyCode == 13 && $(this).val().length) {
      var _val = $(this).val();
      var _class = $(this).attr('class');
      $(this).val('');
      var _tar = $('.chat_wrap .inner').append(
        '<div class="item ' +
          _class +
          '"><div class="box"><p class="msg">' +
          _val +
          '</p><span class="time">' +
          currentTime() +
          '</span></div></div>'
      );

      var lastItem = $('.chat_wrap .inner').find('.item:last');
      setTimeout(function () {
        lastItem.addClass('on');
      }, 10);

      var position =
        lastItem.position().top + $('.chat_wrap .inner').scrollTop();
      console.log(position);

      $('.chat_wrap .inner').stop().animate({ scrollTop: position }, 500);
    }
  });
});

var currentTime = function () {
  var date = new Date();
  var hh = date.getHours();
  var mm = date.getMinutes();
  var apm = hh > 12 ? '오후' : '오전';
  var ct = apm + ' ' + hh + ':' + mm + '';
  return ct;
};

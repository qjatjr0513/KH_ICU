$().ready(function () {
  $('#alertStart').click(function () {
    Swal.fire({
      icon: 'success',
      title: 'Alert가 실행되었습니다.',
      text: '이곳은 내용이 나타나는 곳입니다.',
    });
  });
});

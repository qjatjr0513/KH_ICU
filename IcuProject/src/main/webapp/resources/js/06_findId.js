let findPwdBtn = document.querySelector('.findPwdBtn');
let findIdBtn = document.querySelector('.findIdBtn');
let findIdBox = document.querySelector('#findIdBox');
let findPwdBox = document.querySelector('#findPwdBox');

findPwdBtn.addEventListener('click', () => {
  findIdBtn.style.backgroundColor = 'var(--color-orange)';
  findIdBtn.style.opacity = '0.3';

  findPwdBtn.style.backgroundColor = 'var(--color-orange)';
  findPwdBox.style.display = 'block';
  findPwdBtn.style.opacity = '1';
  findIdBox.style.display = 'none';
});

findIdBtn.addEventListener('click', () => {
  findPwdBtn.style.opacity = '0.3';
  findIdBox.style.display = 'block';
  findIdBtn.style.opacity = '1';
  findPwdBox.style.display = 'none';
});

$().ready(function () {
  $('#btnAlert').click(function () {
    Swal.fire({
      icon: 'success',
      title: '비밀번호가 변경되었습니다.',
      text: '로그인 화면으로 이동합니다.',
    });
  });
});

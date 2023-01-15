'use strict';

// 모바일 화면에서 토글 버튼
// const navbarToggleBtn = document.querySelector('.navbar__toggle-btn');
// navbarToggleBtn.addEventListener('click', () => {
//   navbarMenu.classList.toggle('open');
// });

// 스크롤이 되면 home 을 점점 투명하게
const home = document.querySelector('.jong');
const homeHeight = home.getBoundingClientRect().height;
const point = document.querySelector('.jong2');
const pointHeight = point.getBoundingClientRect().height;
const info = document.querySelector('.jong3');
const infoHeight = info.getBoundingClientRect().height;

document.addEventListener('scroll', () => {
  home.style.opacity = 4.3 - window.scrollY / homeHeight;

  if (window.scrollY > pointHeight) {
    point.classList.add('animate__animated');
    point.classList.add('animate__fadeInUp');
  } else {
    point.classList.remove('animate__animated');
    point.classList.remove('animate__fadeInUp');
  }
});

document.addEventListener('scroll', () => {
  // console.log(window.scrollY / infoHeight);
  // console.log('window.scrollY : ' + window.scrollY);
  point.style.opacity = 3 - window.scrollY / pointHeight;

  if (window.scrollY / infoHeight > 2.3) {
    info.classList.add('animate__animated');
    info.classList.add('animate__fadeInUp');
  } else {
    info.classList.remove('animate__animated');
    info.classList.remove('animate__fadeInUp');
  }
});

// 코드의 반복 줄여봄.
function scrollIntoView(selector) {
  const scrollTo = document.querySelector(selector);
  scrollTo.scrollIntoView({ behavior: 'smooth' });
}

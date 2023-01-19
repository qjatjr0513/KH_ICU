let dramaBtn = document.querySelector('.dramaBtn');
let movieBtn = document.querySelector('.movieBtn');
let moiveBox = document.querySelector('#party__container');
let dramaBox = document.querySelector('#party__container2');

dramaBtn.addEventListener('click', () => {
  movieBtn.style.backgroundColor = 'var(--color-orange)';
  movieBtn.style.opacity = '0.3';

  dramaBtn.style.backgroundColor = 'var(--color-orange)';
  dramaBox.style.display = 'block';
  dramaBtn.style.opacity = '1';
  moiveBox.style.display = 'none';
});

movieBtn.addEventListener('click', () => {
  dramaBtn.style.opacity = '0.3';
  moiveBox.style.display = 'block';
  movieBtn.style.opacity = '1';
  dramaBox.style.display = 'none';
});

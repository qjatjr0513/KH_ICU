'use strict';

let lastParty = document.querySelector('.lastParty');
let makeParty = document.querySelector('.makeParty');
let makePartyBox = document.querySelector('#makePartyBox');
let lastPartyBox = document.querySelector('#lastPartyBox');

lastParty.addEventListener('click', () => {
  makeParty.style.backgroundColor = 'var(--color-orange)';
  makeParty.style.opacity = '0.3';
  lastParty.style.backgroundColor = 'var(--color-orange)';
  lastPartyBox.style.display = 'block';
  lastParty.style.opacity = '1';
  lastParty.style.boxShadow = '0 0 5px var(--color-orange)';
  makePartyBox.style.display = 'none';
});

makeParty.addEventListener('click', () => {
  lastParty.style.opacity = '0.3';
  makePartyBox.style.display = 'block';
  makeParty.style.opacity = '1';
  makeParty.style.boxShadow = '0 0 5px var(--color-orange)';
  lastPartyBox.style.display = 'none';
});





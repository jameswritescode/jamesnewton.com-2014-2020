$(function() {
  $('.js-typed').typed({
    strings:   ['a cat owner', 'a wantrepreneur', 'a tamagotchi', 'a musician',
                'a habitual line stepper', 'a drummer', 'an emoji enthusiast',
                'a software developer'],
    backDelay: 1000
  });
});

// TIP: B A
var secret = '38384040373937396665',
    input  = '',
    konamis = [greatBattleOfCat, justDOIT],
    timer;

function greatBattleOfCat() {
  alert('Nyan Cat vs. Tac Nayn');
}

function justDOIT() {
  alert('JUST DO IT');
}

function checkInput() {
  if (input.indexOf(secret) > -1) {
    konamis[Math.floor(Math.random() * konamis.length)]();
  }
}

$(document).keyup(function(e) {
  input += e.which;

  clearTimeout(timer);

  timer = setTimeout(function() {
    input = ''
  }, 500);

  checkInput();
});

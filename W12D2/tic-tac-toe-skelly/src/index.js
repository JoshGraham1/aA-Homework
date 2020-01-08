const View = require('./ttt-view.js');
const Game = require('./game.js');

  $(() => {
    const game =  new Game();
    const $mainEl = $('.ttt');
    const view = new View(game, $mainEl);
    view.bindEvents();
  });

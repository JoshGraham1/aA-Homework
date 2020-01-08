class View {
  constructor(game, $el) {
    this.game = game;
    this.player = 'x';
    this.theBoard = $el;
    $el.append(this.setupBoard());
  }

  bindEvents() {
    $('ul').on('click', 'li', (e) => {
      let $target = $(e.target)
      this.makeMove($target);
    });
  }

  makeMove($square) {
    if (!this.game.isOver()) {
      if ($square.hasClass('x') || $square.hasClass('o')) {
        alert('NO DONT DO THAT');
      } else {
        if (this.player === 'x') {
          $square.addClass('x');
          this.player = 'o';
        } else {
          $square.addClass('o');
          this.player = 'x';
        }
        this.game.playMove([$square.data('x'), $square.data('y')]);
        if (this.game.isOver()) {
          let $board = this.theBoard;
          this.notifyWinner($board);
        }
      }
    }
  }

  notifyWinner($board) {
    let $notif = $('<div class="winner-flash">').html(`${this.game.winner()}, beat yo ass!!`);
    return $board.append($notif);
  }

  setupBoard() {
    let $ul = $("<ul class=\"board\">");
    for (let i = 0; i < 9; i++) {
      let x_coord = Math.floor(i / 3);
      let y_coord = i % 3;
      $ul.append(
        this.newItem()
          .addClass("square")
          .attr('data-x', x_coord)
          .attr('data-y', y_coord)
      );
    }
    return $ul;
  }

  newItem() {
    return $(document.createElement("li"));
  }
}

module.exports = View;

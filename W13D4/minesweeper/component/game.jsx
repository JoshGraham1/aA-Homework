import React from "react"
import * as Minesweeper from "../minesweeper"
import Board from './board'
import Modal from './modal';

class Game extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      board: new Minesweeper.Board(9, 10)
    }
    this.restartGame = this.restartGame.bind(this);
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, flag) {
        if(flag) {
          tile.toggleFlag();
        } else {
          tile.explore();
        }
    this.setState({board: this.state.board})
  }

  restartGame() {
    this.setState({board: new Minesweeper.Board(9, this.state.board.numBombs + 1)})
  }

  render() {
    if (this.state.board.won()) {
        return (
            <div>
                <Board board={this.state.board} updateGame={this.updateGame} />
                <Modal future="won" restartGame={this.restartGame} />
           </div>
        )
    } else if (this.state.board.lost()) {
        return (
            <div>
                <Board board={this.state.board} updateGame={this.updateGame} />
            <Modal future="lost" restartGame={this.restartGame}/>
            </div>
        )        
    } else {
        return (
          <div>
              <Board board={this.state.board} updateGame={this.updateGame} />
          </div>
        )
    }
  }
}
export default Game
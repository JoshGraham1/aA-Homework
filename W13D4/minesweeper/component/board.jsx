import React from "react";
import Tile from "./tile";

class Board extends React.Component {
    constructor(props) {
        super(props);
        this.row = this.row.bind(this);
    }

    tile(row, idx) {
      const board = this.props.board;
      return row.map((tile, idx2) => {
        return <Tile tile={tile} updateGame={this.props.updateGame} key={idx2} />
      }) 
    }

    row() {
   
      const board = this.props.board;
      return board.grid.map( (row, idx) => {
        return <div className="row" key={idx}>{ this.tile(row, idx) }</div>
      })
    }

    render() {
      return <div className="board">{ this.row() }</div>
    }
    
}

export default Board;
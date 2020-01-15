import React from "react";
import ReactDOM from "react-dom";
import Game from './component/game';
// import Board from './component/board';
// import Tile from './component/tile';
document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById('main');
  ReactDOM.render(<Game />, main );
})
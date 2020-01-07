const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js")
window.Asteroid = Asteroid;
window.MovingObject = MovingObject;

document.addEventListener("DOMContentLoaded", function (){
  const canvas = document.getElementById("game-canvas"); //canvas??
  const ctx = canvas.getContext("2d");
  window.ctx = ctx;
  canvas.width = 500;
  canvas.height = 500;
  // const mo = new MovingObject({
  //   pos: [30, 30],
  //   vel: [10, 10],
  //   radius: 5,
  //   color: "#00FF00"
  // });
  // mo.draw(ctx);
  // mo.move();
  // mo.draw(ctx);
});


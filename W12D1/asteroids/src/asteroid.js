const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

Util.inherits(Asteroid, MovingObject);

function Asteroid (options) {
  options.color = "#527475";
  options.radius = 4;
  options.vel = Util.randomVec(3);

  MovingObject.call(this, options);
}

module.exports = Asteroid;
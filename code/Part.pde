// Draws one segment of the flower

class Part {

  float force, velocity, angle, mass, SpringConstant, resistance, lengthSegment;

  Part () {
    mass = 1;
    resistance = 0.35; // resistance
    lengthSegment = 10;
    SpringConstant = 4;    // how strong the spring is
  }

  void update (float v, float f) {
    velocity += (f-force)/mass; // giving the velocity an acceleration
    float newVelocity = velocity - v;
    angle += newVelocity; // adjusting the angle
    float T = 1/SpringConstant * angle; 
    float F = resistance * newVelocity;
    force = F + T; // counting the total force
  }

  void render () {
    rotate(angle);
    //line(0, 0, 0, -lengthSegment);
    translate(0, -lengthSegment);
  }
}

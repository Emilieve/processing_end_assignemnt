class Part {
  float force, velocity, angle, mass, SpringConstant, resistance, lengthSegment;

  Part () {
    mass = 10;
    resistance = 0.5;
    lengthSegment = 10;
    SpringConstant = 1;
  }

  void update (float v, float f) {
    velocity += (f-force)/mass;
    float newVelocity = velocity - v;
    angle += newVelocity;
    float T = 1/SpringConstant * angle;
    float F = resistance * newVelocity;
    force = F + T;   
  }

  void render () {
    rotate(angle);
    translate(0, -lengthSegment);
    
    
  }
}

// A simple Particle class

class Bubble {
  PImage bellImage;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Bubble(PVector dustPos) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = dustPos.copy();
    lifespan = 80.0;
    bellImage = loadImage("bell.svg.png");
    bellImage.resize(10,10);
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    noStroke();
    fill(255, lifespan);
    image(bellImage, position.x, position.y);
    //ellipse(position.x, position.y, 12, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

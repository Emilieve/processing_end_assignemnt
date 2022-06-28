class Bubble {
  //PImage bellImage= loadImage("bell.svg.png");
  PVector position, velocity, acceleration;
  int lifespan;
   

  Bubble(PVector bubblesPosition) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = bubblesPosition.copy();
    lifespan = 80;
    
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1;
  }

  // Method to display
  void display() {
    noStroke();
    fill(255, lifespan);
    circle(position.x, position.y, 10);
  }

  // Is the particle still useful?
  boolean isDead() {
    return(lifespan < 0);
  }
}

class Duck {
  Perlinwave wave;
  PImage duckImage;
  int duckLocation;
  float duckHeight;
  int mouseXPosition, mouseYPostion;
  Part[] part;
  int duckIndex;
  int bubblesRan = 0;
  int duckOffset = -30;

  Duck(int duckLocation, Perlinwave perlinWave) {
    duckImage = loadImage("Images/Duck.png");
    wave = perlinWave;
    this.duckLocation = duckLocation;
  }

  void update() {
    part = gameHandler.massDamperSystem.part;
    duckHeight = wave.yCoordinates[duckLocation-1];
    duckFall();
  }

  void display() {
    pushMatrix();
    translate(duckLocation, duckHeight + duckImage.height/2);
    for (int i = 0; i < part.length; i++) {
      if (i == part.length-1) {
        imageMode(CORNER);
        image(duckImage, -duckImage.width/2, -duckImage.height + duckOffset); //-duckImage.width to make good for the translation and is in corner mode
      } else {
        part[i].render();
      }
    }
    popMatrix();
  }

  void display2() {
    image(duckImage, duckLocation -duckImage.width/2, duckHeight -duckImage.height/2 + duckOffset - 25); //-duckImage.width to make good for the translation and is in corner mode
  }

  void duckFall() {
    if (hitImage()) {
      gameHandler.massDamperSystem.wind = 0.02;
      gameHandler.obstacle.diving(mouseXPosition, mouseYPostion);
      bubblesRan = bubblesRan +1;

      gameHandler.flock.bubbles.update(); //also show bubbles!
    }
  }

  boolean hitImage() {
    return(
      mouseXPosition >= duckLocation - duckImage.width/2 &&
      mouseXPosition <= duckLocation + duckImage.width/2 &&
      mouseYPostion >= duckHeight - duckImage.height/2 + duckOffset &&
      mouseYPostion <= duckHeight + duckImage.height/2 - duckOffset);
  }

  void mousePressedEventHandler(int mouseXPosition, int mouseYPostion) {
    this.mouseXPosition = mouseXPosition;
    this.mouseYPostion = mouseYPostion;
  }
}

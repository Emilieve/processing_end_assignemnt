class Background {
  int offset = -600;
  int step = 1;
  int imageHeight = -150;
  
  PImage backgroundImage;
  PImage cloudImage;

  Background() {
    backgroundImage = loadImage("Background.png");
    cloudImage = loadImage("Clouds.png");
  }

  void display() {
    image(backgroundImage, 0, 0);
    image(cloudImage, offset, imageHeight);
  }

  void update() {
    offset = offset+step;
    if (offset >= width + 300 || offset <= -1000) {
      step=-step;
    }
  }
}

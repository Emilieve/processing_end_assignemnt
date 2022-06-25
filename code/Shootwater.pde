class Shootwater {
  float originalDiameter = 1;
  int standardDeviation = 50;
  boolean shooting = false;
  float diameter= originalDiameter;
  float x = randomGaussian();
  float y = randomGaussian();
  float xPos = (x * standardDeviation*diameter) + mouseX;
  float yPos = (y * standardDeviation*diameter) + mouseY;
  float distanceToCenter = sqrt(sq(abs(xPos-(width/2))) + sq(abs(yPos-(height/2))) );
  float meanSize = sqrt(sq(width) + sq(height));
  float s = randomGaussian();
  float radius = (s*random(0, diameter*.4)) + meanSize*random(0, diameter*.4);
  int mean = width/2;
  
  Shootwater() {
    
  }
  
  void display() {
    if (mousePressed) {
      duck.duckfall();
      for (int i = 0; i < 500; i = i+1) {

        fill(0, 100, 230);
        noStroke();
        x = randomGaussian();
        y = randomGaussian();
        xPos = (x * standardDeviation*diameter) + mouseX;
        yPos = (y * standardDeviation*diameter) + mouseY;
        meanSize = (meanSize - distanceToCenter) / 20;
        distanceToCenter = sqrt(sq(abs(xPos-(width/2))) + sq(abs(yPos-(height/2))) );
        meanSize = sqrt(sq(width) + sq(height));

        s = randomGaussian();
        meanSize = (meanSize - distanceToCenter) / 20;

        radius = (s*random(0, diameter*.4)) + meanSize*random(0, diameter*.4);
        diameter=diameter-.0001;

        circle(xPos, yPos, radius);
      }
    } else {
      diameter=originalDiameter;
      obstacle.diving(0,0);
    }
  }
}

class Shootwater {
  boolean shooting;
  float originalDiameter, diameter, x, y, xPos, yPos, distanceToCenter, meanSize, s, radius;
  int mean, standardDeviation;

  Shootwater() {
    originalDiameter = 1; //Diameter of the water particles before they are scaled
    standardDeviation = 50;  //How close are the particles tohether before they are scaled
    shooting = false;     //Is the duck being shot?
    diameter = originalDiameter;
    x = randomGaussian(); 
    y = randomGaussian();
    xPos = (x * standardDeviation*diameter) + mouseX;
    yPos = (y * standardDeviation*diameter) + mouseY;
    distanceToCenter = sqrt(sq(abs(xPos-(width/2))) + sq(abs(yPos-(height/2))) );
    meanSize = sqrt(sq(width) + sq(height));
    s = randomGaussian();
    radius = (s*random(0, diameter*.4)) + meanSize*random(0, diameter*.4);
    mean = width/2;
  }

  void run() {
   
    if (mousePressed) {
      display();
    } else {
      diameter=originalDiameter;
    }
  }

 

  void display() {
  
for (int i = 0; i < gameHandler.particlesAmount; i++) {
      fill(0, 100, 230);
      noStroke();
      x = randomGaussian();
      y = randomGaussian();
      xPos = (x * standardDeviation*diameter) + mouseX;
      yPos = (y * standardDeviation*diameter) + mouseY;
      meanSize = (meanSize - distanceToCenter) / 20;
      distanceToCenter = sqrt(sq(abs(xPos-(width/2))) + sq(abs(yPos-(height/2))) );
    //Creating a distance to thec enter and drawing the circles there. (Based on the random variables) 
      meanSize = sqrt(sq(width) + sq(height));
    //random gausian distribution 
      s = randomGaussian();
      meanSize = (meanSize - distanceToCenter) / 20;

      radius = (s*random(0, diameter*.4)) + meanSize*random(0, diameter*.4);
      diameter-= 0.0004; //Decreasing the value of the diameter to make it appear that it is getting further 
    }
  }
}

class Perlinwave {

  //set variables for the perlinwave
  float yoff = 0.0;
  float yincrement = 0.01;
  int width = 940; //maybe this can be done smarter
  float[] yCoordinates = new float[width];

  Perlinwave() {
    for (int i = 0; i < yCoordinates.length-1; i++) {
      yCoordinates[i] = noise(yoff)*height;
      yoff += yincrement; //changing yoff by the increment so that the next y coordinate is not based on the same yoff value
    }
  }

  void update() {

    //duck.perlinwaveheight(perlinwave.height1, perlinwave.height2, perlinewave.height3);

    stroke(#3997F7); //stroke for the perlin wave where inside the brackets is the color

    //moving all the coordinated one to the left to get the illusion of a moving wave
    yCoordinates[0] = yCoordinates[1]; //since it is 0 we need to do it manually
    for (int i = 1; i < yCoordinates.length-1; i++) {
      yCoordinates[i] = yCoordinates[i+1];
    }
    yCoordinates[yCoordinates.length-1] = noise(yoff)*height; //creating a new y coordinate for the last y coordinate

    yoff += yincrement; //adjusting the yoff to get a new y coordinate in the next update
  }

  void display() {
    for (int i = 1; i < yCoordinates.length-1; i++) {
      line(i-1, yCoordinates[i-1], i, yCoordinates[i]);
    }
  }
}

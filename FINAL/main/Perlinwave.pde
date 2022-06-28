class Perlinwave {

  float yoff, yincrement;
  float[] yCoordinates;

  Perlinwave() {
    yoff = 1;
    yincrement = 0.0025;
    yCoordinates = new float[width];

    for (int i = 0; i < yCoordinates.length; i++) {
      yCoordinates[i] = map(noise(yoff), 0, 1, 500, 700);
      yoff += yincrement; //changing yoff by the increment so that the next y coordinate is not based on the same yoff value
    }
  }

  void update() {

    yoff += yincrement;

    for (int i = 0; i < width-1; i++) {
      yCoordinates[i] = yCoordinates[i+1];
    }

    yCoordinates[width-1] = map(noise(yoff), 0, 1, 500, 700);
  }

  void display() {

    fill(255, 255, 255);
    noStroke();

    beginShape();
    vertex(0, height);

    for (int i = 0; i < width-1; i++) {
      vertex(i, yCoordinates[i]-10);
      vertex(i+1, yCoordinates[i+1]-10);
    }

    vertex(width, height);
    endShape(CLOSE);

    fill(#3997F7);

    beginShape();
    vertex(0, height);

    for (int i = 0; i < width-1; i++) {
      vertex(i, yCoordinates[i]);
      vertex(i+1, yCoordinates[i+1]);
    }

    vertex(width, height);
    endShape(CLOSE);
  }
}

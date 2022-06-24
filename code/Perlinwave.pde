class Perlinwave {

  //set variables for the perlinwave
  float yoff = 1;
  float yincrement = 0.0025;
  float[] yCoordinates = new float[width];
  float waveheight1;
  float waveheight2;

  Perlinwave() {
    for (int i = 0; i < yCoordinates.length; i++) {
      yCoordinates[i] = map(noise(yoff),0,1,500,700);
      yoff += yincrement; //changing yoff by the increment so that the next y coordinate is not based on the same yoff value
    }
  }

  void update(int locationduck1, int locationduck2) {
    
    //adjusting the yoff to get a new y coordinate in the next update
    yoff += yincrement;
    
    //duck.perlinwaveheight(perlinwave.height1, perlinwave.height2, perlinewave.height3);

    //moving all the coordinated one to the left to get the illusion of a moving wave
    for (int i = 0; i < width-1; i++) {
      yCoordinates[i] = yCoordinates[i+1];
    }
    
    //creating a new y coordinate for the last y coordinate
    yCoordinates[width-1] = map(noise(yoff),0,1,500,700);
    
    waveheight1 = yCoordinates[locationduck1];
    waveheight2 = yCoordinates[locationduck2];
    
    
  }

  void display() {
    
     fill(255,255,255);
    noStroke();
    
    beginShape(); 
    vertex(0, height);
    
    for (int i = 0; i < width-1; i++) {
      vertex(i, yCoordinates[i]-10);
      vertex(i+1, yCoordinates[i+1]-30);
    }
    
    vertex(width, height);
    endShape(CLOSE);
    
    fill(#3997F7);
    noStroke();
    
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

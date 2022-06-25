class Duck {
  PImage duckImage;
  int ducklocation1;
  int duckloaction2;
  float duckheight1;
  float duckheight2;
  Part[] part;

  Duck(int locationduck1, int locationduck2) {
    duckImage = loadImage("Duck.png");
    imageMode(CENTER);
    ducklocation1 = locationduck1;
    duckloaction2 = locationduck2;
  }

  void update(PVector fishes_location) {
    //fishes.duckdiving(duck_diving);
  }

  void display(float waveheight1, float waveheight2) {
    part = massdampersystem.part;
    duckheight1 = waveheight1;
    //circle(duckImage.width/2, duckheight1, 25);
    duckheight2 = waveheight2;
    //circle(duckImage.width/2, duckheight2, 25);


    //image(duckImage, ducklocation1 - duckImage.width/2, duckheight1+30); //+30 to create a buffer at the bottom so that it is not sometimes accidentally above the water at a steep wave
    image(duckImage, ducklocation2, duckheight2 - 150); //duckImage.width/2 > because we want the center of the duck to be synchronised with the water


    pushMatrix(); //rotating

    
    translate(ducklocation1, duckheight1 +0);
    //setup the flower in the screen on the bottom
    for (int i = 0; i < part.length; i++) {
      if (i == part.length -1 ) //add image of the flower to the rear part
      {
        imageMode(CORNER);
        image(duckImage, -duckImage.width/2, -170);
        //println("dsdd:");
      } else {
        part[i].render();   // render everything!
        //println("moving");
      }
    }
    popMatrix(); //getting the matrix back to normal
    //circle(ducklocation1, duckheight1, 35);
  }
  

  void duckfall() {
    boolean hit = hitImage(mouseX, mouseY, ducklocation1, ducklocation2, duckheight1, duckheight2, duckImage.width, duckImage.height);
    if (hit) {
      massdampersystem.wind = 0.02;
      obstacle.diving(mouseX, mouseY);
     
    }
   // println("duckX " + ducklocation1 + " + " + "duckY " + duckheight1 + " + " + "width " + duckImage.width + " + " + "height " + duckImage.height + " + " + "mousex " + mouseX + "mouseY " + mouseY);
  }

  boolean hitImage(float mouseposX, float mouseposY, float imagelefttopX, float duck2lefttopX, float imagelefttopY, float duck2lefttopY, float imageWidth, float imageHeight) {
    if (
      (mouseposX >= imagelefttopX &&
      mouseposX <= imagelefttopX + imageWidth &&
      mouseposY >= imagelefttopY -200 && //200 as a buffer > hitting the top top does not work
      mouseposY <= imagelefttopY-200 + imageHeight) ||
      (mouseposX >= duck2lefttopX &&
      mouseposX <= duck2lefttopX + imageWidth &&
      mouseposY >= (duck2lefttopY -200) && //200 as a buffer > hitting the top top does not work
      mouseposY <= (duck2lefttopY-200) + imageHeight)
      ) { //imageHeight/2 bc should hit the duck not the stick
      return true;
    }
    return false;
  }
}

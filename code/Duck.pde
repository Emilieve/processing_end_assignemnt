class Duck {
  PImage duckImage;
  int ducklocation1;
  int duckloaction2;
  float duckheight1;
  float duckheight2;
  Part[] part;

  Duck(int locationduck1, int locationduck2) {
    duckImage = loadImage("Duck.png");

    ducklocation1 = locationduck1;
    duckloaction2 = locationduck2;
  }

  void update(PVector fishes_location) {
    //fishes.duckdiving(duck_diving);
  }

  void display(float waveheight1, float waveheight2) {
    imageMode(CENTER);
    part = massdampersystem.part;
    duckheight1 = waveheight1;
    //circle(duckImage.width/2, duckheight1, 25);
    duckheight2 = waveheight2;
    //circle(duckImage.width/2, duckheight2, 25);


    //image(duckImage, ducklocation1 - duckImage.width/2, duckheight1+30); //+30 to create a buffer at the bottom so that it is not sometimes accidentally above the water at a steep wave
    //image(duckImage, ducklocation2, duckheight2 - 70); //-70 so the duck is "in" the water


    pushMatrix(); //rotating


    translate(ducklocation1, duckheight1 + duckImage.height/2);
    //setup the flower in the screen on the bottom
    for (int i = 0; i < part.length; i++) {
      if (i == part.length -1 ) //add image of the flower to the rear part
      {
        imageMode(CORNER);
        image(duckImage, -duckImage.width/2, -duckImage.height); //-duckImage.width to make good for the translation and is in corner mode
      } else {
        part[i].render();   // render everything!
      }
    }
    popMatrix(); //getting the matrix back to normal

    pushMatrix(); //rotating

    translate(ducklocation2, duckheight2 + duckImage.height/2);
    //setup the flower in the screen on the bottom
    for (int i = 0; i < part.length; i++) {
      if (i == part.length -1 ) //add image of the flower to the rear part
      {
        imageMode(CORNER);
        image(duckImage, -duckImage.width/2, -duckImage.height); //-duckImage.width to make good for the translation and is in corner mode
      } else {
        part[i].render();   // render everything!
      }
    }
    popMatrix(); //getting the matrix back to normal
  }


  void duckfall() {
    boolean hit = hitImage(mouseX, mouseY, ducklocation1, ducklocation2, duckheight1, duckheight2, duckImage.width, duckImage.height);
    if (hit) {
      massdampersystem.wind = 0.02;
      obstacle.diving(mouseX, mouseY);
      bubbles.update(); //also show bubbles!
    }
    println("duckX " + ducklocation1 + " + " + "duckY " + duckheight1 + " + " + "width " + duckImage.width + " + " + "height " + duckImage.height + " + " + "mousex " + mouseX + "mouseY " + mouseY);
  }

  boolean hitImage(float mouseposX, float mouseposY, float duck1centerX, float duck2centerX, float duck1centerY, float duck2centerY, float imageWidth, float imageHeight) {
    if (
      (mouseposX >= duck1centerX - imageWidth/2 &&
      mouseposX <= duck1centerX + imageWidth/2 &&
      mouseposY >= duck1centerY - imageHeight/2 && //15 as a buffer > hitting the top top does not work
      mouseposY <= duck1centerY + imageHeight/2) ||
      (mouseposX >= duck2centerX - imageWidth/2 &&
      mouseposX <= duck2centerX + imageWidth/2 &&
      mouseposY >= duck2centerY - imageHeight/2 && //15 as a buffer > hitting the top top does not work
      mouseposY <= duck2centerY + imageHeight/2)
      ) { //imageHeight/2 bc should hit the duck not the stick
      return true;
    }
    return false;
  }
}

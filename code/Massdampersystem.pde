class Massdampersystem {

  // this class brings all the parts of the flower into one

  float wind;
  PImage image;
  Part[] part = new Part[20]; //adding new parts

  Massdampersystem () {
    for (int i = 0; i < part.length; i++) {
      part[i] = new Part(); // creating the parts
    }
    image = loadImage("Duck.png");
    //image = duck.duckImage;
    image.resize(100, 100); // resizing the flower img
  }

  void update () {
    for (int i = 0; i < part.length; i++) { //loop funciton for updating
      if (i == 0) {
        part[i].update(0, part[i+1].force + wind); // velocity = 0 > there is not a part bellow here
      } else if (i == part.length -1 ) {
        part[i].update(part[i-1].velocity, wind); // only for the latest one since there is no force after which you can provide
      } else {
        part[i].update(part[i-1].velocity, part[i+1].force + wind);
      }
    }
    wind = 0;
  }

  void show () { //showing t on the canvas
    //translate(mouseX, mouseY); //setup the flower in the screen on the bottom
    //pushMatrix(); //rotating
    //for (int i = 0; i < part.length; i++) {
    //  if (i == part.length -1 ) //add image of the flower to the rear part
    //  {
    //    image(image, -50, -50);
    //    println("dsdd:");
    //  } else {
    //    part[i].render();   // render everything!
    //    println("moving");
    //  }
    //}
    //popMatrix(); //getting the matrix back to normal
  }
}

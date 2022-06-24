class Duck {
  PImage duckImage;
  int ducklocation1;
  int duckloaction2;
  int duckheight1;

  Duck(int locationduck1, int locationduck2) {
    duckImage = loadImage("Duck.png");
    ducklocation1 = locationduck1;
    duckloaction2 = locationduck2;
  }

  void update(PVector fishes_location) {
    //fishes.duckdiving(duck_diving);
  }

  void display(float waveheight1, float waveheight2) {
    float duckheight1 = waveheight1 - duckImage.height;
    float duckheight2 = waveheight2 - duckImage.height;
    image(duckImage, ducklocation1 - duckImage.width/2, duckheight1+20); //+20 to create a buffer at the bottom so that it is not sometimes accidentally above the water at a steep wave
    image(duckImage, ducklocation2 - duckImage.width/2, duckheight2+20);
  }

  void duckfall() {
    boolean hit = hitImage(mouseX, mouseY, ducklocation1, duckheight1, duckImage.width, duckImage.height);
    if(hit){
      circle(0,0,100);
      print("oommgg");
    } 
    println("duckX" + ducklocation1 + " + " + "duckY" + duckheight1 + " + " + "width" + duckImage.width + " + " + "height" + duckImage.height + " + " + "mousex" + mouseX + "mouseY" + mouseY);
  }

  boolean hitImage(float mouseposX, float mouseposY, float imagelefttopX, float imagelefttopY, float imageWidth, float imageHeight) {
    if (
      mouseposX >= imagelefttopX &&
      mouseposX <= imagelefttopX + imageWidth &&
      mouseposY >= imagelefttopY &&
      mouseposY <= imagelefttopY + imageHeight ) {
      return true;
    }
    return false;
  }
}

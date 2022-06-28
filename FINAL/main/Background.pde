class Background {
  int offset, step, imageHeight;
  PImage backgroundImage, cloudImage; //loading background and cloud images 

  Background() {
    backgroundImage = loadImage("Images/Background.png"); //Loading Both images
    cloudImage = loadImage("Images/Clouds.png");

    offset = -600;    //Cloud Offset
    step = 1;            //Step for moving the clouds
    imageHeight = -150;    //Image cloud offset
  }

  void run() {
    update();
    display();
  }

  void display() {
    image(backgroundImage, 0, 0);                //Display Background Image
    image(cloudImage, offset, imageHeight);      //Display Cloud Image with changing x variables
  }

  void update() {
    offset = offset+step;
    if (offset >= width + 300 || offset <= -1000) {
      step = -step;                                            //Bouncing code for the Clouds, with offsets so that the clouds dissapear for some time. 
    }
  }
}
//Recieving the mouse pocitions from mouse clicked, and creating an obstacle from the fish there, close to the ducks

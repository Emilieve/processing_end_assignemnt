class Massdampersystem {
  float wind;
  PImage image;
  Part[] part = new Part[4];

  Massdampersystem () {
    for (int i = 0; i < part.length; i++) {
      part[i] = new Part(); // creating the partss
    }
    image = loadImage("Images/Duck.png");
    image.resize(100, 100);
  }

  void update () {
    for (int i = 0; i < part.length; i++) {
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
}

class DuckHandler {
  Perlinwave wave;
  ArrayList<Duck> ducks;
  int duckIndex;

  DuckHandler(Perlinwave perlinWave) {
    ducks = new ArrayList<Duck>();
    wave = perlinWave;
    ducks.add(new Duck(200, wave));
    ducks.add(new Duck(750, wave));
    ducks.add(new Duck(450, wave));
  }

  void run() {
    update();
    display();
  }

  void update() {
    for (Duck duck : ducks) {
      duck.update();
    }
  }

  void display() {
    for (Duck duck : ducks) {
      if (duck.hitImage())
        duck.display();
      else
        duck.display2();
    }
  }
}

class GameHandler {
  Perlinwave perlinWave;
  Background background;
  DuckHandler duckHandler;
  Shootwater shootWater;
  Massdampersystem massDamperSystem;
  Flock flock;
  Obstacle obstacle;

  PVector center;
  int particlesAmount;

  GameHandler() {
    particlesAmount = 100;
    perlinWave = new Perlinwave();
    background = new Background();
    shootWater = new Shootwater();
    duckHandler = new DuckHandler(perlinWave);
    massDamperSystem = new Massdampersystem();
    flock = new Flock();
    obstacle = new Obstacle();

    for (int i = 0; i < 30; i++) {
      Boid b = new Boid(width/2, height+20);
      flock.addBoid(b);
    }
  }

  void run() {
    imageMode(CORNER);
    background.run();
    duckHandler.run();
    perlinWave.update();
    perlinWave.display();
    shootWater.run();

    flock.run();
    massDamperSystem.update();
  }
  
  void mousePressedEvent(int mouseXPosition, int mouseYPostion) {
    for (Duck duck : duckHandler.ducks) {
      duck.mousePressedEventHandler(mouseXPosition, mouseYPostion);
    }
      obstacle.pressEvent();
  }
  
  
}

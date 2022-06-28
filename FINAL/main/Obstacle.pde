class Obstacle {
  PVector position;

  Obstacle() {
    position = new PVector (0, 0);
  }

  void diving(int positionX, int positionY) {
    position = new PVector(positionX, positionY + 100); //pvector the fishies will be scared of
  }

  void obstacleReset() {
    position = new PVector (0, 0);
  }

  void pressEvent() {
    for (Duck duck : gameHandler.duckHandler.ducks) {
      if (!duck.hitImage()) {
        gameHandler.obstacle.obstacleReset();
      }
    }
  }
}

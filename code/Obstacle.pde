class Obstacle {
  PVector position;
  Obstacle() {
    position = new PVector (0, 0);
  }

  void diving(int positionX, int positionY) {
    position = new PVector(positionX+70, positionY);
  }
}

class Obstacle {
  PVector position;
  Obstacle() {
    position = new PVector (200, 200);
  }

  void render() {
    square(position.x, position.y, 100);
  }
}

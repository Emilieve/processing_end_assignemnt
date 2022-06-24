Perlinwave perlinwave;
Background background;
Fishes fishes;
Duck duck;
Shootwater shootwater;
Flock flock;
Obstacle obstacle;
int ducklocation1 = 300;
int ducklocation2 = 600;

void setup() {
  size(940, 788);
  perlinwave = new Perlinwave();
  background = new Background();
  shootwater = new Shootwater();
  flock = new Flock();
  obstacle = new Obstacle();
  duck = new Duck(ducklocation1, ducklocation2);
  //for (int i = 0; i < 30; i++) {
  //  Boid b = new Boid(width/2, height/2);
  //  flock.addBoid(b);
  //}
  for (int i = 0; i < 30; i++) {
    Boid b = new Boid(width/2, height+20);
    flock.addBoid(b);
  }
}


void draw() {
  background.display();
  background.update();
  duck.display(perlinwave.waveheight1, perlinwave.waveheight2);
  perlinwave.update(ducklocation1, ducklocation2);
  perlinwave.display();
  shootwater.display();
  flock.run();
  //duck.update(fishes.location);

  //fishes.update();
  //fishes.display();
  //shootwater.display();
}

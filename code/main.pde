Perlinwave perlinwave;
Background background;
Fishes fishes;
Duck duck;
Shootwater shootwater;
Massdampersystem massdampersystem;
Flock flock;
Obstacle obstacle;
Bubble_System bubbles;
Bubble bubble;

int particlesAmount = 100;

PVector center;

int ducklocation1 = 250;
int ducklocation2 = 650;

void setup(){
  size(940,788);
  PVector startPosBubbles = new PVector (width, height);
  bubbles = new Bubble_System(startPosBubbles);
  perlinwave = new Perlinwave();
  background = new Background();
  shootwater = new Shootwater();
  duck = new Duck(ducklocation1, ducklocation2);
  massdampersystem = new Massdampersystem();
  flock = new Flock();
  obstacle = new Obstacle();
  //background.display();
  for (int i = 0; i < 30; i++) {
    Boid b = new Boid(width/2, height+20);
    flock.addBoid(b);
  }
}

void draw(){
  imageMode(CORNER);
  background.display();
  background.update();
  duck.display(perlinwave.waveheight1, perlinwave.waveheight2);
  perlinwave.update(ducklocation1, ducklocation2);
  perlinwave.display();
  shootwater.display();
  bubbles.run(); //always run the bubbles but only show when triggered
  

  flock.run();
  massdampersystem.update();
  massdampersystem.show();
  
  //duck.update(fishes.location);
  
  //fishes.update();
  //fishes.display();
  //shootwater.display();
}

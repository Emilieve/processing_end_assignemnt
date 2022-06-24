Perlinwave perlinwave;
Background background;
Fishes fishes;
Duck duck;
Shootwater shootwater;
Massdampersystem massdampersystem;

int ducklocation1 = 250;
int ducklocation2 = 650;

void setup(){
  size(940,788);
  perlinwave = new Perlinwave();
  background = new Background();
  shootwater = new Shootwater();
  duck = new Duck(ducklocation1, ducklocation2);
  massdampersystem = new Massdampersystem();
  //background.display();
}

void draw(){
  background.display();
  background.update();
  duck.display(perlinwave.waveheight1, perlinwave.waveheight2);
  perlinwave.update(ducklocation1, ducklocation2);
  perlinwave.display();
  shootwater.display();
  massdampersystem.update();
  massdampersystem.show();
  //duck.update(fishes.location);
  
  //fishes.update();
  //fishes.display();
  //shootwater.display();
}

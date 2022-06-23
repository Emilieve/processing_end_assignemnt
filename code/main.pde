Perlinwave perlinwave;
Background background;
Fishes fishes;
Duck duck;
Shootwater shootwater;

PImage backgroundImage;
PImage cloudImage;

void setup(){
  size(940,788);
  perlinwave = new Perlinwave();
  background = new Background();
  //background.display();
}

void draw(){
  background.display();
  background.update();
  perlinwave.update();
  perlinwave.display();
  //duck.update(fishes.location);
  //duck.display();
  //fishes.update();
  //fishes.display();
  //shootwater.display();
}

void mouseClicked(){
  //shootwater.shoot(mouse);
  //duck.shot(mouse);
}

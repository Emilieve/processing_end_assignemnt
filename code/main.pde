Perlinwave perlinwave;
Background background;
Fishes fishes;
Duck duck;
Shootwater shootwater;

void setup(){
  background.display();
}

void draw(){
  background.display();
  perlinwave.update();
  perlinwave.display();
  duck.update(fishes.location);
  duck.display();
  fishes.update();
  fishes.display();
  shootwater.display();
}

void mouseClicked(){
  shootwater.shoot(mouse);
  duck.shot(mouse);
}

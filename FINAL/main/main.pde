// Code by Emilie van Eps and Jorge Davo Sainz, using sample codes provided by Daniel Shiffman
//Perling Noise wave and Gaussian Distribution
//For algorithms Create Module 4

//Particles and flocking are both inspired by Daniel Shiffman.

GameHandler gameHandler;

void setup() {
  size(940, 788);
  gameHandler = new GameHandler();
  frameRate(100);
}

void draw() {
  gameHandler.run();
}

void mousePressed() {
  gameHandler.massDamperSystem = new Massdampersystem();
  gameHandler.mousePressedEvent(mouseX, mouseY);
}

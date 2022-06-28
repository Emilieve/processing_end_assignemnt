class Bubble_System {
  ArrayList<Bubble> bubbles;
  PVector bubblesPosition;
  
  
  Bubble_System(){
    bubbles = new ArrayList<Bubble>();
    bubblesPosition = new PVector(width, height);
  }
  
  void update(){
    
      bubbles.add(new Bubble(bubblesPosition));
      bubblesPosition = gameHandler.flock.boids.get(0).position;
    
  }
  
  void run(){
    for (int i = bubbles.size()-1; i >= 0; i--) {
      Bubble p = bubbles.get(i);
      p.run();
      if (p.isDead()) {
        bubbles.remove(i);
      }
    }
  }
  
  
}

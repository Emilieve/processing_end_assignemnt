class Bubble_System {
  ArrayList<Bubble> bubbles;
  PVector dustPos;
  
  
  Bubble_System(PVector wandPos){
    dustPos = wandPos.copy();
    bubbles = new ArrayList<Bubble>();
  }
  
  void update(){
    //dustPos = wandPos.copy();
    bubbles.add(new Bubble(dustPos));
  }
  
  void changeLoc(PVector newLoc){
    dustPos = newLoc;
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

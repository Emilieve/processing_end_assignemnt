class Flock {
  Bubble_System bubbles;
  ArrayList<Boid> boids;

  Flock() {
    bubbles = new Bubble_System();
    boids = new ArrayList<Boid>();
  }

  void run() {
    bubbles.run();
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
}

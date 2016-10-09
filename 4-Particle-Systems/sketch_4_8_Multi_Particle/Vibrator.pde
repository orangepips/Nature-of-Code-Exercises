class Vibrator extends Particle {
  float timeR = random(0, 1000);
  float timeB = random(0, 1000);
  float timeG = random(0, 1000);
  
  // We could add variables for only Confetti here if we so

  Vibrator(PVector l) {
    super(l);
    acceleration = PVector.random2D().mult(.1);
    velocity = PVector.random2D();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Override the display method
  void display() {
    int r = int(map(noise(timeR), -1, 1, 0, lifespan));
    int b = int(map(noise(timeB), -1, 1, 0, lifespan));
    int g = int(map(noise(timeB), -1, 1, 0, lifespan));
    timeR += .01;
    timeB += .01;
    timeG += .01;
    
    stroke(r, b, g, lifespan);
    fill(r, b, g, lifespan);
    position.add(PVector.random2D());
    ellipse(position.x,position.y,12,12);
  }
}
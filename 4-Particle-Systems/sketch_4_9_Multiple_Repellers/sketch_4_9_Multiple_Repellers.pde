// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ParticleSystem ps;
ArrayList<Repeller> repellers = new ArrayList<Repeller>();

void setup() {
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2,50));
  for (int i = 0; i < 3; i++) {
    repellers.add(new Repeller(width/2 + random(-75, 75), random(100, height-40)));  
  }  
}

void draw() {
  background(255);
  ps.addParticle();
  
  // Apply gravity force to all Particles
  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);
  
  for (Repeller repeller: repellers) {
    ps.applyRepeller(repeller);  
    repeller.display();
  }
  ps.run();
}
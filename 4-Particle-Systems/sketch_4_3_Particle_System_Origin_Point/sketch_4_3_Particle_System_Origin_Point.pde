// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ParticleSystem ps;
MouseParticleSystem mps;
RovingParticleSystem rps;

void setup() {
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2,50));
  mps = new MouseParticleSystem();
  rps = new RovingParticleSystem(new PVector(random(0, width), random(0, height))); 
}

void draw() {
  background(255);
  ps.addParticle();  
  ps.run();
  mps.addParticle();
  mps.run();
  rps.addParticle();
  rps.run();
}
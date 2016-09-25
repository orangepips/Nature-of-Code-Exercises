// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {    
    velocity = new PVector(random(-1, 1), random(-1, 0));
    position = l.get();
    lifespan = 255.0;
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void run() {
    acceleration = new PVector(0, 0.05);
    applyForce(new PVector(random(-.05, .05), random(-.05, .05)));
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(position.x, position.y, 12, 12);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
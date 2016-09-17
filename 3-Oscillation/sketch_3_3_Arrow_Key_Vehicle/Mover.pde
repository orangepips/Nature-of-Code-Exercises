// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration = new PVector(0,0);
  PVector arrow;
  float topspeed;

  float xoff, yoff;

  float r = 16;

  Mover() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    arrow = position.copy();
    topspeed = 10;
    xoff = 1000;
    yoff = 0;
  }

  void applyForce(PVector force) {
     acceleration.add(force);
  }

  void update() {    
    if (velocity.copy().add(acceleration).mag() <= topspeed) {
      velocity.add(acceleration);
    }
    position.add(velocity);
    println(velocity);
    acceleration.mult(0);
  }

  void display() {
    float theta = velocity.heading();

    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
    rectMode(CENTER);
    translate(position.x, position.y);
    rotate(theta);
    rect(0, 0, 30, 10);
    rect(10, 0, 3, 3);
    popMatrix();
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } 
    else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } 
    else if (position.y < 0) {
      position.y = height;
    }
  }
}
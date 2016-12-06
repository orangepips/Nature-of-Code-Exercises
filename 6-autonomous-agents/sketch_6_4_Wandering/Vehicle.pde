// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Seek_Arrive

// The "Vehicle" class

class Vehicle {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float cd = 50;    // circle diameter 
  float futureY;
  float time = 0;
  float incr = 0.003;
  float cir_theta;

  Vehicle(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,-2);
    position = new PVector(x,y);
    r = 6;
    maxspeed = 4;
    maxforce = 5;
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    checkEdges();
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void move() {    
    cir_theta = noise(time) * TWO_PI;    
    time += incr;
    
    PVector target = PVector.add(position, position.copy().normalize().mult(futureY));    
    target.add(new PVector(cos(cir_theta) * cd/2, sin(cir_theta) * cd/2));
    PVector desired = PVector.sub(target,position);  // A vector pointing from the position to the target
    
    // Scale to maximum speed
    desired.setMag(maxspeed);

    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    
    applyForce(steer);
  }
    
  void display() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);    
    futureY = -r*2 - velocity.mag() * 10;    
    line(0, r*2, 0, futureY);
    fill(255, 0, 0, 127);
    
    ellipse(0, futureY, cd, cd);
    PVector center = new PVector(0, futureY);
    float h = cd/2;
    //println(time, noise(time), cir_theta, cos(cir_theta) * h, sin(cir_theta) * h);    
    center.add(new PVector(cos(theta+cir_theta) * h, sin(theta+cir_theta) * h));
    line(0, futureY, center.x, center.y);    
    fill(255);
    ellipse(center.x, center.y, 5, 5);
    
    popMatrix();
  }
  
  void checkEdges() {
    if (position.x < 0) {
      position.x = width;       
    } else if (position.x > width) {
      position.x = 0;
    }
    
    if (position.y < 0) {
      position.y = height;
    } else if (position.y > height) {
      position.y = 0; 
    }    
  }
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Seek_Arrive

// The "Vehicle" class

abstract class Vehicle {
  
  color c = color(127); 
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

  Vehicle(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    position = new PVector(x,y);
    r = 6;
    maxspeed = 4;
    maxforce = 0.1;
  }

  // Method to update position
  void update() {
    checkEdges();
    println(this, position, velocity, acceleration);
    if (Double.isNaN(position.x)) {
      throw new RuntimeException();
    }
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  abstract void move(Vehicle other);
  
  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    println("seek > target:\t" + target);
    PVector desired = PVector.sub(target,position);  // A vector pointing from the position to the target
    
    // Scale to maximum speed
    desired.setMag(maxspeed);

    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    
    applyForce(steer);
  }
  
  void flee(PVector target) {
    PVector desired = PVector.sub(target,position).mult(-1);  // A vector pointing from the position away from the target
    
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
    fill(c);
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
    popMatrix();
  }
  
  void checkEdges() {
    if (position.x < 0) {
      position.x += width;       
    } else if (position.x > width) {
      position.x -= width;
    }
    
    if (position.y < 0) {
      position.y += height;
    } else if (position.y > height) {
      position.y -= height; 
    }
    
  }
}
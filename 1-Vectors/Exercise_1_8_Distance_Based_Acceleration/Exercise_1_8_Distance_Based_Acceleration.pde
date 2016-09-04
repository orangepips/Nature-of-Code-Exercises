// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A Mover object
Mover mover;

PVector longestDiagonal;

void setup() {
  size(640,360);
  mover = new Mover(); 
  longestDiagonal = PVector.sub(new PVector(0, 0), new PVector(width, height));
}

void draw() {
  background(255);
  
  // Update the position
  mover.update();
  // Display the Mover
  mover.display(); 
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  // The Mover tracks position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;

  Mover() {
    // Start in the center
    position = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topspeed = 10;
  }

  void update() {
    
    // Compute a vector that points from position to mouse
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,position);
    // Set magnitude of acceleration
    
    println(longestDiagonal.mag() + "\t" + acceleration.mag());
   
    acceleration.setMag(map(acceleration.mag()/longestDiagonal.mag(), 0, 1, topspeed, 0));
    
    println(acceleration.mag());
   
    //acceleration.setMag(0.2);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // position changes by velocity
    position.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x,position.y,48,48);
  }

}
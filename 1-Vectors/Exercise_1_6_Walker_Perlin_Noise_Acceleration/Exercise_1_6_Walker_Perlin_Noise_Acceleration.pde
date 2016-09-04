// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover mover;

void setup() {
  size(640,360);
  mover = new Mover(); 
}

void draw() {
  background(255);
  
  mover.update();
  mover.checkEdges();
  mover.display(); 
}  
  
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  float x = 0;
  float y = 100;
  float increment = .02;

  Mover() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 6;
  }

  void update() {
    //acceleration = PVector.random2D();
    //acceleration.mult(random(2));
    
    acceleration = new PVector(map(noise(x), 0, 1, -1, 1), map(noise(y), 0, 1, -1, 1));
    
    println("accelleration:\t" + acceleration);
    println("velocity:\t" + velocity);
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
    
    x += increment;
    y += increment; 
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x, position.y, 48, 48);
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
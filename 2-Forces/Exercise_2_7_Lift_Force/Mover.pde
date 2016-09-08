class Mover {
  // position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;

  // Mass is tied to size
  float mass;
  
  float _width;
  float _height;
  
  Mover(float m, float x, float y) {
    mass = m;
    _width = mass * 10;
    _height = mass * 3;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass 
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }

  void update() {
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // position changes by velocity
    position.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
  }

  // Draw Mover
  void display() {
    strokeWeight(2);
    stroke(255);
    fill(255);  
    ellipse(position.x, position.y, _width, _height); 
  }
  
  void checkEdges() {
    if(position.x + _width/2 >= width || position.y + _height/2 >= height) {
       noLoop(); 
    }
  }
}
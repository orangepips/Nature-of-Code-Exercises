class Piece {
  static final int SIDE = 30;
  
  PVector location;
  PVector velocity;
  float rotation = 0;
  float theta = 0; 
  
  Piece(PVector l) {
    location = l;
    velocity = new PVector();
  }
  
  void applyForce(PVector force) {
    velocity.add(force);
  }
  
  void applyRotation(float radians) {
    theta = radians; 
  }
  
  void update() {
    location.add(velocity);    
    rotation += theta;
  }
  
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(rotation);
    stroke(127);
    fill(127);
    rect(0, 0, Piece.SIDE, Piece.SIDE);    
    popMatrix();
  }
}
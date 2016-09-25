class Piece {
  int side = 30;
  
  PVector location;
  PVector velocity;
  float theta; 
  
  Piece(PVector l) {
    location = l;
  }
  
  void applyForce(PVector force) {
    
  }
  
  void update() {
  }
  
  void display() {
    stroke(0);
    fill(127);
    rect(location.x, location.y, side, side);
  }
  
  void run() {
  }
}
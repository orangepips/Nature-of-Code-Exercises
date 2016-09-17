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

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        mover.applyForce(new PVector(0, -1));
        break;
      case DOWN:
        mover.applyForce(new PVector(0, 1));
        break;
      case LEFT:
        mover.applyForce(new PVector(-1, 0));
        break;
      case RIGHT:
        mover.applyForce(new PVector(1, 0));
        break;
    }
  }
}
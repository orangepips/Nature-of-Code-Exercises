Spaceship spaceship;

void setup() {
  size(600, 600);
  spaceship = new Spaceship();
}

void draw() {
  background(255);
  spaceship.update();
  spaceship.checkEdges();
  spaceship.display();
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case LEFT:
        spaceship.counterclockwise();
        break;
      case RIGHT:
        spaceship.clockwise();
        break;
    }
  } else if (key == 'z') {
    spaceship.accelerate();
  } else if (key == ' ') {
    spaceship.applyForce(spaceship.velocity.copy().mult(-1)); 
  }
}
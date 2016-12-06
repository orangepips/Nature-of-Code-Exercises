// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Seeking "vehicle" follows the mouse position

// Implements Craig Reynold's autonomous steering behaviors
// One vehicle "seeks"
// See: http://www.red3d.com/cwr/

Vehicle v;

void setup() {
  size(640, 360);
  v = new Vehicle(width/2, height/2);
}

void draw() {
  background(255);

  // Draw an ellipse at the mouse position
  fill(200);
  stroke(0);
  strokeWeight(2);  

  // Call the appropriate steering behaviors for our agents
  v.move();
  v.update();
  v.display();
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// PolarToCartesian
// Convert a polar coordinate (r,theta) to cartesian (x,y):  
// x = r * cos(theta)
// y = r * sin(theta)
 
float r;
float theta;

void setup() {
  size(640, 360);
  // Initialize all values
  r = 0;
  theta = 0;
  
  background(255);
}

void draw() {
    
  // Translate the origin point to the center of the screen
  translate(width/2, height/2);
  
  // Convert polar to cartesian
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  // Draw the ellipse at the cartesian coordinate
  ellipseMode(CENTER);
  fill(0);
  stroke(0);
  strokeWeight(2);
  //line(0,0,x,y);
  ellipse(x, y, 24, 24);
  
  // Increase the angle over time
  theta += 0.02;
  r += 0.15;
  

}
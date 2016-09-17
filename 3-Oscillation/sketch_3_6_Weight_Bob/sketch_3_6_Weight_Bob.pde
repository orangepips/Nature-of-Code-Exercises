// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

void setup() {
  size(360,640);
}

void draw() {
  background(255);

  float period = 120;
  float amplitude = 300;
  // Calculating horizontal position according to formula for simple harmonic motion
  float y = map(sin(TWO_PI * frameCount / period), -1, 1, 0, amplitude);  
  stroke(0);
  strokeWeight(2);
  fill(127);
  translate(width/2, 24);
  line(0,0,0,y);
  ellipse(0,y,48,48);
}
PVector center;

void setup() {
  size(400, 400);
  center = new PVector(width/2, height/2);
}

void draw() {
  background(255);  
  drawArrowLine(TWO_PI);
  float rads = getMouseAngle();
  drawArrowLine(rads);
  fill(0);
  text(degrees(rads) + " degrees\n" + rads + " radians", 20, 360);
}

void drawArrowLine(float angle) {  
  //println("Angle:\t" + angle);
  stroke(0);  
  strokeWeight(5);
  pushMatrix();
  translate(center.x, center.y);
  rotate(-angle);
  line(0, 0, 100, 0);
  triangle(100, 0, 92, -6, 92, 6);  
  popMatrix();
}

float getMouseAngle() {
  PVector mouse = new PVector(mouseX, mouseY);
  println(mouse);
  float modifier = 0; // upper right
  float adjacent = mouse.x - center.x;
  if (mouse.x <= center.x && mouse.y <= center.y) {
    modifier = HALF_PI; // upper left
    adjacent = center.y - mouse.y;
    //println("Upper left");
  } else if (mouse.x <= center.x && mouse.y > center.y) {
    modifier = PI; // lower left
    adjacent = center.x - mouse.x;
    //println("Lower left");
  } else if (mouse.x > center.x && mouse.y > center.y) {
    modifier = PI + HALF_PI; // lower right
    adjacent = mouse.y - center.y;
    //println("Lower right");
  }      
  //if (modifier == 0) {
  //  //println("Upper right");
  //}
  
  float hypotenuse = dist(center.x, center.y, abs(mouse.x), abs(mouse.y));
  
  return acos(adjacent/hypotenuse) + modifier;  
}
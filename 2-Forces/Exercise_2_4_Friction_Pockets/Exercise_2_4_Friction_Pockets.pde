// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] movers = new Mover[5];
ForcePocket[] forcePockets = new ForcePocket[7];

void setup() {
  size(600, 600);
  //randomSeed(1);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 4), random(width), 0);
  }
  for (int i = 0; i < forcePockets.length; i++) {
    int w = int(random(50, 200));
    int h = int(random(50, 200));
    
    int x = int(random(width)); 
    int y = int(random(height)); 
    
    boolean isGreen = random(1) >= .5;
    float coeff = random(.25, .75) * (isGreen ? 1 : -1);
    color boxFill = isGreen ? color(0, 255, 0, map(coeff, .25, .75, 25, 75)) : color(255, 0, 0, map(coeff, -.25, -.75, 25, 75));
    forcePockets[i] = new ForcePocket(x, y, w, h, boxFill, coeff, .2);
  }
}

void draw() {
  background(255);  
  
  for (int i = 0; i < forcePockets.length; i++) {
    forcePockets[i].display(); 
  }
  
  for (int i = 0; i < movers.length; i++) {

    PVector wind = new PVector(0.01, 0);
    PVector gravity = new PVector(0, 0.1*movers[i].mass);

    float c = 0.05;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1); 
    friction.normalize();
    friction.mult(c);    

    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    for (int j = 0; j < forcePockets.length; j++) {
      forcePockets[j].checkForCollision(movers[i]); 
    }

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

class ForcePocket {
  // pocket position and dimensions 
  int x;
  int y;
  int w; 
  int h;
  
  color boxFill;
  
  float coeff;
  float multiplier;
  
  ForcePocket(int x, int y, int w, int h, color boxFill, float coeff, float multiplier) { 
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    this.boxFill = boxFill;
    
    this.coeff = coeff;
    this.multiplier = multiplier;
  }
  
  void checkForCollision(Mover mover) {
    if (!isCollidingCircleRectangle(mover.position.x, mover.position.y, mover.size/2, x, y, w, h)) {
      return;
    }
    println("Collision", mover.position, mover.size, x, y);
         
    PVector force = mover.velocity.get();
    force.mult(multiplier); 
    force.normalize();
    force.mult(coeff);
    mover.applyForce(force);
  }
  
  void display() {
    noStroke();
    fill(boxFill);
    rect(x, y, w, h);
  }
  
  /********************************************************
  isCollidingCircleRectangle()
     
    params:
     circleX - center x coordinate for circle
     circleY - center y coordinate for circle
     radius  - radius of circle
     rectangleX - top left corner X coordinate
     rectangleY - top left corner Y coordinate
     rectangleWidth - width of rectangle
     rectangleHeight - and the height
    
   returns boolean - whether the two shapes are colliding
    
   code adapted from:
     http://stackoverflow.com/questions/401847/circle-rectangle-collision-detection-intersection
   adapted by: Jonathan Cecil
  ********************************************************/
  boolean isCollidingCircleRectangle(
        float circleX,
        float circleY,
        float radius,
        float rectangleX,
        float rectangleY,
        float rectangleWidth,
        float rectangleHeight)
  {
      float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
      float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);
   
      if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
      if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
   
      if (circleDistanceX <= (rectangleWidth/2)) { return true; }
      if (circleDistanceY <= (rectangleHeight/2)) { return true; }
   
      float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                           pow(circleDistanceY - rectangleHeight/2, 2);
   
      return (cornerDistance_sq <= pow(radius,2));
  }
}
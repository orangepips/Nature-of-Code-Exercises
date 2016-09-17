CannonBall cannonBall;

void setup() {
  size(600, 600, P3D);  
  cannonBall = new CannonBall();
}

void draw() {
 background(0);
 lights();
 cannonBall.update();
 cannonBall.display();
}

class CannonBall {
 PVector location;
 PVector velocity = new PVector(.5, -2, .5);
 PVector acceleration = new PVector(0, 1, 0);
 float mass = 20;
 
 float angle = 0;
 float aVelocity = 1;
 float aAcceleration = 0;
 
 CannonBall() {
   location = new PVector(50, height - 50, -height+50);
 }
 
 void update() { 
    velocity.add(acceleration);
    location.add(velocity);
 
    aVelocity += aAcceleration;
    angle += aVelocity;
 
    acceleration.mult(0);
  }
  
  void display() {
    stroke(255);
    fill(0);
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotate(angle);
    rotateX(PI);
    sphere(100);
    popMatrix();
  }
}
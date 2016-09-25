class Spaceship {
  PVector position;
  PVector velocity;
  PVector acceleration = new PVector(0,0);
  PVector arrow;
  float topspeed;
  float theta = 0;

  float xoff, yoff;

  float r = 16;
  
  ParticleSystem ps;

  Spaceship() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    arrow = position.copy();
    topspeed = 10;
    xoff = 1000;
    yoff = 0;
    ps = new ParticleSystem();
  }

  void accelerate() {
    PVector direction = new PVector(cos(theta - HALF_PI), sin(theta - HALF_PI));
    applyForce(direction);
    int particles = int(random(5,15));
    println(particles);
    for (int i = 0; i <= particles; i++) {
      PVector origin = position.copy();
      origin.x += random(-10, 10);
      origin.y += random(-10, 10);
      origin.add(velocity.copy().normalize().mult(-10));
      ps.addParticle(origin, direction.copy().mult(-1));   
    }    
  }

  void applyForce(PVector force) {
     acceleration.add(force);
  }

  void update() {    
    if (velocity.copy().add(acceleration).mag() <= topspeed) {
      velocity.add(acceleration);
    }
    position.add(velocity);
    //println(velocity);
    acceleration.mult(0);    
  }
  
  void clockwise() {
    theta += QUARTER_PI / 2;
  }
  
  void counterclockwise() {
    theta -= QUARTER_PI / 2;
  }

  void display() {    
    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
    rectMode(CENTER);
    translate(position.x, position.y);
    rotate(theta);
    triangle(0, 0, -12, 16, 12, 16);
    rect(-6, 20, 5, 3);
    rect(6, 20, 5, 3);
    popMatrix();
    ps.run();
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } 
    else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } 
    else if (position.y < 0) {
      position.y = height;
    }
  } 
}
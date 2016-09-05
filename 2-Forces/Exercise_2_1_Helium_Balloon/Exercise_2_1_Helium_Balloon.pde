Mover mover;
float increment = .2;
PVector windOffset = new PVector(1.0, 0.0);
PVector rise = new PVector(0.0, -0.01);

void setup() {
  size(400, 400);
  mover = new Mover();
}

void draw() {
  background(0);    
  mover.applyForce(generateWind());
  mover.applyForce(rise);
  
  mover.update();
  mover.display();
}

PVector generateWind() {
  PVector wind = new PVector(
    map(noise(windOffset.x), 0, 1, -0.05, 0.05), 
    map(noise(windOffset.y), 0, 1, -0.05, 0.05) // favor upwards wind
  );
  windOffset.x += increment;
  windOffset.y += increment;
  return wind;
}

class Mover {
  PVector location = new PVector(width/2, height/2);
  PVector velocity = new PVector(0, 0);
  
  PVector acceleration = new PVector(0, 0);
  int size = 50;  
  
  Mover() {
    velocity.limit(3);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void checkEdges() {
    if (location.x - size/2<= 0) {
      location.x = size/2;
      velocity.x *= -1.0; 
    } else if (location.x + size/2 >= width) {
      location.x = width - size/2;
      velocity.x *= -1.0; 
    }
    
    if (location.y - size/2<= 0) {
       location.y = size/2;
       velocity.y *= -1.0; 
    } else if (location.y + size/2 >= height) {
      location.y = height - size/2;
      velocity.y *= -1.0;
    }
    
  }
  
  void display() {
    fill(255, 0, 0);    
    ellipse(location.x, location.y, size, size);
  }
  
  void update() {
    velocity.add(acceleration);
    checkEdges();
    location.add(velocity);        
    //println(acceleration, velocity, location);
    acceleration.mult(0);
 }
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Liquid class 
class Liquid {


  // Liquid is a rectangle
  float x, y, w, h;
  // Coefficient of drag
  float c1;
  // Coefficient of lift
  float c2;

  Liquid(float x_, float y_, float w_, float h_, float c1_, float c2_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c1 = c1_;
    c2 = c2_;
  }

  // Is the Mover in the Liquid?
  boolean contains(Mover m) {
    PVector l = m.position;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }

  // Calculate drag force
  PVector drag(Mover m) {
    // Magnitude is coefficient * speed squared
    float speed = m.velocity.mag();    
    float dragMagnitude = c1 * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);

    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);   
    
    float area = map(m._width, 10, 60, .3, 5);
    dragForce.mult(area);
    
    return dragForce;
  }
  
  // http://www.engineeringtoolbox.com/lift-drag-fluid-flow-d_1657.html
  // FL = 1/2 cL ρ v2 A   
  PVector lift(Mover m) {     
    float speed = m.velocity.mag();
    float liftMagnitude = c2 * speed * speed;
    
    // Lift direction is perpendicular to velocity
    PVector velocityForce = m.velocity.get();
    PVector liftForce = new PVector(velocityForce.y, velocityForce.x);
    liftForce.mult(-1);
    
    liftForce.normalize();
    liftForce.mult(liftMagnitude);   
    
    //float area = map(m._height, 10, 60, .3, 5);
    //liftForce.mult(m._height);   
    
    return liftForce;
  }

  void display() {
    noStroke();
    fill(50);
    rect(x, y, w, h);
  }
}
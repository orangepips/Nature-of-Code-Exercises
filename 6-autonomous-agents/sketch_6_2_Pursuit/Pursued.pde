class Pursued extends Vehicle {
  Pursued(float x, float y) {
    super(x, y);
    c = color(0, 255, 0);
    this.maxspeed = 3;
    this.maxforce = 1; // allow it to turn faster than Pursuer  
  }
  
  void move(Vehicle other) {
    this.maxspeed = 3;     
    PVector distance = PVector.sub(position, other.position);
     
    PVector steer = new PVector(0, 0); 
    
    if (distance.mag() < 100) {
      PVector desired = PVector.sub(other.position, position).mult(-1);
      
      this.maxspeed = other.maxspeed * 1.1; 
      if (random(1) > .8) {
        desired = desired.rotate(random(-HALF_PI, HALF_PI));
      }
      steer = PVector.sub(desired,velocity);
      steer.limit(maxforce);  // Limit to maximum steering force
      applyForce(steer);
    }
  }
}
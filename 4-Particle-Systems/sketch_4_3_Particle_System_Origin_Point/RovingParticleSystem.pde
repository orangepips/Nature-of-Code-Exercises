class RovingParticleSystem extends AbstractParticleSystem {
  PVector location;
  PVector velocity;   
  
  RovingParticleSystem(PVector position) {
    location = position;
    velocity = new PVector(random(-.5, .5), random(-.5, .5));    
  }
  
  PVector getOrigin() {
    if (location.x >= width || location.x <= 0) {
      velocity.x *= -1;
    } 
    if (location.y >= height || location.y <= 0) {
      velocity.y *= -1;
    }
    PVector acceleration = new PVector(random(-.1, .1), random(-.1, .1));
    velocity.add(acceleration);
    location.add(velocity);
    
    return location; 
  }
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Using Generics now!  comment and annotate, etc.

class ParticleSystem extends AbstractParticleSystem {
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.get();    
  }
  
  PVector getOrigin() {
    return origin; 
  }
}
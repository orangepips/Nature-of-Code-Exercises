class MouseParticleSystem extends AbstractParticleSystem {
  PVector getOrigin() {
    return new PVector(mouseX, mouseY); 
  }
}
abstract class AbstractParticleSystem {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  
  void addParticle() {
    particles.add(new Particle(getOrigin()));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  abstract PVector getOrigin();
}
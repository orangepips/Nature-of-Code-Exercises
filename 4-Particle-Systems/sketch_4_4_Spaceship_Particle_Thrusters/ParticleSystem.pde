class ParticleSystem {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  
  void addParticle(PVector location, PVector velocity) {
    particles.add(new Particle(location, velocity));
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
  
  
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
  ArrayList<Particle> particles;
  Vec2 origin;
  static final float G = 100;

  ParticleSystem(Vec2 position) {
    origin = new Vec2(position);
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  // A function to apply a force to all Particles
  void applyForce(Vec2 f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
  
  void interact() {
    for (int i = 0; i < particles.size(); i++) {
      for (int j = i; j < particles.size(); j++) {
        particles.get(i).interact(particles.get(j));
      }
    }
  }

  void run() {
    interact();
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
        p.killBody();
      }
    }
  }
}
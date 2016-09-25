// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Simple Particle System

// Particles are generated each cycle through draw(),
// fall with gravity and fade out over time
// A ParticleSystem object manages a variable size (ArrayList) 
// list of particles.

import java.util.Iterator;

ArrayList<ParticleSystem> systems;

void setup() {
  size(640,360);
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);
  Iterator<ParticleSystem> it = systems.iterator();
  while(it.hasNext()) {
    ParticleSystem ps = it.next();        
    ps.run();
    ps.addParticle(); 
    if (ps.dead()) {      
      it.remove();      
    }
  }
  
  fill(0);
  text("click mouse to add particle systems",10,height-30);
}

void mousePressed() {
  systems.add(new ParticleSystem(1, new PVector(mouseX,mouseY), int(random(100, 200))));
}
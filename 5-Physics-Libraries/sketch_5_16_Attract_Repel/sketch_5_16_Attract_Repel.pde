import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ArrayList<Particle> particles;
Attractor attractor;

VerletPhysics2D physics;

void setup () {
  size (640, 360);
  physics = new VerletPhysics2D ();
  physics.setDrag (0.01);
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 50; i++) {
    particles.add(new Particle(new Vec2D(random(width),random(height))));
    if (i == 0) continue;
    physics.addSpring(new VerletSpring2D(particles.get(i-1), particles.get(i), 25, 0.01));
  }
  
  attractor = new Attractor(new Vec2D(width/2,height/2));
  physics.setWorldBounds(new Rect(0, 0, width, height));
}


void draw () {
  background (255);  
  physics.update ();

  attractor.display();
  beginShape();
  stroke(0);
  strokeWeight(2);
  noFill();
  for (Particle p: particles) {
    vertex(p.x, p.y);
    p.display();
  }
  noFill();
  endShape();
  
   //beginShape();
   // stroke(0);
   // strokeWeight(2);
   // noFill();
   // for (Particle p : particles) {
   //   vertex(p.x,p.y);
   // }
   // endShape();
   // tail.display();
  
  if (mousePressed) {
    attractor.lock();
    attractor.set(mouseX,mouseY);
  } else {
    attractor.unlock();
  }
}
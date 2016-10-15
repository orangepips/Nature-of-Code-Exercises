import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ParticleSystem ps;

Box2DProcessing box2d;

Vec2 gravity = new Vec2(0,-0.1);

void setup() {
  size(640,360);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  

  ps = new ParticleSystem(box2d.coordPixelsToWorld(new PVector(width/2,50)));    
}

void draw() {
  background(255);
  
  box2d.step();
  
  ps.addParticle();
  
  // Apply gravity force to all Particles  
  ps.applyForce(gravity);  
  
  ps.run();
}
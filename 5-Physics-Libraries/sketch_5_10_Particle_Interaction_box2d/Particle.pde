// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  float lifespan;
  Body body;
  
  float mass = 1; // Let's do something better here!

  Particle(Vec2 position) {    
    lifespan = 255.0;
    makeBody(position.add(new Vec2(random(-3,3), random(-3, 3))));
  }

  void run() {
    display();
  }

  void applyForce(Vec2 force) {
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force, pos);
  }

  void interact(Particle other) {
    Vec2 pos = body.getWorldCenter();
    Vec2 moverPos = other.body.getWorldCenter();
    Vec2 force = new Vec2(pos).sub(moverPos);
    float distance = constrain(force.length(), 1, 5);
    force.normalize();
    float strength = (gravity.length() *  other.body.m_mass) / (distance / distance); 
    force.mulLocal(strength);
    other.applyForce(force);
  }

  // Method to display
  void display() {
    lifespan -= 2.0;
    stroke(0,lifespan);
    strokeWeight(2);
    fill(127,lifespan);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    ellipse(pos.x,pos.y,12,12);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
  void makeBody(Vec2 position) {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(new Vec2(position.x, position.y));
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(12);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    
    // Attach fixture to body
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
  }
  
  void killBody() {
    box2d.destroyBody(body);
  }
}
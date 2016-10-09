// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Series of Particles connected with distance joints

class Pair {

  Particle p1;
  Particle p2;

  float len = 20;
  // Chain constructor
  Pair(Particle _p1, Particle _p2) {
    p1 = _p1;
    p2 = _p2;
    
    DistanceJointDef djd = new DistanceJointDef();
    // Connection between previous particle and this one
    djd.bodyA = p1.body;
    djd.bodyB = p2.body;
    // Equilibrium length
    djd.length = box2d.scalarPixelsToWorld(len);
    
    // These properties affect how springy the joint is 
    djd.frequencyHz = 0;  // Try a value less than 5 (0 for no elasticity)
    djd.dampingRatio = .2; // Ranges between 0 and 1 (1 for no springiness)

    // Make the joint.  Note we aren't storing a reference to the joint ourselves anywhere!
    // We might need to someday, but for now it's ok
    DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
  }

  void display() {
    Vec2 pos1 = box2d.getBodyPixelCoord(p1.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(p2.body);
    stroke(0);
    strokeWeight(2);
    line(pos1.x,pos1.y,pos2.x,pos2.y);

    p1.display();
    p2.display();
  }
}
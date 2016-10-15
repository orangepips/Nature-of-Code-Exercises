// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Toxiclibs example: http://toxiclibs.org/

// Force directed graph
// Heavily based on: http://code.google.com/p/fidgen/

// Notice how we are using inheritance here!
// We could have just stored a reference to a VerletParticle object
// inside the Node class, but inheritance is a nice alternative

class Node extends VerletParticle2D {
  int r = 8;
  boolean dragged = false;
  PVector offset = new PVector();
  
  Node(Vec2D pos) {
    super(pos);
  }
  
  // Check if a point is within the ball at the end of the chain
  // If so, set dragged = true;
  boolean contains(int _x, int _y) {
    float d = dist(_x,_y,x,y);
    if (d < r) {
      lock();
      offset.x = _x - x;
      offset.y = _y - y;
      dragged = true;
      return true;
    }
    return false;
  }

  // All we're doing really is adding a display() function to a VerletParticle
  void display() {
    fill(0,150);
    stroke(0);
    strokeWeight(2);
    ellipse(x,y,r*2,r*2);
  }
  
  void update(int _x, int _y) {
    set(_x, _y);
  }
}
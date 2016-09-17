// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0, 100);
    ellipse(position.x, position.y, mass*24, mass*24);
  }

  PVector attract(Mover m) {
    return calculateForce(m.position, m.mass).mult(-0.1);
  }

  void chaseMouse() {
    PVector mousePosition = new PVector(mouseX, mouseY);
    applyForce(calculateForce(mousePosition, 2).mult(-1));
  }
  
  PVector calculateForce(PVector otherPosition, float otherMass) {
    PVector force = PVector.sub(position, otherPosition);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * otherMass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);      // Get force vector --> magnitude * direction
    return force;
  }
}
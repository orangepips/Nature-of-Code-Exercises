Mover mover;
Liquid liquid;

void setup() {
  size(800, 200);
  mover = new Mover(5, 30, height * .95);
  mover.velocity = new PVector(5, 0);
  liquid = new Liquid(0, 0, width, height, 0.1, 0.44);
}

void draw() {
  background(255);
  liquid.display();
  
  PVector dragForce = liquid.drag(mover);
  PVector liftForce = liquid.lift(mover);
  PVector gravity = new PVector(0, 0.1 * mover.mass);
  
  mover.applyForce(dragForce);
  mover.applyForce(liftForce);
  mover.applyForce(gravity);

  mover.update();
  mover.display();
}
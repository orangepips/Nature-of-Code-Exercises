Object object;

void setup() {
  size(600, 600);
  object = new Object();
}

void draw() {
  background(255);
  object.run();
}
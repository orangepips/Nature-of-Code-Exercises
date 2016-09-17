Wave wave1;
Wave wave2;

void setup() {
  size(640,360);
  //frameRate(4);
  wave1 = new Wave(12, 320, 80, 240, 240, .15, .1, .015);
  wave2 = new Wave(8, 40, 20, 120, 120, .75, .15, .02);  
}

void draw() {
  background(255);
  wave1.display();
  wave2.display();
}
Pursuer pursuer;
Pursued pursued; 

void setup() {
  size(640, 360);
  pursuer = new Pursuer(width/2, height/2);
  pursued = new Pursued(random(10, width-10), random(10, height-10));
}

void draw() {
  background(255);

  // Call the appropriate steering behaviors for our agents
  pursuer.move(pursued);
  pursuer.update();
  pursuer.display();
  
  pursued.move(pursuer);
  pursued.update();
  pursued.display();
}
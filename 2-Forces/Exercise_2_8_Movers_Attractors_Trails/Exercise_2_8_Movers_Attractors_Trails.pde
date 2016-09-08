// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] movers = new Mover[50];
Attractor[] attractors = new Attractor[5];

void setup() {
  size(800, 800, P3D);
  scatter();
}

void draw() {
  /*for (int i = 0; i < attractors.length; i++) {
    attractors[i].display();
    attractors[i].drag();
    attractors[i].hover(mouseX, mouseY);
  }*/

  stroke(0, 50);
  beginShape(POINTS);
  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < attractors.length; j++) {
      PVector force = attractors[j].attract(movers[i]);
      movers[i].applyForce(force);
    }

    movers[i].update();    
    //movers[i].display();
    vertex(movers[i].position.x, movers[i].position.y);
  }
  endShape();
  
  if (mousePressed) {
    scatter();
  }
}

/*void mousePressed() {
  for (int i = 0; i < attractors.length; i++) {
    attractors[i].clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (int i = 0; i < attractors.length; i++) {
    attractors[i].stopDragging();
  }
}*/

void scatter() {
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 2), random(width), random(height));
  }
  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor(random(width), random(height), random(5,25));  
  }  
  fill(0);
  text("click mouse to reset", 10, 30);
}
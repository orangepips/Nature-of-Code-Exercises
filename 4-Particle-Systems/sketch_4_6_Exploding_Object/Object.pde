class Object {
  int countdown = 100;
  ArrayList<Piece> pieces = new ArrayList<Piece>();
  
  /*
  Set up 3x3 grid of squares
  Make it vibrate and then break apart
  */
  Object() {
    float centerX = width / 2;
    float centerY = height / 2;
    for (float row = -1.5; row <= .5; row++) {
      for (float col = -1.5; col <= .5; col++) {
        println("row: " + row + "\tcol: " + col);        
        float x = centerX + (Piece.SIDE * row);
        float y = centerY + (Piece.SIDE * col);
        pieces.add(new Piece(new PVector(x, y)));
      }
    }
  }
  
  void update() {
    if (countdown > 0) {
      countdown -= 1;
      vibrate();
      return; 
    } 
    
    if (countdown == 0) {
      explode();
    }
    for (Piece piece: pieces) {
      piece.update();
    }
  }
  
  void display() {
    for (Piece piece: pieces) {
      piece.display();
    }
  }
  
  void explode() {
    for (Piece piece: pieces) {
      piece.applyForce(new PVector(random(-2, 2), random(-2, 2)));
      piece.applyRotation(random(-radians(20), radians(20)));
    }    
    countdown = -1;    
  }
  
  void vibrate() {
    float x = random(-5, 5);
    float y = random(-5, 5);
    for (Piece piece: pieces) {
      piece.location.x += x + random(-.5, .5);
      piece.location.y += y + random(-.5, .5);
    }
  }
  
  void run() {
    update();
    display();
  }
}
class Object {
  int countdown = 100;
  ArrayList<Piece> pieces = new ArrayList<Piece>();
  
  /*
  Set up 3x3 grid of squares
  Make it vibrate and then break apart
  */
  Object() {
    for (int i = 0; i < 9; i++) {
      
    }
  }
  
  void update() {
    if (countdown >= 0) {
      countdown -= 1;
      vibrate();
      return; 
    }
    explode();
  }
  
  void display() {
  }
  
  void explode() {
    
  }
  
  void vibrate() {
  }
  
  void run() {
    update();
    display();
  }
}
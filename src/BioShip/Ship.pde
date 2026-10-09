class Ship {
  // Member Variable
  int x, y, w, h, score, health;
  Gif ship01;


  // Constructor
  Ship(PApplet parent, int x, int y) {
    //  x= width/2;
    // y= height/2;
    this.x = x;
    this.y = y;
    w = 50;
    h = 50;
    ship01 = new Gif(parent, "bShip.gif");
    ship01.loop();
  }
  // Member Methods
  void display() {
    imageMode(CENTER);
    image(ship01, x, y);
    //fill(127);
    //quad(x,y-50,x+25,y-15,x,y+40,x-25,y-15);
  }
  //void move(int tempX, int tempY) {
  //x = tempX;
  //y = tempY;
  void move(char dir) {
    if (dir == 'w') {
      y = y - 50;
    } else if (dir == 's') {
      y = y + 50;
    } else if (dir == 'a') {
      x = x - 50;
    } else if (dir == 'd') {
      x = x + 50;
    }
  }
}

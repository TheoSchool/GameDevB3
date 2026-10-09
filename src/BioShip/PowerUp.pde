class PowerUp {

  int x, y, size, speed;
  color c1;
  char type;
  PImage p1;

  // Constructor
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    size = int(random(20, 75));
    speed = int(random(1, 5));
    c1 = color(#A7ADA8);
    if (random(2) > 1) {
      type = 'h';
    } else {
      type = 't';
    }
    p1 = loadImage("Parasite.png");
  }
  // Member
  void display() {
    imageMode(CENTER);
    image(p1, x, y, size, size);
  }
  void move() {
    y = y + speed;
  }

 boolean isOffScreen() {
    if (y > height + 50) {
      return true;
    } else {
      return false;
    }
 }
      
    boolean isHit(Ship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}

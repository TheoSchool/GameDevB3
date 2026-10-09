class Laser {
  int x, y, w, h, speed;
  PImage l1;

  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 8;
    h = 12;
    speed = 5;
  }

  void display() {
    fill(0, 0, 225);
    rectMode(CENTER);
    rect(x, y, w, h);
    l1 = loadImage("Bullet.png");
  }

  void move() {
    y = y - speed;
  }

  boolean isOffScreen() {
    if (y< -h) {
      return true;
    } else {
      return false;
    }
  }
    boolean isHit(Citizen r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}

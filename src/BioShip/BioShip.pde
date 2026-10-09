// Theo heisler | 17 Sept 2026 | BioShip //

import processing.sound.*;
import gifAnimation.*;
SoundFile laser1;
ArrayList<Citizen> citizens = new ArrayList<Citizen>();
ArrayList<PowerUp> powUps = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Ship s1;
Timer citizenDist, puDist;
Boss boss;
int score, citizenCount, citizensOffScreen;
boolean play;
boolean bossSpawned = false;
PImage bg;

void setup() {
  size(900,900);
  s1 = new Ship(this, width/2, height/2);
  s1.health = 100;
  citizenDist = new Timer(2000);
  citizenDist.start();
  puDist = new Timer(3000);
  puDist.start();
  score = 0;
  citizenCount = 0;
  citizensOffScreen = 0;
  play = false;
  bg = loadImage("bg.png");
  laser1 = new SoundFile(this, "dragon-studio-laser-sfx-570449.mp3");
  laser1.play();
}
void draw() {
  if (play == false) {
    startScreen();
  } else {
    background(0, 30, 70);
    s1.display();

    for (int i = 0; i <citizens.size(); i++) {
      Citizen s = citizens.get(i);
      s.display();
      s.move();
      if (s.isHit(s1) == true) {
        citizens.remove(s);
        s1.health -= 10;
      }
      if (s.health <= 0) {
        citizens.remove(s);
        score += 10;
        score += citizenCount*10;
      }
      if (s.isOffScreen() == true) {
        citizens.remove(s);
        citizensOffScreen += 1;
      }
    }
    for (int i = 0; i <powUps.size(); i++) {
      PowerUp p = powUps.get(i);
      p.display();
      p.move();
      if (p.isHit(s1) == true) {
        if (p.size > 60) {
          s1.health += 10;
        } else {
          score +=100;
        }
        powUps.remove(p);
      }
      if (p.isOffScreen() == true)
        powUps.remove(p);
      //println(powerups.size());
    }

    for (int i = 0; i <lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j <citizens.size(); j++) {
        Citizen s = citizens.get(j);
        if (l.isHit(s)) {
          lasers.remove(l);
          s.health -= 50;
        }
      }
      l.display();
      l.move();
      if (l.isOffScreen() == true)
        lasers.remove(l);
      println(lasers.size());
    }
    //add seaweed
    if (citizenDist.isFinished() == true) {
      citizenDist.start();
      citizens.add(new Citizen(int(random(width)), -60 ));
      citizenCount += 1;
    }
    if (puDist.isFinished() == true) {
      puDist.start();
      powUps.add(new PowerUp(int(random(width)), -60 ));
    }
  if (score >= 1000 && !bossSpawned) {
  boss = new Boss(width / 2, -60);
  bossSpawned = true;
}

if (bossSpawned && boss != null) {
  boss.display();
  boss.move();

  for (int i = 0; i < lasers.size(); i++) {
    Laser l = lasers.get(i);
    if (boss.isHit(l)) {
      lasers.remove(l);
      boss.health -= 50;
    }
  }

  if (boss.health <= 0) {
    score += 500; 
    boss = null;  
  }
}
    if (s1.health <= 0 || citizensOffScreen > 9) {
      gameOver();
    }
    infoPanel();
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    s1.move('w');
  } else if (key == 's' || key == 'S') {
    s1.move('s');
  } else if (key == 'a' || key == 'A') {
    s1.move('a');
  } else if (key == 'd' || key == 'D') {
    s1.move('d');
  }
}
void mousePressed() {
  lasers.add(new Laser(s1.x, s1.y));
  laser1.play();
}

void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 0, width, 40);
  fill(255);
  textSize(25);
  textAlign(CORNER, CORNER);
  text("Score:" + score, 20, 35);
  text("Citizen Count:" + citizenCount, 180, 35);
  text("Health:" + s1.health, 380, 35);
  text("Citizens Passed:" + citizensOffScreen, 500, 35);
}

void startScreen() {
  background(0);
  fill(255);
  text("Press any key to start game...", width/2, height/2);
  if (keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Game Over", width/2, height/2);
  noLoop();
}

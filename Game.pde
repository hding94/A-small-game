
/*The goal of this game is to kick the sleepwalker out of his house(the door is at the bottom-right). 
 By pushing the blocking boxes to sertain locations, the route of the sleepwalker will change.
 Once there is a wall or a box in front of the sleepwalker, the priority of changing direction is turn LEFT > turn RIGHT > turn AROUND.
 The game seems easy but it have to think it through before moving the boxes. 
 Because the sleepwalker is moving, so it would be better if the player could think several steps ahead.
 Enjoy!*/
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer backgroundM;

PImage imgWall, imgCrate, imgWalker, imgPlayer, imgBed, imgSuc;
int imageSize = 30, maxW;
char[][] originLevel, level;
int playerW, playerH;
char TYPE_BOX = '$', TYPE_EMPTY = ' ', TYPE_PLAYER = '@', TYPE_WALL = '#';
int dirWalker = 1, count = 0, suc = 1;
boolean keyHold = false;
int xWalker = 22, yWalker = 1;

void setup() {
  minim = new Minim(this);
  backgroundM = minim.loadFile("background music.mp3", 1024);
  backgroundM.loop();
  loadLevel();
  loadImages();
  size(750, 630);
  surface.setResizable(true);
}
void draw() {

  //println(playerW);
  //println(playerH);
  surface.setSize(imageSize*maxW, imageSize*level.length);
  background(100);
  drawLevel();
  Movement();
  drawPlayer();
  drawWalker();
  if (xWalker == 24 && yWalker == 14) {
    image(imgSuc, 120, 50);
    suc = 0;
  }
  if (count == 30&&suc == 1) {
    dirWalker = check();
    count = 0;
  }
  count++;
}
void drawPlayer() {
  int xPart = width/maxW;
  int yPart = height/level.length;
  image(imgPlayer, (playerW*xPart), (playerH*yPart));
}
void loadImages() {
  imgWall = loadImage("wall.png");
  imgWall.resize(imageSize, imageSize);
  imgCrate = loadImage("box.png");
  imgCrate.resize(imageSize, imageSize);
  imgWalker = loadImage("sleepwalker.png");
  imgWalker.resize(imageSize, imageSize);
  imgPlayer = loadImage("player.png");
  imgPlayer.resize(35, 32);
  imgBed = loadImage("bed.jpg");
  imgBed.resize(imageSize, imageSize);
  imgSuc = loadImage("suc.png");
  imgSuc.resize(500, 430);
}
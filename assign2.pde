PImage start;
PImage bg;
PImage food;
PImage ratImg;
PImage ratDow;
PImage ratleft;
PImage ratRight;
PImage soldier;
PImage soil;
PImage life;
PImage gameover;
PImage butts;
PImage buttr;
PImage buttsh;
PImage buttrh;
int game=0;
int lifex =10;
int lifen =2;
int sx=-80, sy;

int fo =1;
int foodx=0, foody=0;

int ratx = 320, raty = 80;

int ratxb, ratxs, ratyb, ratys;
int soldxb, soldxs, soldyb, soldys;
int foodxb, foodxs, foodyb, foodys;
int count=0;

void setup() {
  size(640, 480, P2D);
  frameRate(60);
  start = loadImage("img/title.jpg");
  bg = loadImage("img/bg.jpg");
  food = loadImage("img/cabbage.png");
  ratImg = loadImage("img/groundhogIdle.png");
  ratDow = loadImage("img/groundhogDown.png");
  ratleft = loadImage("img/groundhogLeft.png");
  ratRight = loadImage("img/groundhogRight.png");
  soldier = loadImage("img/soldier.png");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  gameover =loadImage("img/gameover.jpg");
  butts = loadImage("img/startNormal.png");
  buttr = loadImage("img/restartNormal.png");
  buttsh = loadImage("img/startHovered.png");
  buttrh = loadImage("img/restartHovered.png");
}

void draw() {
  image(start, 0, 0);
  image(buttsh, 248, 360);
  if (mouseX<=248||mouseX>=392&&mouseY<=360||mouseY>=420) {
    image(butts, 248, 360);
  }
  Game();
}

void Game() {
  if (game%2!=0&&game!=0) {

    image(bg, 0, 0);
    image(soil, 0, 160);

    heart();
    if (fo==1) {
      foodpos();
    }
    if (fo==0) {
      image( food, foodx, foody);
    } else {
      foodx=-80;
      foody=0;
    }

    sungrass();
    soilder();
    boom();
    keyPressed();
  }

  if (game%2==0&&game!=0) {

    image(gameover, 0, 0);
    image(buttrh, 248, 360);
    if (mouseX<=248||mouseX>=392&&mouseY<=360||mouseY>=420) {
      image(buttr, 248, 360);
    }

    if (mousePressed == true) {
      game=1;
      lifen =2;
      foodpos();
    }
  }
}


void mousePressed() {
  game++;
}

void boom() {
  ratxs = ratx - 80 / 2;
  ratxb = ratx + 80 / 2;
  ratys = raty - 80 / 2;
  ratyb = raty + 80 / 2;

  soldxs = sx - 80 / 2;
  soldxb = sx + 80 / 2;
  soldys = sy - 80 / 2;
  soldyb = sy + 80 / 2;

  foodxs = foodx - 80 / 2;
  foodxb = foodx + 80 / 2;
  foodys = foody - 80 / 2;
  foodyb = foody + 80 / 2;

  if (ratxb >soldxs && soldxb > ratxs &&
    ratyb > soldys && soldyb > ratys) {
    lifen--;
    heart();
    ratx = 320;
    raty = 80;
  }

  if (ratxb >foodxs && foodxb > ratxs &&
    ratyb > foodys && foodyb > ratys) {
    lifen++;
    heart();
    fo=2;
  }
}

void soilder() {

  if (sx==-80) {
    ran();
  }
  image(soldier, sx, sy);

  sx=sx+1;
  if ( sx > 640) {
    sx = -80;
  }
}

void ran() {
  int a = (int)random(4);
  switch(a) {
  case 0:
    sy=160;
    break;
  case 1:
    sy=240;
    break;
  case 2:
    sy=320;
    break;
  case 3:
    sy=400;
    break;
  }
}

void sungrass() {
  fill(255, 255, 0);
  ellipse(590, 50, 130, 130);


  fill(253, 184, 19);
  ellipse(590, 50, 120, 120);

  fill(124, 204, 25);
  rect(0, 145, 640, 15);
  stroke(0, 0, 0, 0);
}

void  keyPressed() {
  int x = ratx;
  int y = raty;


  if (keyPressed) {
    if (keyCode == UP) {
      if (raty>=160)raty-=5;
      image( ratImg, ratx, raty);
    }
    if (keyCode == DOWN) {
      if (raty<=400)
        raty+=5;
      x = -80;
      y=0;
      image( ratDow, ratx, raty);
    }
    if (keyCode == LEFT) {
      if (ratx>=0)
        ratx -= 5;
      x = -80;
      y=0;
      image( ratleft, ratx, raty);
    }
    if (keyCode == RIGHT) {
      if (ratx<=560)
        ratx += 5;
      x = -80;
      y=0;
      image( ratRight, ratx, raty);
    }
  }
  image( ratImg, x, y);
}

void heart() {
  int i =0;
  if (lifen==0) {
    game++;
  } else {
    do {
      image(life, lifex+60*i, 10);
      i++;
    } while (i!=lifen);
  }
}


void keyReleased() {
  image( ratImg, ratx, raty);
}

void foodpos() {
  int a = (int)random(4);
  int b = (int)random(8);

  switch(a) {
  case 0:
    foody=160;
    break;
  case 1:
    foody=240;
    break;
  case 2:
    foody=320;
    break;
  case 3:
    foody=400;
    break;
  }

  switch(b) {
  case 0:
    foodx=80;
    break;
  case 1:
    foodx=160;
    break;
  case 2:
    foodx=240;
    break;
  case 3:
    foodx=320;
    break;
  case 4:
    foodx=400;
    break;
  case 5:
    foodx=480;
    break;
  case 6:
    foodx=560;
    break;
  case 7:
    foodx=640;
    break;
  }
  fo--;
}

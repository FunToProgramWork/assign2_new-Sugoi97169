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
int sx=-80,sy;

int fo =1;
int foodx=0,foody=0;

void setup(){
  size(640,480,P2D);
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

void draw(){
 image(start,0,0);
 image(buttsh,248,360);
 if(mouseX<=248||mouseX>=392&&mouseY<=360||mouseY>=420){
 image(butts,248,360);
 
 
 }

 if(game==1){
     image(bg,0,0);
     image(soil,0,160);
     image(life,lifex,10);
     image(life,lifex+60,10);
     
     if(fo==1){foodpos(); }
   image( food, foodx, foody);
     keyPressed();
     sun();
     soilder();
     
}

 if(lifen==0){
 
 image(gameover,0,0);
 image(buttrh,248,360);
 if(mouseX<=248||mouseX>=392&&mouseY<=360||mouseY>=420){
 image(buttr,248,360);
 
 }
 } 
}

void soilder(){

 if(sx==-80){ran();} 
  image(soldier, sx, sy);
  
    sx=sx+1;
  if ( sx > 640){sx = -80;}
}
void ran(){
  
 int a = (int)random(4);
    switch(a){
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
void sun(){
 fill(255,255,0);
 ellipse(590, 50, 130, 130);
 
  
  fill(253,184,19);
 ellipse(590, 50, 120, 120);
}

void mousePressed(){
game++;
}

void keyPressed(){
int ratx = 320,raty = 80;
if (key == CODED) {
if(keyCode == LEFT){if(ratx!=0){ratx-=80;}}
if(keyCode == RIGHT){if(ratx!=560){ratx+=80;}}
if(keyCode == UP){if(raty!=80){raty-=80;}}
if(keyCode == DOWN){if(raty!=400){raty+=80;}}
}
image( ratImg, ratx, raty);
}
void foodpos(){
int a = (int)random(4);
int b = (int)random(9);

switch(a){
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

switch(b){
 case 0:
      foodx=0;
      break;
    case 1:
      foodx=80;
            break;
    case 2:
     foodx=160;
            break;
    case 3:
      foodx=240;
             break;
    case 4:
      foodx=320;
            break;
    case 5:
     foodx=400;
            break;
    case 6:
      foodx=480;
             break;
    case 7:
      foodx=560;
             break;
     case 8:
      foodx=640;
             break;
}
fo--;
 
}

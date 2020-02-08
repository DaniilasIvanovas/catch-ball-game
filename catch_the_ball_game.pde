int xball;
int yball;
int xspeed;
int yspeed;
int bwidth;
int  bheight;
int speedx;
int speedy;
int level;
boolean caught;
boolean xc;
boolean yc;
PFont f;

void setup(){
  size(500,500);
  xball = width/2;
  yball = height/2;
  level = 0;
  xspeed = 1;
  yspeed = 2;
  speedx = 1;
  speedy = 2;
  caught = false;
  bwidth = 70;
  bheight = 70;
  f = createFont("Arial",16,true);
}

void draw(){
  background(0);
  textFont(f, 20);
  fill(255);
  text("Level: " + str(level), 10, 20);
  if(caught == false){
    if(xball <= width){
      xball = xball + xspeed;
    }
    if(xball <= width && xball > width - 20){
     xspeed = speedx - (speedx*2);
    }
    if(xball >= 0 && xball < 10){
      xspeed = speedx;
    }
    if(yball <= height){
      yball = yball + yspeed;
    }
    if(yball <= height && yball > height - 20){
     yspeed = speedy - (speedy*2);
    }
    if(yball >= 0 && yball < 10){
      yspeed = speedy;
    }
    //println(yball, xball);
    fill(255, 0, 0);
    ellipse(xball, yball, bwidth, bheight);
  }
  if(bwidth == 0 && bheight == 0){
    caught = true;
    textFont(f, 32);
    fill(255);
    textAlign(CENTER);
    text("YOU WON!", width/2, height/2);
    noLoop();
  }
}

void mouseClicked(){
  if(mouseX >= xball - bwidth && mouseX <= xball + bwidth && mouseY >= yball - bheight && mouseY <= yball + bheight){
    //xc = true;
    caught = true;
  }
  if(caught){
    speedx = speedx + 1;
    speedy = speedy + 1;
    bwidth = bwidth - 5;
    bheight = bheight - 5;
    level += 1;
    caught = false;
  }
}

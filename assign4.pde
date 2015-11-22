int state = 1, flightStatus = 1, bg1x = 0, bg2x = -640, hpx = 40, treasureX = floor(random(160,550)), treasureY = floor(random(50,390)), fighterX = 480, fighterY = floor(random(120,360)), treasureXeat = 0, treasureYeat = 0, boomX = 0, boomY = 0, boomCounter = 0, enemyY1 = floor(random(120,360)), enemyY2 = floor(random(20,260)), enemyY3 = floor(random(120,360)), counter = 0;
int [] enemyX = new int [18];
int [] enemyY = new int [18];
PImage bg1, bg2, end1, end2, enemy, fighter, flame1, flame2,flame3, flame4, flame5, hp, start1, start2, treasure, shoot;
PImage [] flame = new PImage [5];
boolean upPressed, downPressed, leftPressed, rightPressed, spacePressed, boom = false;

void setup (){
  size(640,480);
  frameRate = 30;
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  flame[0] = loadImage("img/flame1.png");
  flame[1] = loadImage("img/flame2.png");
  flame[2] = loadImage("img/flame3.png");
  flame[3] = loadImage("img/flame4.png");
  flame[4] = loadImage("img/flame5.png");
  hp = loadImage("img/hp.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  treasure = loadImage("img/treasure.png");
  //  setup enemy arrays
  for(int i = 0; i < 5; i ++){enemyX[i] = 0 - 70*i;}
  for(int i = 5; i < 10; i++){enemyX[i] = -920 - 70*(i-6);}
  for(int i = 10; i < 15; i++){enemyX[i] = -1840 - 70*(i-11);}
  for(int i = 15; i < 18; i++){enemyX[i] = -1840 - 70*(i-15);}
  for(int i = 0; i < 5; i ++){enemyY[i] = enemyY1;}
  for(int i = 5; i < 10; i++){enemyY[i] = enemyY2 + 40*(i-5);}
  for(int i = 10; i < 13; i++){enemyY[i] = enemyY3 - 40*(i-10);}
  for(int i = 13; i < 15; i++){enemyY[i] = enemyY3-40 + 40*(i-13);}
  for(int i = 15; i < 17; i++){enemyY[i] = enemyY3 + 40*(i-14);}
  enemyY[17] = enemyY3 + 40;
}
void draw(){
  switch(state){
    case 1 :   // start
      boolean startbgX = false;
      boolean startbgY = false;
      if (mouseX>200 && mouseX<460){startbgX = true;}
      if (mouseY>375 && mouseY<420){startbgY = true;}
      if (startbgX == true && startbgY == true){
        image(start1,0,0);
        if (mousePressed){state = 2;}
      }else{image(start2,0,0);}
      break;
    case 2 :   //playing
      // bakground
      image(bg1,bg1x,0);
      image(bg2,bg2x,0);
      bg1x += 1;
      bg2x += 1;
      if (bg1x == 640){bg1x = -640;}
      if (bg2x == 640){bg2x = -640;}
      // hp
      fill(255,0,0);
      rect(48,44,hpx,22);
      image(hp,40,40);
      if(hpx <= 0){state=3;boom = false;}
      // treasure
      image(treasure,treasureX,treasureY);
      if (fighterX > (treasureX-50) && fighterX < (treasureX+40)){
        treasureXeat = 1;
      }else{treasureXeat = 0;}
      if (fighterY > (treasureY-50) && fighterY < (treasureY+40)){
        treasureYeat = 1;
      }else{treasureYeat = 0;}
      if (treasureXeat == 1 && treasureYeat == 1){
        treasureX = floor(random(160,550));
        treasureY = floor(random(50,390));
        if (hpx <= 190){hpx += 20;}
      }
      //enemy
      for(int i =0; i < enemyX.length; i++){
        image(enemy,enemyX[i],enemyY[i]);
        enemyX[i] += 4;
        if(enemyX[i]-fighterX > -50 && enemyX[i]-fighterX < 50 && enemyY[i]-fighterY > -50 && enemyY[i]-fighterY < 50){
          if(hpx >= 10){
            boomX = enemyX[i];
            boomY = enemyY[i];
            boom = true;
            hpx -=40;
            enemyX[i]=1000;
          }
        }
      }
      counter += 4;
      if(counter > 2740){
        counter = 0;
        int enemyY1 = floor(random(120,360));
        int enemyY2 = floor(random(20,260));
        int enemyY3 = floor(random(120,360));
        for(int i = 0; i < 5; i ++){enemyX[i] = 0 - 70*i;}
        for(int i = 5; i < 10; i++){enemyX[i] = -920 - 70*(i-6);}
        for(int i = 10; i < 15; i++){enemyX[i] = -1840 - 70*(i-11);}
        for(int i = 15; i < 18; i++){enemyX[i] = -1840 - 70*(i-15);}
        for(int i = 0; i < 5; i ++){enemyY[i] = enemyY1;}
        for(int i = 5; i < 10; i++){enemyY[i] = enemyY2 + 40*(i-5);}
        for(int i = 10; i < 13; i++){enemyY[i] = enemyY3 - 40*(i-10);}
        for(int i = 13; i < 15; i++){enemyY[i] = enemyY3-40 + 40*(i-13);}
        for(int i = 15; i < 17; i++){enemyY[i] = enemyY3 + 40*(i-14);}
        enemyY[17] = enemyY3 + 40;
      }
      //boom
      if(boom){
        boomCounter ++;
        if(boomCounter < 3){image(flame[0],boomX,boomY);}
        else if(boomCounter < 6){image(flame[1],boomX,boomY);}
        else if(boomCounter < 9){image(flame[2],boomX,boomY);}
        else if(boomCounter < 12){image(flame[3],boomX,boomY);}
        else if(boomCounter < 15){image(flame[4],boomX,boomY);}
        else{boom = false;boomCounter = 0;}
      }
      //fighter
      image(fighter,fighterX,fighterY);
      if (upPressed){if (fighterY >= 10){fighterY -= 5;}}
      if (downPressed){if (fighterY <= 419){fighterY += 5;}}
      if (leftPressed){if (fighterX >= 10){fighterX -= 5;}}
      if (rightPressed){if(fighterX <= 600){fighterX += 5;}}
      break;
    case 3 : // end
      boolean endbgX = false;
      boolean endbgY = false;
      if (mouseX>200 && mouseX<440){endbgX = true;}
      if (mouseY>310 && mouseY<350){endbgY = true;}
      if (endbgX == true && endbgY == true){
        image(end1,0,0);
        if (mousePressed){
          state = 2;
          hpx = 40;
          fighterX = 480;
          for(int i = 0; i < 5; i ++){enemyX[i] = 0 - 70*i;}
          for(int i = 5; i < 10; i++){enemyX[i] = -920 - 70*(i-6);}
          for(int i = 10; i < 15; i++){enemyX[i] = -1840 - 70*(i-11);}
          for(int i = 15; i < 18; i++){enemyX[i] = -1840 - 70*(i-15);}
          enemyY1 =floor(random(120,360));
        }
      }else{image(end2,0,0);}
      break;
  }
}
void keyPressed(){
  if (key == CODED) { 
    switch (keyCode) {
      case UP:upPressed = true;break;
      case DOWN:downPressed = true;break;
      case LEFT:leftPressed = true;break;
      case RIGHT:rightPressed = true;break;
    }
  }
}
void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:upPressed = false;break;
      case DOWN:downPressed = false;break;
      case LEFT:leftPressed = false;break;
      case RIGHT:rightPressed = false;break;
    }
  }
}


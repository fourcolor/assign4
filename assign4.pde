//You should implement your assign3 here.
PImage start2,start1,backGround1,backGround2,fighter,treasure,hp,end1,end2;
int backGround1x=0,backGround2x=640,treasurex=(int)random(620),treasurey=(int)random(430),k=40,playA=0,playB=0,v=0;int b=-320,a=(int)random(430);
PImage[] enemy =new PImage[8];PImage[] flame=new PImage[5];
int[] e =new int[8];{
e[0]=0;}
int[] ey =new int[8];
float fighterx=580,bx;
float fightery=220,by;
float speed = 5;
boolean upPressed,playing,l= false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
void setup () {
  for(int i=0;i<5;i++)
    {
        e[i]=-(80*i);
    }
    for(int i=5;i<8;i++)
    {
        e[i]=-(80*i)-80;
    }
  size(640, 480) ;
  start2=loadImage("img/start2.png");
  start1=loadImage("img/start1.png");
  backGround1 = loadImage("img/bg1.png");
  backGround2 = loadImage("img/bg2.png");
  fighter = loadImage("img/fighter.png");
  treasure = loadImage("img/treasure.png");
  for(int i=0;i<8;i++){
  enemy[i] = loadImage("img/enemy.png");}
  for(int i=0;i<5;i++){
  flame[i] = loadImage("img/flame"+(i+1)+".png");}
  frameRate=30;
  hp = loadImage("img/hp.png");
  end2=loadImage("img/end2.png");
  end1=loadImage("img/end1.png");
}

void draw() {
  
  image(start2,0,0);
  if(pmouseX>=100&&pmouseX<=540&&pmouseY>=300&&pmouseY<=420){
    image(start1,0,0);
  }
  if(mousePressed){
    if(pmouseX>=100&&pmouseX<=540&&pmouseY>=300&&pmouseY<=420)
    playB=2;
  }
  switch(playB){
  case 2:
  if(keyPressed)
  if (k==-100) {k=40;fighterx=580;fightery=220;}

  if (upPressed) {
    fightery -= speed;
  }
  if (downPressed) {
    fightery += speed;
  }
  if (leftPressed) {
    fighterx -= speed;
  }
  if (rightPressed) {
    fighterx += speed;
  }
  if (fighterx >=580) {
    fighterx -=speed;
  }
  if (fighterx <=0) {
    fighterx +=speed;
  }
  if (fightery <=0) {
    fightery +=speed;
  }
   if (fightery >=430) {
    fightery -=speed;
  }
   if (treasurex >=fighterx-5 && treasurey>=fightery-10  && treasurey<=fightery+60 && treasurex <=fighterx+60 && k<200) {
    k+=20;treasurex=(int)random(600);treasurey=(int)random(430);
  }
  if (treasurex >=fighterx-5 && treasurey>=fightery-10  && treasurey<=fightery+60 && treasurex <=fighterx+60 ) {
    ;treasurex=(int)random(600);treasurey=(int)random(430);
  }
  if (k<=0) {k=-100;
  for(int i=0;i<5;i++)
    {
        e[i]=-(80*i);
    }
    playB=1;
   }
  if(playB==2){
  background(0);
  image(backGround1,backGround1x-640,0);
  image(backGround2,backGround2x-640,0);
  image(fighter,fighterx,fightery);
  image(treasure,treasurex,treasurey);
  backGround1x%=1280;backGround2x%=1280;
  b+=3;
    image(hp,40,40);
  fill(255,0,0,75);
    rect(45,45,k,20,100);
      
  if(playA==0){
  for(int i=0;i<5;i++){
    //e[i]=e[0]-60*i;
    image(enemy[i],e[i],ey[i]=a+0*i);}
    if (b >= 640) {b=-320;
    ;a=(int)random(245,430);playA=1;for(int i=0;i<5;i++)
    {
        e[i]=-(80*i);
    }}
     for(int i=0;i<5;i++)
    {
        e[i]+=3;
        if(e[i]+10 >=fighterx-5 && ey[i]+10>=fightery-20  && ey[i]+10<=fightery+60 && e[i]+10 <=fighterx+60)
        {
            e[i]+=640;k-=40;
        }
    }
   
  

}
     if(playA==1){
    for(int i=0;i<5;i++){
    image(enemy[i],e[i],ey[i]=a-50*i);}
    if (b >= 640) {b=-320;
    for(int i=5;i<8;i++)
    {
        e[i]=-(80*(i-5))-80;
    }
    ;a=(int)random(95,335);playA=2;
    for(int i=0;i<5;i++)
    {
        e[i]=-(80*i);
    }
  }
   for(int i=0;i<5;i++)
    {
        e[i]+=3;
        if(e[i]+10 >=fighterx-5 && ey[i]+10>=fightery-20  && ey[i]+10<=fightery+60 && e[i]+10 <=fighterx+60)
        {bx=e[i];by=ey[i];
            e[i]+=640;k-=40;l=true;v=0;}
             
        
          /*if(l){v++;}
          if(l)
          {
                 if(v<3)  {image(flame[0],bx,by);}
            else if(v<6)  {image(flame[1],bx,by);}
            else if(v<9)  {image(flame[2],bx,by);}
            else if(v<12) {image(flame[3],bx,by);}
            else if(v<15) {image(flame[4],bx,by);}
            else l=false;v=0;}
            //if(v>15){v=0;}*/
        }
        
}}
    
     if(playA==2){
    image(enemy[0],e[0],ey[0]=a);
    image(enemy[1],e[1],ey[1]=a+50*1);
    image(enemy[2],e[2],ey[2]=a+50*2);
    image(enemy[3],e[3],ey[3]=a+50*1);
    image(enemy[4],e[4],ey[4]=a);
    image(enemy[5],e[5],ey[5]=a-50*1);
    image(enemy[6],e[6],ey[6]=a-50*2);
    image(enemy[7],e[7],ey[7]=a-50*1);
    if (b >= 640) {a=(int)random(430);b=-320;for(int i=0;i<5;i++)
    {
        e[i]=-(80*i);
    }
    playA=0;}
  for(int i=0;i<8;i++)
    {
        e[i]+=3;
        if(e[i]+10 >=fighterx-5 && ey[i]+10>=fightery-20  && ey[i]+10<=fightery+60 && e[i]+10 <=fighterx+60)
        {
            e[i]+=640;k-=40;
        }
    }
     };
     case 1:
   if (playB==1) {k=-100;playA=0;b=-320;a=(int)random(430);
   image(end2,0,0);
    if(pmouseX>=100&&pmouseX<=540&&pmouseY>=300&&pmouseY<=420){
    image(end1,0,0);}
  
  
  if(mousePressed){
    if(pmouseX>=100&&pmouseX<=540&&pmouseY>=300&&pmouseY<=420)
    playA=2;//k=200;
  }break;}}
                       
  }


void keyPressed(){
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased(){
  if (key == CODED) {
      switch (keyCode) {
        case UP:
          upPressed = false;
          break;
        case DOWN:
          downPressed = false;
          break;
        case LEFT:
          leftPressed = false;
          break;
        case RIGHT:
          rightPressed = false;
          break;}}
}

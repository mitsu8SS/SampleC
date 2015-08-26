PImage img[]=new PImage[5];
int boxnum=200;

int pSize[] ={2500,2500};
int margin =40;
int playerP[]={0,0,500};
int r=100;
boolean b[]={true,true,true,true};
float theta[] ={0,0};
int SampleObj[][]=new int[boxnum][4];

void setup(){
  size(1329,907,P3D);
 noStroke();
  imageMode(CENTER);
  img[0]=  loadImage("2.png");
  img[1]=loadImage("2-5.png");
  img[2]=loadImage("3.png");
  img[3]=loadImage("1.png");
  
  //球を表示したいときに有効化
//    smpPoint();
}

void draw(){
  background(192,192,192);
 lights();
  translate(playerP[0],playerP[1]);
  theta[0]=radians((mouseX)*360/width-180);
  theta[1]=radians((mouseY)*180/height-60);
  
   camera(playerP[0], playerP[1], playerP[2],
  playerP[0]+r*cos(theta[0]), playerP[1]+r*sin(theta[1]), playerP[2]+r*sin(theta[0]),
  0.0, 1.0, 0.0);

  putObject();
}


void smpPoint(){
  //球をランダムに配置するときの座標ぎめ
  for(int i=0;i<boxnum;i++){
    for(int j=0;j<3;j++){
      SampleObj[i][j] =(int)(random(1)*5000);
    }
    SampleObj[i][3]=(int)(random(1)*200);
  }

}

void putObject(){
  
  //球をランダムに配置するサンプル
 /* 
  for(int i=0;i<boxnum;i++){
    translate(SampleObj[i][0],SampleObj[i][1],SampleObj[i][2]);
  sphere(SampleObj[i][3]); 
  translate(-SampleObj[i][0],-SampleObj[i][1],-SampleObj[i][2]);
  }
  
  */
  
  
  //画像を縦に並べて立体図もどきにしたサンプル
  for(int i=0;i<4;i++){
    if(b[i]) {
      image(img[i],0,0);
    }
    translate(0,0,margin);
  }
  translate(0,0,-margin*4);




}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
/*  if(playerP[2]<=1000 &&playerP[2]>=-1000){
    playerP[2]+=(int)-e*10;
  }else if(playerP[2]>1000){
    playerP[2]=1000;
  }else if(playerP[2]<-1000){
    playerP[2]=-1000;
  }
  */
  playerP[2]+=(int)-e*10;
}

void keyPressed() {
    if (key == 'r') {
      playerP[2]=500;
      playerP[0]=width/2;
      playerP[1]=height/2;
    } else if(key=='z'){
      b[0]=!b[0];
    }        else if(key=='x'){
      b[1]=!b[1];
    }        else if(key=='c'){
      b[2]=!b[2];
    }
            else if(key=='v'){
      b[3]=!b[3];
    }
    else if(key=='w'){
      playerP[1]=playerP[1]-10;
    }
    else if(key=='a'){
      playerP[0]=playerP[0]-10;
    }else if(key=='s'){
      playerP[1]=playerP[1]+10;
    }else if(key=='d'){
      playerP[0]=playerP[0]+10;
    }
}

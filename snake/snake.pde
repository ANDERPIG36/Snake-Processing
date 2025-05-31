int meleMangiate;
int scalaX,scalaY;

class ParteSerpente{
  int x,y;
  
  ParteSerpente(int x, int y){
    this.x=x;
    this.y=y;
  }
}
ArrayList<ParteSerpente> serpente = new ArrayList<ParteSerpente>();
ParteSerpente testa = new ParteSerpente(20,20);

class Mela{
  int x,y;
  boolean mangiata;
}
Mela mela = new Mela();

void setup(){
  size(640,640);
  scalaX=width/41;
  scalaY=width/41;
  frameRate(10);
  generaMela();
}

void draw(){
  update();
  
  background(0);
  
  //testa
  fill(0,255,0);
  rect(testa.x*scalaX,testa.y*scalaY,scalaX,scalaY);
  
  //corpo
  fill(0,240,0);
  for (ParteSerpente parte : serpente){
    rect(parte.x*scalaX,parte.y*scalaY,scalaX,scalaY);
  }
  
  //mela
  fill(255,0,0);
  rect(mela.x*scalaX,mela.y*scalaY,scalaX,scalaY);
  
  //punteggio
  textSize(scalaY);
  text("Punteggio: "+meleMangiate,16,16);
}

void update(){
  
  spostaSerpente();
  
  //controllo mela
  if(mela.mangiata){
    meleMangiate++;
    generaMela();
    //serpente.add();
  }
}

void generaMela(){
  do{
    mela.x=(int) random(40);
    mela.y=(int) random(40);
    mela.mangiata=false;
  }while(controlloGenerazioneMela());
}

boolean controlloGenerazioneMela(){
  for(ParteSerpente parte : serpente){
    if(parte.x==mela.x&&parte.y==mela.y){
      return true;
    }
  }
  return false;
}

void spostaSerpente(){
  
}

void keyPressed(){
  switch(keyCode){
    case 'W':
      break;
    case 'A':
      break;
    case 'S':
      break;
    case 'D':
      break;
  }
}

void keyReleased(){
  switch(keyCode){
    case 'W':
      break;
    case 'A':
      break;
    case 'S':
      break;
    case 'D':
      break;
  }
}

int meleMangiate;
int scalaX,scalaY;
int direzione;

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
  size(640,656);
  scalaX=width/40;
  scalaY=width/41;
  frameRate(10);
  direzione=0;
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
  
  //controlla bordi
  if(testa.x>=40||testa.x<0||testa.y>40||testa.y<0){
    morte();
  }
  
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
  switch(direzione) {
    case 0:
      testa.y-=1;
      break;
    case 1:
      testa.y+=1;
      break;
    case 2:
      testa.x+=1;
      break;
    case 3:
      testa.x-=1;
      break;
  }
}

void morte(){

}

void keyPressed(){
  switch(keyCode){
    case 'W':
      if(direzione!=1){
        direzione=0;
      }
      break;
    case 'A':
      if(direzione!=2){
        direzione=3;
      }
      break;
    case 'S':
      if(direzione!=0){
        direzione=1;
      }
      break;
    case 'D':
      if(direzione!=3){
        direzione=2;
      }
      break;
  }
}

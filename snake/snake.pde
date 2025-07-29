ArrayList<ParteSerpente> serpente;
ParteSerpente testa;

Mela mela;

int meleMangiate;
int scalaX,scalaY;
int direzione;

void setup(){
  size(640,656);
  frameRate(10);

  serpente = new ArrayList<ParteSerpente>();
  testa = new ParteSerpente(20,20);
  mela = new Mela();

  direzione=0;

  generaMela();
}

void draw(){
  update();
  
  scalaX=width/40;
  scalaY=width/40;
  
  background(0);
    
  if(direzione != -1){
    //testa
    fill(0,255,0);
    rect(testa.x*scalaX,testa.y*scalaY,scalaX,scalaY);
    
    //corpo
    fill(0,130,0);
    for (ParteSerpente parte : serpente){
      rect(parte.x*scalaX,parte.y*scalaY,scalaX,scalaY);
    }
    
    //mela
    fill(255,0,0);
    rect(mela.x*scalaX,mela.y*scalaY,scalaX,scalaY);
  }
  else{
    if((millis()/500)%2==0){
      fill(255,0,0);
    }
    else{
      fill(255);
    }
    textSize(width/10);
    text("SEI MORTO",width/2-scalaX*10,height/2+scalaY*2);
  }
    
  //punteggio
  surface.setTitle("Punteggio: " + meleMangiate);
}

void update(){
  
  spostaSerpente();
  
  //controlla bordi
  if (testa.x >= 40 || testa.x < 0 || testa.y > 40 || testa.y < 0){
    morte();
  }

  //controllo coda
  for (int i = 1; i < serpente.size(); i++) {
    ParteSerpente coda = serpente.get(i);
    if (testa.x == coda.x && testa.y == coda.y) {
      morte();
      break;
    }
  }
  
  //controllo mela
  if (mela.x == testa.x && mela.y == testa.y) {
    meleMangiate++;
    generaMela();
    aggiungiParteSerpente();
  }
}

void generaMela(){
  do{
    mela.x = (int) random(40);
    mela.y = (int) random(40);
  }while(controlloGenerazioneMela());
}

boolean controlloGenerazioneMela(){
  for(ParteSerpente parte : serpente){
    if (parte.x == mela.x && parte.y == mela.y){
      return true;
    }
  }
  return false;
}

void aggiungiParteSerpente(){
  if(serpente.size()>0) {
    ParteSerpente ultimo = serpente.get(serpente.size()-1);
    serpente.add(new ParteSerpente(ultimo.x, ultimo.y));
  }
  else{
    serpente.add(new ParteSerpente(testa.x, testa.y));
  }
}

void spostaSerpente(){
  
  //sposta corpo
  if (serpente.size()>0 && direzione!=-1) {
    for(int i=serpente.size()-1; i>0; i--) {
      serpente.get(i).x = serpente.get(i-1).x;
      serpente.get(i).y = serpente.get(i-1).y;
    }
    serpente.get(0).x = testa.x;
    serpente.get(0).y = testa.y;
  }
  
  //sposta testa
  switch(direzione) {
    case 0:
      testa.y -= 1;
      break;
    case 1:
      testa.y += 1;
      break;
    case 2:
      testa.x += 1;
      break;
    case 3:
      testa.x -= 1;
      break;
    default:
      break;	
  }
  
  
}

void morte(){
  direzione=-1;
}

void keyPressed() {
  if(direzione != -1){
    switch (keyCode) {
      case 'W':
        if (direzione!=1) {
          direzione=0;
        }
        break;
      case 'A':
        if (direzione!=2) {
          direzione=3;
        }
        break;
      case 'S':
        if (direzione!=0) {
          direzione=1;
        }
        break;
      case 'D':
        if (direzione!=3) {
          direzione=2;
        }
        break;
    }
  }
}

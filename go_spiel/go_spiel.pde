Spielfeld spielfeld;

void setup(){
  size(832,832);
  spielfeld = new Spielfeld();
}

void draw(){
  
  
}
void mouseClicked(){
  int x = mouseX/64;
  int y = mouseY/64;
  spielfeld.setze_figur(x,y);
  //spielfeld.print_spielfeld();
}

public class Spielfeld {
  int[][] spielfeld;

  int state_als_letztes_gesetzt = 2;

  Spielfeld() {
    
    erstelle_array();
    zeichne_hintergrund();
  }

  void erstelle_array() {
    int x = 13;
    int y = 13;
    spielfeld = new int[13][13];

    for (int i = 0; i < x; i++) {
      for (int j = 0; j < y; j++) {
        spielfeld[i][j] = 0;
      }
    }
  }

  void zeichne_hintergrund() {
    background(#445219);
    for (int i=1; i<13; i++) {
      line(0, 64*i, 832, 64*i); 
      line(64*i, 0, 64*i, 832);
    }
  }

  boolean ist_feld_besetzt(int feld_x, int feld_y) {
    if (spielfeld[feld_x][feld_y]==0) {
      return false;
    }
    return true;
  }
  
  boolean ueberpruefe_zwei_zusammenliegende_felder_auf_gewinn(int feld_x_1, int feld_y_1, int feld_x_2, int feld_y_2, int zahl){
    for(int i=0; i<3; i++){
      int feld_zu_ueberpruefen_x = feld_x_1+(feld_x_1-feld_x_2);
      int feld_zu_ueberpruefen_y = feld_y_1+(feld_y_1-feld_y_2);
      
      if(spielfeld[feld_zu_ueberpruefen_x][feld_zu_ueberpruefen_y]==zahl){
        continue;
      }
      else{
        return false;
      }
    }
    return true;
  }
  
  
  void gewinnueberpruefung(int feld_x, int feld_y){
    for (int i=0; i<13; i++) {
      for (int j=0; j<13; j++) {
        if(spielfeld[j][i]!=0){
          int zahl = spielfeld[j][i];
          for(int i_umliegend=i-1; i_umliegend<i+1; i_umliegend++){
            for(int j_umliegend=j-1; j_umliegend<j+1; j_umliegend++){
              if(i_umliegend==i && j_umliegend==j){
                continue;
              }
              else{
                if(ueberpruefe_zwei_zusammenliegende_felder_auf_gewinn(j,i,j_umliegend,i_umliegend, spielfeld[j][i])){
                  if(ueberpruefe_zwei_zusammenliegende_felder_auf_gewinn(j_umliegend,i_umliegend,j,i spielfeld[j][i])){
                    print("GEWINN!!");
                }
              }
            }
          }
        }
      }
    }
  }

  void setze_figur(int feld_x, int feld_y) {
    if (ist_feld_besetzt(feld_x, feld_y)) {
      return;
    }
    if (state_als_letztes_gesetzt==2) {
      spielfeld[feld_x][feld_y] = 1;
      state_als_letztes_gesetzt = 1;
      print_figur_1(feld_x, feld_y);
    } else {
      spielfeld[feld_x][feld_y] = 2;
      state_als_letztes_gesetzt = 2;
      print_figur_2(feld_x, feld_y);
    }
  }


  void print_spielfeld() {
    for (int i=0; i<13; i++) {
      for (int j=0; j<13; j++) {
        print(spielfeld[j][i]);
        print("|");
      }
      print("\n");
    }
  }
  void print_figur_2(int feld_x,int feld_y){
    fill(#000000);
    circle(feld_x*64+32,feld_y*64 +32,50);
  }
  void print_figur_1(int feld_x,int feld_y){
    fill(#ffffff);
    circle(feld_x*64 +32,feld_y*64 +32,50);
  }
}  

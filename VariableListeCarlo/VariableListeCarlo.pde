String input="";
LinListe liste;
void setup() {

  liste = new LinListe();
  /*Person person1 = new Person(1111, "00491522", "chris", "ahornweg 7", "gras");
  Person person2 = new Person(2222, "00491522", "chris", "ahornweg 7", "gras");

  liste.add(person1);
  liste.add(person2);

  liste.to_first();
  println(liste.get_content().ausgabe());
  liste.next();
  println(liste.get_content().ausgabe());*/
}

void draw() {
}


int state = 0;    // State==0 -> Normaler modus, man kann 1 oder 2 eingeben; state>=1 -> Eingabe modus, ein neuer benutzer wird eingegeben
String p_telefonnummer;
String p_name;
String p_adresse;
String p_bestellung;

void keyPressed() {
  if (keyCode>=32 && keyCode<128 && keyCode!=10) {
    input += key;
  }
  if (keyCode==10) {
    // Return gedrueckt
    //println(":" +input + ":");
    
    // Auf eingabe überprüfen
    if (input.equals("2") && state==0){  // Alle Benutzer printen
      println("Printe alle benztzer");
      liste.to_first();
      while(liste.hasAccess()){
        println(liste.get_content().ausgabe());
        liste.next();
      }
    }
    
    else if (input.equals("1") && state==0){  // Neuen Benutzer eingeben
      println("Bitte Telefonnummer eingeben");
      state +=1;
    }
    else if(state==1){
      p_telefonnummer = input;
      state+=1;
      println("Bitte Name eingeben");
    }
    else if(state==2){
      p_name = input;
      state+=1;
      println("Bitte Adresse eingeben");
    }
    else if(state==3){
      p_adresse = input;
      state+=1;
      println("Bitte Bestellung eingeben");
    }
    else if(state==4){
      p_bestellung = input;
      state=0;
      Person p_person = new Person(int( random( 1000, 10000 ) ), p_telefonnummer, p_name, p_adresse, p_bestellung);
      liste.add(p_person);
      println("\n\n\n\n\n\n\nBenutzer hinzugefügt!");
    }
    
    
    
    else    // Irgendetwas anderes, also hilfe anzeigen
      println("\n\n\n\n1 eingeben um Benutzer hinzuzufügen\n2 eingeben um alle Teilnehmer anzuzeigen");
      
    input="";
  }
  
  if (keyCode==8 && input.length()>0) {
    input = input.substring(0, input.length()-1);
  }

}

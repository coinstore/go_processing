class LinListe {
  Element anker;
  Element aktuell;

  public LinListe() {
    
  }
  void add(Person person) {
    Element e;
    e = new Element();
    e.person = person;
    e.next = anker;
    anker = e;
  }
  Person get_content(){
    return aktuell.person;
  }
  
  boolean geht_liste_weiter(){
    if(aktuell==null){
      return false; 
    }
    return true;
  }
  void next(){
     aktuell = aktuell.next;
   }
   void to_first(){
     aktuell = anker;
   }
  
}

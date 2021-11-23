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
  
  boolean hasAccess(){
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
  
  void export_to_excel(String p_dateiname){
    String data = "";
    
    to_first();
    while (hasAccess()){
      Person person = get_content();
      data = data + person.kunden_nr + "," + person.telefonnummer + "," +person.name + "," +person.adresse + "," + person.bestellung + "\n";
      next();
    }
    print(data);
    
    // Write to file
    PrintWriter output;
    output = createWriter(p_dateiname); 
    output.print(data);
    output.flush();
    output.close();
  }
  
  void import_from_excel(String p_dateiname){
    String[] lines = loadStrings(p_dateiname);
    for (int i=0; i<lines.length; i++){
      String[] liste_der_daten = split(lines[i], ',');
      Person person = new Person(Integer.parseInt(liste_der_daten[0]), liste_der_daten[1], liste_der_daten[2],liste_der_daten[3], liste_der_daten[4]);
      add(person);
    }
  }
}

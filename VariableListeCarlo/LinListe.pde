class LinListe { //<>// //<>// //<>// //<>// //<>//
  Element anker;
  Element last;

  Element aktuell;
  Element last_aktuell;

  public LinListe() {
  }

  void add(Person person) {
    Element e;
    e = new Element();
    e.person = person;
    e.next = anker;

    if (anker == null) {  // If this is the first element we added
      last = e;
    }
    anker = e;
  }

  void append(Person person) {
    Element e = new Element();
    e.person = person;
    e.next = null;

    if (last!=null) {    // Wenn es schon ein letztes element gibt
      last.next = e;
    }
    if (anker==null) { // if this is the first element we added
      anker=e;
    }

    last = e;
  } 

  void delete_aktuell() {
  }

  Person get_content() {
    return aktuell.person;
  }

  boolean hasAccess() {
    if (aktuell==null) {
      return false;
    }
    return true;
  } 


  void next() {
    last_aktuell= aktuell;
    aktuell = aktuell.next;
  }
  void to_first() {
    aktuell = anker;
  }
  void to_last() {
    aktuell = last;
  }



  void export_to_excel(String p_dateiname) {
    String data = "";

    to_first();
    while (hasAccess()) {
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

  void import_from_excel(String p_dateiname) {
    String[] lines = loadStrings(p_dateiname);
    for (int i=0; i<lines.length; i++) {
      String[] liste_der_daten = split(lines[i], ',');
      Person person = new Person(Integer.parseInt(liste_der_daten[0]), liste_der_daten[1], liste_der_daten[2], liste_der_daten[3], liste_der_daten[4]);
      add(person);
    }
  }
}

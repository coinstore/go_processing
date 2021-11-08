class LinListe {
  Element anker;

  public LinListe() {
  }
  void add(Person person) {
    Element e;
    e = new Element();
    e.person = person;
    e.next = anker;
    anker = e;
  }
}

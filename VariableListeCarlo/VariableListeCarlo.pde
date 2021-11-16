void setup(){
  LinListe liste = new LinListe();
  Person person1 = new Person(1111, "00491522", "chris", "ahornweg 7", "gras");
  Person person2 = new Person(2222, "00491522", "chris", "ahornweg 7", "gras");
  
  liste.add(person1);
  liste.add(person2);
  
  liste.to_first();
  println(liste.get_content().ausgabe());
  liste.next();
  println(liste.get_content().ausgabe());
}

void draw(){
  
}

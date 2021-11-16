class Person{
  int kunden_nr;
  String telefonnummer;
  String name;
  String adresse;
  String bestellung;
  
  Person(int p_kunden_nr, String p_telefonnummer, String p_name, String p_adresse, String p_bestellung){
    kunden_nr = p_kunden_nr;
    telefonnummer = p_telefonnummer;
    name = p_name;
    adresse = p_adresse; 
    bestellung = p_bestellung;
  }
  
  String ausgabe() {
    return kunden_nr+" "+name+", "+telefonnummer;
  }
}

main() {
  var person = new Person('Arda');
  person.printName();
}
class Person{
  String firstName;
  

  Person(this.firstName);
  /*
  Person(firstName){
    firstName = firstName;
  }*/

  printName(){
    print(firstName);
  }
}

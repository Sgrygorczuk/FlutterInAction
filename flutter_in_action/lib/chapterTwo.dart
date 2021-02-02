/*
Chapter 2 is all about getting you familiar with darts basic functionality
 */

import 'dart:io';

// ignore: camel_case_types
class chapterTwo{

  //Final objects have to be declared in the constructor
  //Final objects cannot be changed once declared but each object
  //of the class can have a different input for it
  final String finalName;
  //Const objects cannot be changed and have to be predefined
  //They save time b/c they don't need to be figured out during compile time
  static const String constName = "Jerry";

  //Never initialized string to use for null check
  String nullName;

  chapterTwo(this.finalName){
    //partOne();      //Standard initializations
    //partTwo();      //Input Output
    //partThree();    //Flow Control - If/Switch/Ternary statments
    //partFour();     //Loops
    //partFive();     //Functions
    //partSix();      //Lexical Scope
    partSeven();    //Classes
  }

  /*
  Part One starts of with simple declarations and a for loop
  */
  void partOne(){
    var name = 'Seba';
    helloDart(name);

    //Creating a list of strings, you use [] to hold them, and '' to define strings (?)
    List<String> greetings = ['World', 'Mars', 'David Bowie'];

    //var is a variable that we don't care what type it is
    //The for loop uses in to go through elements of a list
    for(var name in greetings){
      helloDart(name);
    }
  }

  /*
  Part Two deals with input/output processes
   */
  void partTwo(){
    //Gives a user a statement to react to
    stdout.writeln("Greet somebody");
    //Listens for the user input
    String input = stdin.readLineSync();
    //Use user input
    return helloDart(input);
  }

  /*
  Deals with if statement, switch cases, and ternary operator
   */
  void partThree(){
    //If statements work like normal
    int age = 40;
    if(age < 40) {print("Youngish");}
    else if(age > 40 && age < 60){print("Oldish");}
    else{print("Old");}

    //Regular switch case
    switch(age){
      case 0:{
        print("Baby");
        break;
      }
      case 40:{
        print("Youngish");
        break;
      }
      default:{
        print("Ageless");
      }
    }

    //Switch case cna be used as a fall for many if you only us
    switch(age){
      case 0:
      case 10:
      case 20:
      case 30:
      case 39:
        {
          print("Young");
          break;
        }
      case 40:
      case 50:
      case 59:
      {
        print("Youngish");
        break;
      }
      default:{
        print("Ageless");
      }
    }

    //Switch case can also be continued ot another case
    String animal = "tiger";
    switch(animal){
      case "tiger":{
        print("tiger");
        continue alsoCat;
      }
      case "lion":{
        print("lion");
        continue alsoCat;
      }
      alsoCat:
      case "cat":{
        print("cat");
        break;
      }
      default:{
        print("animal");
      }
    }

    //The ternary operator works kind of like an if statement
    //It's called that b/c it's broken down into three parts
    //First we do a check animal == 'cat' we see if this is true
    //If it is then we will assing animalName to be either Minxy if true
    //Or Fred if flase
    var animalName = animal == 'cat' ? "Minxy" : "Fred";
    print(animalName);
  }

  void partFour(){

    //Basic for loop
    for(int i = 0; i < 5; i++){print(i);}

    //Going through each element in the list without worrying about the index
    List<String> greetings = ['World', 'Mars', 'David Bowie'];
    for(var name in greetings){print(name);}

    //There is a way to go through the list using forEach seems to have changed since hte book

    //While loop does something as long as its true
    int counter = 0;
    while(counter < 1){
      print(counter);
      counter++;
    }

    //Do While will execute at least once
    counter = 0;
    do {
      print(counter);
      counter++;
    } while(counter < 0);

    //You can use continue to pass over certain indexes and break to leave the
    //loop all together
    for(int i = 0; i < 55; i++){
      if(i < 5){continue;}
      if(i == 10){break;}
      print(i);
    }
  }

  void partFive(){
    String name = "Me";

    //Positional function assume that you put inputs in with the default way
    helloDart(name); //Regular positional parameter function, requires input
    arrowDart(name); //Same but in arrow format
    //Name parameters require you to name the inputs your putting in
    namedDart(lineNum: 32, name: "Hella");
    //Optional functional can have thing that are not necessary to pass
    optionalDart("Fella");
    defaultParDart("Kal");

  }

  /*
  Shows off the lexically scoped variables, the code block has asseces
  to everything above it
   */
  String levelOne = "Hello";

  void partSix(){
    String levelTwo = "Hi";
    print(levelOne);
    nestedFunction(){
      String levelThree = "Dziendobry";
      print(levelOne);
      print(levelTwo);
      innerNestedFunction(){
        print(levelOne);
        print(levelTwo);
        print(levelThree);
        levelOne = "Goodbye";
        print(levelOne);
      }
    }
    print(levelOne);
  }

  /*
  Dealing with classes and inheritance
   */
  void partSeven(){
    Lion simba = new Lion("Simba", 200);
    simba.printRoar();
    //Enum is a collection of data used as referenc, used really well for switch cases
    print(NewColor.values);
  }

  /*
  Prints out a given string
   */
  void helloDart(String name){print("Hell, $name");}

  /*
  Single line functions can be set as arrow functions
   */
  void arrowDart(String name) => print("Hello, $name");

  /*
  Named parameter, if you want to specifically name the inputs during the initialization of the function
   */
  void namedDart({String name, int lineNum}) => print("Hello, $name @ $lineNum");

  /*
  Positional optional, you can have optional inputs using []
   */
  void optionalDart(String name, [int lineNum]) {
    if(lineNum != null) {print("Hello, $name @ $lineNum");}
    else{print("Hello, $name");}
  }

  /*
  You can pre define optional variables in case they get passed in as null
   */
  void defaultParDart(String name, [int lineNum = 20]) {
    if(lineNum != null) {print("Hello, $name @ $lineNum");}
    else{print("Hello, $name");}
  }
}

/*
Class stuff
 */

class Animal{

  String name;
  int weight;

  /*
  This is a deafult constructor
   */
  Animal(){
    name = "";
    weight = 0;
  }

  /*
  You can have different constructorr but they need the fromPlayer to extend it
   */
  Animal.fromAnimal(String name, int weight){
    this.name = name;
    this.weight = weight;
  }
}

/*
Big deal with Object oriented programming is inheritance, allows to carry
the functionality of one class but expanded it to a specific topic
 */

//Lion has the name and weight info that any animal has but also a
//function roar which noraml animals don't have
class Lion extends Animal{

  NewColor color;

  Lion(String name, int weight){
    this.weight = weight;
    this.name = name;
  }

  void setColor(NewColor color) => this.color = color;

  /*
  Factory stuff and .from gotta look into it more
   */

  void printRoar() => print("ROAR");

}

/*
Enum is a special data class that holds info in an easier way to keep track of
 */
enum NewColor{red, green, blue}
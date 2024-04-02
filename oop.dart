import 'dart:convert';
import 'dart:io';

// Define an interface
abstract class Printable {
  void printInfo();
}

// Define a base class using inheritance
class Animal {
  late String name;

  Animal(this.name);

  void makeSound() {}
}

// Define a subclass that overrides an inherited method
class Dog extends Animal implements Printable {
  late String breed;

  Dog(String name, this.breed) : super(name);

  @override
  void makeSound() {
    print('Woof!');
  }

  @override
  void printInfo() {
    print('Name: $name, Breed: $breed');
  }
}

// A method to demonstrate the use of a loop
void printMultipleTimes(Animal animal, int times) {
  for (var i = 0; i < times; i++) {
    animal.makeSound();
  }
}

// Create an instance of Dog initialized with data from a file
Dog createDogFromFile(String filename) {
  final file = File(filename);
  final jsonString = file.readAsStringSync();
  final Map<String, dynamic> data = jsonDecode(jsonString);
  final name = data['name'] ?? 'Unknown';
  final breed = data['breed'] ?? 'Unknown';
  return Dog(name, breed);
}

void main() {
  // Create a Dog instance from a file
  final dog = createDogFromFile('dog_data.json');

  // Print dog information
  dog.printInfo();

  // Demonstrate the use of a loop
  printMultipleTimes(dog, 3);
}

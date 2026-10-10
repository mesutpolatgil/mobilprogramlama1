class Animal {
  void chase(Animal a) {
    print('$runtimeType, ${a.runtimeType} hayvanını kovalıyor.');
  }

  Animal get parent => Animal();
}

class Alligator extends Animal {}

class Cat extends Animal {}

class Lion extends Cat {}

class MaineCoon extends Cat {}

class HoneyBadger extends Animal {}

class Dog extends Animal {}

class Mouse extends Animal {}

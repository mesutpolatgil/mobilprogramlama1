class Animal {
  void chase(Animal x) {
    print('Hayvan ${x.runtimeType} kovalıyor.');
  }
}

class Mouse extends Animal {
  // ...
}

class Cat extends Animal {
  @override
  void chase(covariant Mouse x) {
    print('Kedi fareyi kovalıyor.');
  }
}

void main() {
  Cat().chase(Mouse());
}

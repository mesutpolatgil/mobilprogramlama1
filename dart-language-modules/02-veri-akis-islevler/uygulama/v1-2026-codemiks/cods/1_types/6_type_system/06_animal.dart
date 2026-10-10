class Animal {
  void chase(Animal a) {
    print('$runtimeType, ${a.runtimeType} hayvanını kovalıyor.');
  }

  Animal get parent => Animal();
}

void main() {
  Animal().chase(Animal());
}

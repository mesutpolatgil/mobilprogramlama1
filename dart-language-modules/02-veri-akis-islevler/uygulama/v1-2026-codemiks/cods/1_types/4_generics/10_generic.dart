class Foo<T extends SomeBaseClass> {
  // Uygulama buraya gelir...
  String toString() => "Instance of 'Foo<$T>'";
}

class Extender extends SomeBaseClass {
  // ...
}

class SomeBaseClass {}

void main() {
  print(Foo<Extender>());
}

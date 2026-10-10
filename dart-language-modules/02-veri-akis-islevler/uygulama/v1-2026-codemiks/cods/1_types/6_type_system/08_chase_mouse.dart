// Not: Bu örnek bilerek statik analiz hatası verir.

class Mouse extends Animal {
   ...
}

class Cat extends Animal {
  @override
  void chase(Mouse a) {
     ...
  }
}

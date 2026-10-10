// Not: Bu örnek bilerek statik analiz hatası verir.

class HoneyBadger extends Animal {
  @override
  void chase(Animal a) {
     ...
  }

  @override
  Root get parent => ...
}

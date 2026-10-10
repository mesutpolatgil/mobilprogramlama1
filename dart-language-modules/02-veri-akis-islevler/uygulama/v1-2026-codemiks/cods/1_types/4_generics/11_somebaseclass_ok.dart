void main() {
  var someBaseClassFoo = Foo<SomeBaseClass>();
  var extenderFoo = Foo<Extender>();
  print(someBaseClassFoo);
  print(extenderFoo);
}

class SomeBaseClass {}

class Extender extends SomeBaseClass {}

class Foo<T extends SomeBaseClass> {
  @override
  String toString() => "Instance of 'Foo<$T>'";
}

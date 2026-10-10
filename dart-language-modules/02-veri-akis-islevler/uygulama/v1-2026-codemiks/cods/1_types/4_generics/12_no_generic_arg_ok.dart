void main() {
  var foo = Foo();
  print(foo); // Instance of 'Foo<SomeBaseClass>'
}

class SomeBaseClass {}

class Foo<T extends SomeBaseClass> {
  @override
  String toString() => "Instance of 'Foo<$T>'";
}

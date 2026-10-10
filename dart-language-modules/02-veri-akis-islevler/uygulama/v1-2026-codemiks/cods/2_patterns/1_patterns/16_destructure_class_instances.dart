void main() {
  final Foo myFoo = Foo(one: 'one', two: 2);
  var Foo(:one, :two) = myFoo;
  print('one $one, two $two');
}

class Foo {
  Foo({required this.one, required this.two});
  final String one;
  final int two;
}

void main() {
  void greet(String name, {String greeting = 'Hello'}) =>
      print('$greeting $name!');

  // `greet`'i bir değişkende sakla ve çağır.
  void Function(String, {String greeting}) g = greet;
  g('Dash', greeting: 'Howdy');
}

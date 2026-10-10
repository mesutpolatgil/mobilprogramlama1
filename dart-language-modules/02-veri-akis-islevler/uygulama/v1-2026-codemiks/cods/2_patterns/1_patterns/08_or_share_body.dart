enum Color { red, yellow, blue, green }

void main() {
  var color = Color.yellow;
  var isPrimary = switch (color) {
    Color.red || Color.yellow || Color.blue => true,
    _ => false,
  };
  print(isPrimary);
}

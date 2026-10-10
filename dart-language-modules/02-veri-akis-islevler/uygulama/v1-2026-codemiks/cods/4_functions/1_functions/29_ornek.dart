(String, int) foo() {
  return ('something', 42);
}

void main() {
  var (text, number) = foo();
  print('$text $number');
}

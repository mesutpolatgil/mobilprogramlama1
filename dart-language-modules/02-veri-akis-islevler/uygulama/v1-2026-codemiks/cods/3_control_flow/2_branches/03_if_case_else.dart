void main() {
  List<Object> pair = [3, 4];
  if (pair case [int x, int y]) {
    print('Was coordinate array $x,$y');
  } else {
    throw FormatException('Invalid coordinates.');
  }
}

(int, int) swap((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  print(swap((1, 2)));
}

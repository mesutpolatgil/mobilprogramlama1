var a = [1, 2, null, 4];
var items = [0, ...a, 5]; // [0, 1, 2, null, 4, 5]

void main() {
  print(a);
  print(items);
}

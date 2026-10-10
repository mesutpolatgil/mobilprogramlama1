const first = 2;
const last = 10;

void main() {
  for (dynamic obj in [1, 5, 42]) {
    switch (obj) {
      // 1 == obj ise eşleşir.
      case 1:
        print('one');

      // obj'nin değeri 'first' ve 'last' sabit
      // değerleri arasındaysa eşleşir.
      case >= first && <= last:
        print('in range');

      // obj iki alanlı bir record ise eşleşir,
      // sonra alanları 'a' ve 'b'ye atar.
      case (var a, var b):
        print('a = $a, b = $b');

      default:
    }
  }
}

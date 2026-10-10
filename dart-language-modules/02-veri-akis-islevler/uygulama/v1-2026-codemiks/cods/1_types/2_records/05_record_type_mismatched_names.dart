({int a, int b}) recordAB = (a: 1, b: 2);
({int x, int y}) recordXY = (x: 3, y: 4);

// Derleme hatası! Bu record'lar aynı tipte değil.
// recordAB = recordXY;

void main() {
  print(recordAB);
  print(recordXY);
}

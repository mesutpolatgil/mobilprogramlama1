void main() {
  (int a, int b) recordAB = (1, 2);
  (int x, int y) recordXY = (3, 4);

  recordAB = recordXY; // Sorun yok.
}

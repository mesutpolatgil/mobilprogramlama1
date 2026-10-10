void main() {
  // Yeni x ve y değişkenlerini Point'in x ve y özelliklerinin değerlerine bağlar.
  var Point(:x, :y) = Point(1, 2);
  print('$x $y');
}

class Point {
  Point(this.x, this.y);
  final int x;
  final int y;
}

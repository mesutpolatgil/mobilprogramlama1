Point? toPoint(List<Object> pair) {
  if (pair case [int x, int y]) return Point(x, y);
  return null;
}

void main() {
  print(toPoint([3, 4]));
  print(toPoint(['a', 4]));
}

class Point {
  Point(this.x, this.y);
  final int x, y;

  @override
  String toString() => 'Point($x, $y)';
}

class Point {
  void distanceTo(Point other) => throw UnimplementedError();
}

void main() {
  try {
    Point().distanceTo(Point());
  } on UnimplementedError {
    print('distanceTo henüz uygulanmadı.');
  }
}

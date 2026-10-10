abstract class Shape {}

class Square implements Shape {
  Square(this.size);
  final double size;
}

class Circle implements Shape {
  Circle(this.size);
  final double size;
}

void main() {
  Shape shape = Circle(3);
  switch (shape) {
    case Square(size: var s) || Circle(size: var s) when s > 0:
      print('Non-empty symmetric shape');
  }
}

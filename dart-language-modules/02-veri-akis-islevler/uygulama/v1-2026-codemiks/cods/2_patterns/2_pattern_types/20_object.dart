void main() {
  Object shape = Rect(width: 4, height: 3);
  switch (shape) {
    // shape Rect tipindeyse eşleşir, sonra Rect'in özellikleriyle karşılaştırılır.
    case Rect(width: var w, height: var h): // ...
      print('$w x $h');
  }
}

class Rect {
  Rect({required this.width, required this.height});
  final double width;
  final double height;
}

// <int>[] yazmışsınız gibi çıkarılır.
List<int> listOfInt = [];

// <double>[3.0] yazmışsınız gibi çıkarılır.
var listOfDouble = [3.0];

// Iterable<int> olarak çıkarılır.
var ints = listOfDouble.map((x) => x.toInt());

void main() {
  print(listOfInt);
  print(listOfDouble);
}

void main() {
  var pair = (3, 1);
  switch (pair) {
    case (int a, int b):
      if (a > b) print('First element greater');
    // false ise hiçbir şey yazdırmaz ve switch'ten çıkar.
    case (int a, int b) when a > b:
      // false ise hiçbir şey yazdırmaz ama sonraki case'e geçer.
      print('First element greater');
    case (int a, int b):
      print('First element not greater');
  }
}

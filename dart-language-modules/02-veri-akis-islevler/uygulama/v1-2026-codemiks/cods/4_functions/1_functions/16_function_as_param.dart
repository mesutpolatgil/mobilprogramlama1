void main() {
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];

  // printElement'i parametre olarak geçir.
  list.forEach(printElement);
}

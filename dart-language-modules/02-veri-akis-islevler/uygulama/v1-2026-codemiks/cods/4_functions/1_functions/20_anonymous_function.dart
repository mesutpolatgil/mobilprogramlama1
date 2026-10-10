void main() {
  const list = ['apples', 'bananas', 'oranges'];

  var uppercaseList = list.map((item) {
    return item.toUpperCase();
  }).toList();
  // map işleminden sonra listeye çevir

  for (var item in uppercaseList) {
    print('$item: ${item.length}');
  }
}

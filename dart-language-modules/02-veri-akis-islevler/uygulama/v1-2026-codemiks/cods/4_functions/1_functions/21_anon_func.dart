void main() {
  const list = ['apples', 'bananas', 'oranges'];
  var uppercaseList = list.map((item) => item.toUpperCase()).toList();
  print(uppercaseList);
}

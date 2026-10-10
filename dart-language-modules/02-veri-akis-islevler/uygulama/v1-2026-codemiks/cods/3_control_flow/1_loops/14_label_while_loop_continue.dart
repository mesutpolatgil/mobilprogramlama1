void main() {
  var i = 1;

  outerLoop:
  while (i <= 3) {
    var j = 1;
    while (j <= 3) {
      if (i == 2 && j == 2) {
        i++;
        continue outerLoop;
      }
      print('i = $i, j = $j');
      j++;
    }
    i++;
  }
}

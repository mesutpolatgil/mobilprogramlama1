void main() {
  var i = 1;

  outerLoop:
  do {
    var j = 1;
    do {
      if (i == 2 && j == 2) {
        i++;
        continue outerLoop;
      }
      print('i = $i, j = $j');
      j++;
    } while (j <= 3);
    i++;
  } while (i <= 3);
}

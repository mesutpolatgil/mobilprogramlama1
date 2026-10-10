void main() {
  var i = 1;

  outerLoop:
  do {
    var j = 1;
    do {
      print('i = $i, j = $j');
      if (i == 2 && j == 2) {
        break outerLoop;
      }
      j++;
    } while (j <= 3);
    i++;
  } while (i <= 3);

  print('outerLoop exited');
}

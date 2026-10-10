void main() {
  var i = 1;

  outerLoop:
  while (i <= 3) {
    var j = 1;
    while (j <= 3) {
      print('i = $i, j = $j');
      if (i == 2 && j == 2) {
        break outerLoop;
      }
      j++;
    }
    i++;
  }
  print('outerLoop exited');
}

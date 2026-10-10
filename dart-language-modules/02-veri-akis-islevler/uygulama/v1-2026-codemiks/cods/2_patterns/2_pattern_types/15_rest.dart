void main() {
  var [a, b, ..., c, d] = [1, 2, 3, 4, 5, 6, 7];
  // "1 2 6 7" yazdırır.
  print('$a $b $c $d');
}

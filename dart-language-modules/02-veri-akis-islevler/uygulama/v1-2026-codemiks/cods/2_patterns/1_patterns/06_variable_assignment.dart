void main() {
  var (a, b) = ('left', 'right');
  (b, a) = (a, b); // Yer değiştir.
  print('$a $b'); // "right left" yazdırır.
}

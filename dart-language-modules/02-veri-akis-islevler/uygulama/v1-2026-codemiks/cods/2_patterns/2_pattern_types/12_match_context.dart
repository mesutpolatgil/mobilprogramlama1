void main() {
  const c = 1;
  switch (2) {
    case c:
      print('match $c');
    default:
      print('no match'); // "no match" yazdırır.
  }
}

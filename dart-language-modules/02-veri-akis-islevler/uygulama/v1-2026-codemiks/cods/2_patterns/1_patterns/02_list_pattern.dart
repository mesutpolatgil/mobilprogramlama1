void main() {
  Object obj = ['a', 'b'];
  const a = 'a';
  const b = 'b';
  switch (obj) {
    // [a, b] list deseni, obj iki alanlı bir liste ise önce obj ile eşleşir,
    // sonra alanları 'a' ve 'b' sabit alt desenleriyle eşleşirse.
    case [a, b]:
      print('$a, $b');
  }
}

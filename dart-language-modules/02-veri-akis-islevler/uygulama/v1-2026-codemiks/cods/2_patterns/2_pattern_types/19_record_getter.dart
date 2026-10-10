void main() {
  var record = (untyped: 1, typed: 2);

  // Değişken alt desenli record deseni:
  {
    var (untyped: untyped, typed: int typed) = record;
    print('$untyped $typed');
  }
  {
    var (:untyped, :int typed) = record;
    print('$untyped $typed');
  }

  switch (record) {
    case (untyped: var untyped, typed: int typed): // ...
      print('$untyped $typed');
  }
  switch (record) {
    case (:var untyped, :int typed): // ...
      print('$untyped $typed');
  }

  // null-check ve null-assert alt desenli record deseni:
  ({int? checked, int? asserted}) nullable = (checked: 1, asserted: 2);
  switch (nullable) {
    case (checked: var checked?, asserted: var asserted!): // ...
      print('$checked $asserted');
  }
  switch (nullable) {
    case (:var checked?, :var asserted!): // ...
      print('$checked $asserted');
  }

  // cast alt desenli record deseni:
  ({Object untyped, Object typed}) mixed = (untyped: 1, typed: 'iki');
  {
    var (untyped: untyped as int, typed: typed as String) = mixed;
    print('$untyped $typed');
  }
  {
    var (:untyped as int, :typed as String) = mixed;
    print('$untyped $typed');
  }
}

const x = true;
const y = true;
const z = false;

void main() {
  for (var value in [true, false]) {
    var result = switch (value) {
      // ...
      x || y => 'matches true',
      x || y && z => 'matches true',
      x || (y && z) => 'matches true',
      // `x || y && z`, `x || (y && z)` ile aynı şeydir.
      (x || y) && z => 'matches nothing',
      // ...
      _ => 'no match',
    };
    print('$value: $result');
  }
}

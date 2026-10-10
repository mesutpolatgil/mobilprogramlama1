const a = 'a';
const b = 'b';

void main() {
  for (Object value in [
    ['a', 'b'],
    const ['a', 'b'],
  ]) {
    switch (value) {
      // List ya da map deseni:
      case [a, b]: // ...
        print('list deseni eşleşti');
    }

    switch (value) {
      // List ya da map literal'i:
      case const [a, b]: // ...
        print('const list literal eşleşti');
    }
  }
}

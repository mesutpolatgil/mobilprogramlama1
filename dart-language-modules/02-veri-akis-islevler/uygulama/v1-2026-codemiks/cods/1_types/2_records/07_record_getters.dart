void main() {
  var record = ('first', a: 2, b: true, 'last');

  print(record.$1); // 'first' yazdırır
  print(record.a); // 2 yazdırır
  print(record.b); // true yazdırır
  print(record.$2); // 'last' yazdırır
}

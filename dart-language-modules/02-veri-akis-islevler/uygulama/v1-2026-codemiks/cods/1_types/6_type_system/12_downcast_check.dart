int assumeString(dynamic object) {
  String string = object; // `object`'in bir `String` olduğunu çalışma zamanında kontrol et.
  return string.length;
}

void main() {
  print(assumeString('merhaba'));
}

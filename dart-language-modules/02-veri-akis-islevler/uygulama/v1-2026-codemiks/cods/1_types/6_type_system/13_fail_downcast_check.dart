// Not: Bu örnek bilerek çalışma zamanında hata verir.


void main() {
  final length = assumeString(1);
  print(length);
}

int assumeString(dynamic object) {
  String string = object;
  return string.length;
}

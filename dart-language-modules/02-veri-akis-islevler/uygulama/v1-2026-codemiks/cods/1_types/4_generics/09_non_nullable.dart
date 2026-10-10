class Foo<T extends Object> {
  // Foo'ya T için verilen her tip null olamaz (non-nullable) olmalıdır.
}

void main() {
  print(Foo<String>());
}

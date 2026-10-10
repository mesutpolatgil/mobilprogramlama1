// Not: Bu örnek bilerek statik analiz hatası verir.


void main() {
  bool? nullableBool = true;
  // bool? üzerinde kapsayıcı olmayan switch, null olasılığını karşılayan case eksik:
  switch (nullableBool) {
    case true:
      print('yes');
    case false:
      print('no');
  }
}

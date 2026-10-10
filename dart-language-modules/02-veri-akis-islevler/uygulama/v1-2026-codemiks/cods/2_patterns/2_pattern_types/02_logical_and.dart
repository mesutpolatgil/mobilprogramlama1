// Not: Bu örnek bilerek statik analiz hatası verir.


void main() {
  switch ((1, 2)) {
    // Hata, iki alt desen de 'b'yi bağlamaya çalışıyor.
    case (var a, var b) && (var b, var c): // ...
  }
}

// Not: Bu örnek bilerek doğrulama (assert) hatası verir; mesajı görmek için.
// Çalıştırmak için: dart run --enable-asserts 11_assert_with_message.dart

void main() {
  var urlString = 'http://dart.dev';
  assert(
    urlString.startsWith('https'),
    'URL ($urlString) should start with "https".',
  );
  print(urlString);
}

// Çalıştırırken doğrulamaları açmak için: dart run --enable-asserts 10_assert.dart
void main() {
  String? text = 'merhaba';
  var number = 42;
  var urlString = 'https://dart.dev';

  // Değişkenin null olmayan bir değeri olduğundan emin ol.
  assert(text != null);

  // Değerin 100'den küçük olduğundan emin ol.
  assert(number < 100);

  // Bunun bir https URL'si olduğundan emin ol.
  assert(urlString.startsWith('https'));

  print('Tüm doğrulamalar geçti.');
}

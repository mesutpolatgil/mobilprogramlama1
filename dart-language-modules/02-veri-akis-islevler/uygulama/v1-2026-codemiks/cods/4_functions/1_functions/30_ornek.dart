// Tanımlayıcısı alt çizgiyle (`_`) başladığı için kütüphaneye özel olan
// `_secret` adlı bir değişken tanımlar.
String _secret = 'Hello';

// [_secret]'a okuma erişimi sağlayan
// public, üst düzey bir getter.
String get secret {
  print('Getter was used!');
  return _secret.toUpperCase();
}

// [_secret]'a yazma erişimi sağlayan
// public, üst düzey bir setter.
set secret(String newMessage) {
  print('Setter was used!');
  if (newMessage.isNotEmpty) {
    _secret = newMessage;
    print('New secret: "$newMessage"');
  }
}

void main() {
  // Değeri okumak getter'ı çağırır.
  print('Current message: $secret');

  /*
  Çıktı:
  Getter was used!
  Current message: HELLO
  */

  // Değer atamak setter'ı çağırır.
  secret = 'Dart is fun';

  // Tekrar okumak, yeni hesaplanan değeri göstermek için getter'ı çağırır
  print('New message: $secret');

  /*
  Çıktı:
  Setter was used! New secret: "Dart is fun"
  Getter was used!
  New message: DART IS FUN
  */
}

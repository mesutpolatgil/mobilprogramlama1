// Çalıştırırken doğrulamaları açmak için: dart run --enable-asserts 11_call_without_optional_param.dart
void main() {
  assert(say('Bob', 'Howdy') == 'Bob says Howdy');
  print(say('Bob', 'Howdy'));
}

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

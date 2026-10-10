// Çalıştırırken doğrulamaları açmak için: dart run --enable-asserts 12_call_with_optional_param.dart
void main() {
  assert(
    say('Bob', 'Howdy', 'smoke signal') ==
        'Bob says Howdy with a smoke signal',
  );
  print(say('Bob', 'Howdy', 'smoke signal'));
}

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

void main() {
  print(say('Bob', 'Howdy'));
  print(say('Bob', 'Howdy', 'smoke signal'));
}

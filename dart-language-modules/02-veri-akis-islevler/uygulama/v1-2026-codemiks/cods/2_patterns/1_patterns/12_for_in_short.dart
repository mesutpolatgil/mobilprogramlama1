void main() {
  Map<String, int> hist = {'a': 23, 'b': 100};

  for (var MapEntry(:key, value: count) in hist.entries) {
    print('$key occurred $count times');
  }
}

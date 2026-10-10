void main() {
  repeat(times: 2, () {
    print('Merhaba');
  });
}

void repeat(void Function() action, {required int times}) {
  for (var i = 0; i < times; i++) {
    action();
  }
}

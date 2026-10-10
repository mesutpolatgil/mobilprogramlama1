import '../../_ortak/hayvanlar.dart' hide HoneyBadger;


class HoneyBadger extends Animal {
  @override
  void chase(Object a) {
    print('Bal porsuğu ${a.runtimeType} kovalıyor.');
  }

  @override
  Animal get parent => Animal();
}

void main() {
  HoneyBadger().chase('her şeyi');
}

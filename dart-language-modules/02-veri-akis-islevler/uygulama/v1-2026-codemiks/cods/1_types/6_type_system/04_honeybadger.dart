import '../../_ortak/hayvanlar.dart' hide HoneyBadger;


class HoneyBadger extends Animal {
  @override
  void chase(Animal a) {
    print('Bal porsuğu ${a.runtimeType} kovalıyor.');
  }

  @override
  HoneyBadger get parent => HoneyBadger();
}

void main() {
  HoneyBadger().chase(Cat());
  print(HoneyBadger().parent.runtimeType);
}

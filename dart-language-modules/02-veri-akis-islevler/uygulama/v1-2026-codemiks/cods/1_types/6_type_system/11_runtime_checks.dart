// Not: Bu örnek bilerek çalışma zamanında hata verir.

import '../../_ortak/hayvanlar.dart';


void main() {
  List<Animal> animals = <Dog>[Dog()];
  List<Cat> cats = animals as List<Cat>;
  print(cats);
}

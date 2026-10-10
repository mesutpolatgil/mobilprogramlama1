// Not: Bu örnek bilerek statik analiz hatası verir.

import '../../_ortak/hayvanlar.dart';


void main() {
  List<Cat> foo = <dynamic>[Dog()]; // Hata
  List<dynamic> bar = <dynamic>[Dog(), Cat()]; // Sorun yok
}

// Not: Bu örnek bilerek statik analiz hatası verir.

var names = <String>[];
names.addAll(['Seth', 'Kathy', 'Lars']);
names.add(42); // Hata

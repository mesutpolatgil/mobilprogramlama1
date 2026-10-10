// Not: Bu bir sözdizimi şablonudur, çalıştırılabilir Dart kodu değildir.

List<int>? a = null;
var b = [1, null, 3];
var items = [0, ...?a, ...?b, 4]; // [0, 1, null, 3, 4]

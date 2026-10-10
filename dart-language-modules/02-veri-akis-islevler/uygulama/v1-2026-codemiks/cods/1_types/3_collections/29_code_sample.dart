// Not: Bu örnek bilerek statik analiz hatası verir.

List<String> buildCommandLine(
  String executable,
  List<String> options, [
  List<String>? extraOptions,
]) {
  return [
    executable,
    ...options,
    ...extraOptions, // <-- Hata
  ];
}

// Kullanım:
//   buildCommandLine('dart', ['run', 'my_script.dart'], null);
// Sonuç:
//   Derleme zamanı hatası

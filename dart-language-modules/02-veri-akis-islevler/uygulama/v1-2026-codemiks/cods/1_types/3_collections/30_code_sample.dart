List<String> buildCommandLine(
  String executable,
  List<String> options, [
  List<String>? extraOptions,
]) {
  return [
    executable,
    ...options,
    ...?extraOptions, // <-- Artık sorun yok.
  ];
}

// Kullanım:
//   buildCommandLine('dart', ['run', 'my_script.dart'], null);
// Sonuç:
//   [dart, run, my_script.dart]

void main() {
  print(buildCommandLine('dart', ['run', 'my_script.dart'], null));
}

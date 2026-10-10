(num, Object) pair = (42, 'a');

var first = pair.$1; // Statik tip `num`, çalışma zamanı tipi `int`.
var second = pair.$2; // Statik tip `Object`, çalışma zamanı tipi `String`.

void main() {
  print(pair);
  print(first);
  print(second);
}

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

void main() async {
  await for (var k in asynchronousNaturalsTo(5)) {
    print(k);
  }
}

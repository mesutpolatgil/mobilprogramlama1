void main() {
  while (!isDone()) {
    doSomething();
  }
}

var counter = 0;
bool isDone() => counter >= 3;
void doSomething() => print('Adım ${++counter}');

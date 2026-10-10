void main() {
  do {
    printLine();
  } while (!atEndOfPage());
}

var line = 0;
void printLine() => print('Satır ${++line}');
bool atEndOfPage() => line >= 3;

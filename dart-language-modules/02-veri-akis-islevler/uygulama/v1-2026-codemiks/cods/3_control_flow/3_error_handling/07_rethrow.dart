void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Çalışma zamanı hatası
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // Çağıranların istisnayı görmesine izin ver.
  }
}

void main() {
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}

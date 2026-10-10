// Not: Bu örnek bilerek çalışma zamanında hata verir.

void main() {
  List<String?> row = ['user', null];
  switch (row) {
    case ['user', var name!]: // ...
    // 'name' burada null olamayan bir string'dir.
  }
}

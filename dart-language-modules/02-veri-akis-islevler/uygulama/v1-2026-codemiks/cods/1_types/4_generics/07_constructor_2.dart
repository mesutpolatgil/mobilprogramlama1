import 'dart:collection';

void main() {
  var views = SplayTreeMap<int, View>();
  views[2] = View('Ayarlar');
  views[1] = View('Ana sayfa');
  print(views);
}

class View {
  View(this.name);
  final String name;

  @override
  String toString() => name;
}

import '../../_ortak/flutter_taklit.dart';


extension type ButtonItem._(({String label, Icon icon, void Function()? onPressed}) _) {
  String get label => _.label;
  Icon get icon => _.icon;
  void Function()? get onPressed => _.onPressed;
  ButtonItem({required String label, required Icon icon, void Function()? onPressed})
      : this._((label: label, icon: icon, onPressed: onPressed));
  bool get hasOnPressed => _.onPressed != null;
}

void main() {
  final item = ButtonItem(label: 'Button I', icon: const Icon(Icons.info), onPressed: () {});
  print('${item.label} ${item.hasOnPressed}');
}

import '../../_ortak/flutter_taklit.dart';


class ButtonItem {
  final String label;
  final Icon icon;
  final void Function()? onPressed;
  ButtonItem({required this.label, required this.icon, this.onPressed});
  bool get hasOnPressed => onPressed != null;
}

void main() {
  final item = ButtonItem(label: 'Button I', icon: const Icon(Icons.info));
  print(item.hasOnPressed);
}

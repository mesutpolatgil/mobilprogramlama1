import '../../_ortak/flutter_taklit.dart';


typedef ButtonItem = ({String label, Icon icon, void Function()? onPressed});
final List<ButtonItem> buttons = [
  // ...
];

void main() {
  print(buttons.length);
}

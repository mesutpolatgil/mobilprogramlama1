import '../../_ortak/flutter_taklit.dart';


List<Container> widget = [
  for (var button in buttons)
    Container(
      margin: const EdgeInsets.all(4.0),
      child: OutlinedButton.icon(
        onPressed: button.onPressed,
        icon: button.icon,
        label: Text(button.label),
      ),
    ),
];

void main() {
  print(widget.length);
}

typedef ButtonItem = ({String label, Icon icon, void Function()? onPressed});

final List<ButtonItem> buttons = [
  (label: "Button I", icon: const Icon(Icons.upload_file), onPressed: () => print("Action -> Button I")),
  (label: "Button II", icon: const Icon(Icons.info), onPressed: () => print("Action -> Button II")),
];

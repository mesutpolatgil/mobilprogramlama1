import '../../_ortak/flutter_taklit.dart';


final buttons = [
  (
    label: "Button I",
    icon: const Icon(Icons.upload_file),
    onPressed: () => print("Action -> Button I"),
  ),
  (
    label: "Button II",
    icon: const Icon(Icons.info),
    onPressed: () => print("Action -> Button II"),
  )
];

void main() {
  for (final button in buttons) {
    print(button.label);
    button.onPressed();
  }
}

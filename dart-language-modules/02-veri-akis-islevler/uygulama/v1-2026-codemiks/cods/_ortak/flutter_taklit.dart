class Key {
  const Key(this.value);
  final String value;
}

class Widget {
  const Widget({this.key});
  final Key? key;
}

class StatelessWidget extends Widget {
  const StatelessWidget({super.key});
}

class IconData {
  const IconData(this.codePoint);
  final int codePoint;
}

class Icons {
  static const upload_file = IconData(0xe6a2);
  static const info = IconData(0xe33c);
}

class Icon extends Widget {
  const Icon(this.icon, {super.key});
  final IconData icon;
}

class Text extends Widget {
  const Text(this.data, {super.key});
  final String data;
}

class EdgeInsets {
  const EdgeInsets.all(this.value);
  final double value;
}

class Container extends Widget {
  const Container({super.key, this.margin, this.child});
  final EdgeInsets? margin;
  final Widget? child;
}

class OutlinedButton extends Widget {
  const OutlinedButton.icon({super.key, required this.onPressed, required this.icon, required this.label});
  final void Function()? onPressed;
  final Widget icon;
  final Widget label;
}

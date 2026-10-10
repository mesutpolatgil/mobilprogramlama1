import '../../_ortak/flutter_taklit.dart';


class Scrollbar extends StatelessWidget {
  const Scrollbar({super.key, required Widget child});
}

void main() {
  const scrollbar = Scrollbar(child: Text('İçerik'));
  print(scrollbar.runtimeType);
}

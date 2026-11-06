import 'package:flutter_test/flutter_test.dart';
import 'package:Lumina/main.dart';

void main() {
  testWidgets('Lumina açılıyor', (tester) async {
    await tester.pumpWidget(const LuminaApp());
    expect(find.text('Lumina'), findsOneWidget);
  });
}
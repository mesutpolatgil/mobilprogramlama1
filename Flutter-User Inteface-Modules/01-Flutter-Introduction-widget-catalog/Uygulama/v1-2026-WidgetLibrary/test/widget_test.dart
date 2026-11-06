import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/core/providers/storage_provider.dart';
import 'package:flutter_ui_catalog/core/services/storage_service.dart';
import 'package:flutter_ui_catalog/main.dart';

void main() {
  testWidgets('app boots into the widget catalog dashboard',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          storageServiceProvider.overrideWithValue(StorageService(null)),
        ],
        child: const FlutterCatalogApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Flutter Widget Atölyesi'), findsWidgets);
    expect(find.text('Kategoriler'), findsOneWidget);
  });
}

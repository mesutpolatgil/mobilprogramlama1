import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/core/providers/storage_provider.dart';
import 'package:flutter_ui_catalog/core/services/storage_service.dart';
import 'package:flutter_ui_catalog/core/theme/theme.dart';
import 'package:flutter_ui_catalog/features/catalog/data/catalog_repository.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/screens/home_dashboard_screen.dart';
import 'package:flutter_ui_catalog/features/playground/domain/code_generator.dart';
import 'package:flutter_ui_catalog/features/playground/domain/playground_config.dart';
import 'package:flutter_ui_catalog/features/playground/presentation/playground_registry.dart';
import 'package:flutter_ui_catalog/features/playground/presentation/screens/widget_playground_screen.dart';

void main() {
  group('Catalog Repository Tests', () {
    final repository = CatalogRepositoryImpl();

    test('should return exactly 14 official categories', () {
      final categories = repository.getCategories();
      expect(categories.length, 14);
    });

    test('should return all widgets across categories', () {
      final widgets = repository.getAllWidgets();
      expect(widgets.isNotEmpty, true);
      expect(widgets.any((w) => w.id == 'container'), true);
      expect(widgets.any((w) => w.id == 'elevated_button'), true);
      expect(widgets.any((w) => w.id == 'animated_container'), true);
    });

    test('should filter widgets by category and subcategory', () {
      final basics = repository.getWidgetsByCategory('basics');
      expect(basics.isNotEmpty, true);

      final structural =
          repository.getWidgetsByCategory('basics', subCategory: 'Yapısal');
      expect(structural.every((w) => w.subCategory == 'Yapısal'), true);
    });

    test('search should match query in name, tags, or description', () {
      final results = repository.searchWidgets('button');
      expect(results.any((w) => w.name.toLowerCase().contains('button')), true);
    });
  });

  group('Playground Registry Tests', () {
    final repository = CatalogRepositoryImpl();

    test('every playground-ready widget has a complete spec', () {
      final ready = repository
          .getAllWidgets()
          .where((widget) => widget.isPlaygroundReady);

      for (final widget in ready) {
        expect(
          PlaygroundRegistry.forWidget(widget.id),
          isNotNull,
          reason: 'Missing playground spec for ${widget.id}',
        );
      }
    });

    test('reference-only widgets have no interactive spec', () {
      const referenceIds = [
        'scaffold',
        'navigation_bar',
        'future_builder',
        'theme_widget',
        'semantics',
        'cupertino_tab_scaffold',
        'sliver_app_bar',
        'form',
      ];

      for (final id in referenceIds) {
        expect(PlaygroundRegistry.forWidget(id), isNull, reason: id);
      }
    });
  });

  group('Playground Code Generator Tests', () {
    final repository = CatalogRepositoryImpl();

    test('generates Container code from the current config', () {
      final containerWidget = repository.getWidgetById('container')!;
      const config = PlaygroundConfig(
        width: 200,
        height: 150,
        padding: 24,
        borderRadius: 12,
        primaryColor: Color(0xFF3B5BDB),
        text: 'Sample Label',
      );

      final code = PlaygroundCodeGenerator.generate(containerWidget, config);
      expect(code.contains('width: 200'), true);
      expect(code.contains('height: 150'), true);
      expect(code.contains('BorderRadius.circular(12)'), true);
      expect(code.contains('Sample Label'), true);
    });

    test('generates Text code with real typography properties', () {
      final textWidget = repository.getWidgetById('text_widget')!;
      const config = PlaygroundConfig(
        text: 'Hello Flutter',
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.5,
        textColor: Color(0xFF3B5BDB),
      );

      final code = PlaygroundCodeGenerator.generate(textWidget, config);
      expect(code.contains("'Hello Flutter'"), true);
      expect(code.contains('fontSize: 32.0'), true);
      expect(code.contains('FontWeight.w700'), true);
      expect(code.contains('letterSpacing: 1.5'), true);
      expect(code.contains('Color(0xFF3B5BDB)'), true);
    });

    test('generates animation code with duration and curve', () {
      final animatedWidget = repository.getWidgetById('animated_container')!;
      const config = PlaygroundConfig(
        animationDurationMs: 800,
        curve: AnimationCurveOption.bounceOut,
      );

      final code = PlaygroundCodeGenerator.generate(animatedWidget, config);
      expect(code.contains('milliseconds: 800'), true);
      expect(code.contains('Curves.bounceOut'), true);
    });

    test('generates layout code with alignment and spacing', () {
      final rowWidget = repository.getWidgetById('row')!;
      const config = PlaygroundConfig(
        childCount: 3,
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      );

      final code = PlaygroundCodeGenerator.generate(rowWidget, config);
      expect(code.contains('Row('), true);
      expect(code.contains('MainAxisAlignment.spaceBetween'), true);
      expect(code.contains('SizedBox(width: 16)'), true);
    });
  });

  group('Catalog Provider Tests', () {
    test('interactive filter keeps only playground-ready widgets', () {
      final container = ProviderContainer(
        overrides: [
          storageServiceProvider.overrideWithValue(StorageService(null)),
        ],
      );
      addTearDown(container.dispose);

      expect(container.read(activeFilterChipProvider), CatalogFilterChip.all);

      container.read(activeFilterChipProvider.notifier).state =
          CatalogFilterChip.interactive;

      final filtered = container.read(filteredCatalogWidgetsProvider);
      expect(filtered, isNotEmpty);
      expect(filtered.every((widget) => widget.isPlaygroundReady), true);
    });
  });

  group('Playground Widget Tests', () {
    Widget wrap(Widget child) {
      return ProviderScope(
        overrides: [
          storageServiceProvider.overrideWithValue(StorageService(null)),
        ],
        child: MaterialApp(
          theme: AppTheme.light(),
          home: child,
        ),
      );
    }

    testWidgets('Text playground exposes Text-specific controls',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        wrap(const WidgetPlaygroundScreen(widgetId: 'text_widget')),
      );
      await tester.pump();

      expect(find.text('Canlı önizleme'), findsOneWidget);
      expect(find.text('Özellikleri ayarlamak için dokun'), findsOneWidget);

      await tester.tap(find.text('Kontroller'));
      await tester.pumpAndSettle();

      expect(find.text('Yazı boyutu'), findsOneWidget);
      expect(find.text('Yazı kalınlığı'), findsOneWidget);
      expect(find.text('Harf aralığı'), findsOneWidget);
      expect(find.text('Canlı önizleme'), findsOneWidget);
      expect(find.text('Dart kodu'), findsOneWidget);
    });

    testWidgets('Animation playground triggers a real state change',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        wrap(const WidgetPlaygroundScreen(widgetId: 'animated_container')),
      );
      await tester.pump();

      await tester.tap(find.text('Kontroller'));
      await tester.pumpAndSettle();

      expect(find.text('Süre'), findsOneWidget);
      expect(find.text('Eğri'), findsOneWidget);
      expect(find.text('Genişlet'), findsOneWidget);

      await tester.tap(find.text('Genişlet'));
      await tester.pumpAndSettle();

      expect(find.text('Daralt'), findsOneWidget);
    });

    testWidgets('Reference widget renders a focused reference view',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        wrap(const WidgetPlaygroundScreen(widgetId: 'scaffold')),
      );
      await tester.pump();

      expect(find.text('Referans görünüm'), findsOneWidget);
      expect(find.text('Salt okunur'), findsOneWidget);
      expect(find.text('Kontroller'), findsNothing);
    });

    testWidgets('every interactive playground renders without exceptions',
        (WidgetTester tester) async {
      for (final widgetId in PlaygroundRegistry.interactiveWidgetIds) {
        await tester.pumpWidget(
          wrap(WidgetPlaygroundScreen(widgetId: widgetId)),
        );
        await tester.pump();

        expect(tester.takeException(), isNull, reason: widgetId);
        expect(
          find.text('Canlı önizleme'),
          findsOneWidget,
          reason: widgetId,
        );
      }
    });

    testWidgets('every reference widget renders without exceptions',
        (WidgetTester tester) async {
      const referenceIds = [
        'scaffold',
        'navigation_bar',
        'future_builder',
        'theme_widget',
        'semantics',
        'cupertino_tab_scaffold',
        'sliver_app_bar',
        'form',
      ];

      for (final widgetId in referenceIds) {
        await tester.pumpWidget(
          wrap(WidgetPlaygroundScreen(widgetId: widgetId)),
        );
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));
        await tester.pump();

        expect(tester.takeException(), isNull, reason: widgetId);
        expect(
          find.text('Referans görünüm'),
          findsOneWidget,
          reason: widgetId,
        );
      }
    });

    testWidgets('Home dashboard renders the catalog header and categories',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1200, 2200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(wrap(const HomeDashboardScreen()));
      await tester.pump();

      expect(find.text('Flutter Widget Atölyesi'), findsWidgets);
      expect(find.text('Kategoriler'), findsOneWidget);
      expect(find.text('Temeller'), findsWidgets);
    });
  });
}

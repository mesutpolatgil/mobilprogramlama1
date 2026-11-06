import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/features/catalog/data/catalog_data.dart';
import 'package:flutter_ui_catalog/features/catalog/data/catalog_extra_data.dart';

void main() {
  group('Catalog data integrity', () {
    final widgets = CatalogData.widgets;

    test('all widget ids are unique', () {
      final ids = widgets.map((widget) => widget.id).toList();
      expect(ids.toSet().length, ids.length);
    });

    test('every widget has a valid category and subcategory', () {
      const categories = CatalogData.categories;

      for (final widget in widgets) {
        final category = categories.where((c) => c.id == widget.categoryId);
        expect(category.length, 1, reason: widget.id);

        final subcategories =
            category.first.subCategories.map((name) => name.toLowerCase());
        expect(
          subcategories.contains(widget.subCategory.toLowerCase()),
          true,
          reason: '${widget.id} -> ${widget.subCategory}',
        );
      }
    });

    test('every catalog category has reference widgets', () {
      for (final category in CatalogData.categories) {
        expect(
          widgets.any((widget) => widget.categoryId == category.id),
          true,
          reason: category.id,
        );
      }
    });

    test('extra widgets are reference-only and always have an icon', () {
      for (final widget in CatalogExtraData.widgets) {
        expect(widget.isPlaygroundReady, false, reason: widget.id);
        expect(widget.icon, isNotNull, reason: widget.id);
        expect(widget.defaultCodeSnippet.isNotEmpty, true, reason: widget.id);
      }
    });

    test('merged catalog contains curated and reference entries', () {
      expect(widgets.length, greaterThan(200));
      expect(widgets.any((widget) => widget.id == 'container'), true);
      expect(
          widgets.any((widget) => widget.id == 'cupertino_tab_scaffold'), true);
      expect(widgets.any((widget) => widget.id == 'sliver_app_bar'), true);
    });
  });
}

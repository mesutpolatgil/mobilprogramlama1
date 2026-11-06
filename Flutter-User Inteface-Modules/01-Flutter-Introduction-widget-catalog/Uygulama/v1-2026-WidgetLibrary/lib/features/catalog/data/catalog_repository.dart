import '../domain/models/widget_category.dart';
import '../domain/models/widget_item.dart';
import 'catalog_data.dart';

abstract class CatalogRepository {
  List<WidgetCategory> getCategories();
  WidgetCategory? getCategoryById(String id);
  List<WidgetItem> getAllWidgets();
  List<WidgetItem> getWidgetsByCategory(String categoryId,
      {String? subCategory});
  WidgetItem? getWidgetById(String id);
  List<WidgetItem> searchWidgets(String query);
  WidgetItem getFeaturedWidget();
}

class CatalogRepositoryImpl implements CatalogRepository {
  @override
  List<WidgetCategory> getCategories() {
    return CatalogData.categories;
  }

  @override
  WidgetCategory? getCategoryById(String id) {
    try {
      return CatalogData.categories.firstWhere((cat) => cat.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  List<WidgetItem> getAllWidgets() {
    return CatalogData.widgets;
  }

  @override
  List<WidgetItem> getWidgetsByCategory(String categoryId,
      {String? subCategory}) {
    return CatalogData.widgets.where((w) {
      if (w.categoryId != categoryId) return false;
      if (subCategory != null &&
          subCategory.isNotEmpty &&
          subCategory != 'All') {
        return w.subCategory.toLowerCase() == subCategory.toLowerCase();
      }
      return true;
    }).toList();
  }

  @override
  WidgetItem? getWidgetById(String id) {
    try {
      return CatalogData.widgets.firstWhere((w) => w.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  List<WidgetItem> searchWidgets(String query) {
    final clean = query.trim().toLowerCase();
    if (clean.isEmpty) return getAllWidgets();

    return CatalogData.widgets.where((w) {
      final matchName = w.name.toLowerCase().contains(clean);
      final matchDesc = w.description.toLowerCase().contains(clean);
      final matchTags = w.tags.any((t) => t.toLowerCase().contains(clean));
      final matchCategory = w.categoryId.toLowerCase().contains(clean);
      return matchName || matchDesc || matchTags || matchCategory;
    }).toList();
  }

  @override
  WidgetItem getFeaturedWidget() {
    // Return AnimatedContainer or Container as featured
    return CatalogData.widgets.firstWhere(
      (w) => w.id == 'animated_container',
      orElse: () => CatalogData.widgets.first,
    );
  }
}

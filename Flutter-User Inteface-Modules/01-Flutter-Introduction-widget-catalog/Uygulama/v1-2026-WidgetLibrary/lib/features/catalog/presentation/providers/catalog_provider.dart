import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/catalog_repository.dart';
import '../../domain/models/widget_category.dart';
import '../../domain/models/widget_item.dart';
import 'favorites_provider.dart';

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  return CatalogRepositoryImpl();
});

final categoriesProvider = Provider<List<WidgetCategory>>((ref) {
  final repo = ref.watch(catalogRepositoryProvider);
  return repo.getCategories();
});

final allWidgetsProvider = Provider<List<WidgetItem>>((ref) {
  final repo = ref.watch(catalogRepositoryProvider);
  return repo.getAllWidgets();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

/// The single canonical quick-filter state used by the dashboard.
///
/// Defining this here (and importing it in the dashboard) removes the
/// undefined-provider class of bugs entirely.
enum CatalogFilterChip { all, interactive, favorites, material, cupertino }

extension CatalogFilterChipX on CatalogFilterChip {
  String get label {
    switch (this) {
      case CatalogFilterChip.all:
        return 'Tümü';
      case CatalogFilterChip.interactive:
        return 'Canlı';
      case CatalogFilterChip.favorites:
        return 'Favoriler';
      case CatalogFilterChip.material:
        return 'Material';
      case CatalogFilterChip.cupertino:
        return 'Cupertino';
    }
  }
}

final activeFilterChipProvider =
    StateProvider<CatalogFilterChip>((ref) => CatalogFilterChip.all);

final filteredCatalogWidgetsProvider = Provider<List<WidgetItem>>((ref) {
  final repo = ref.watch(catalogRepositoryProvider);
  final query = ref.watch(searchQueryProvider);
  final filter = ref.watch(activeFilterChipProvider);
  final favorites = ref.watch(favoritesProvider);

  var list = query.trim().isEmpty
      ? repo.getAllWidgets()
      : repo.searchWidgets(query);

  switch (filter) {
    case CatalogFilterChip.all:
      break;
    case CatalogFilterChip.interactive:
      list = list.where((w) => w.isPlaygroundReady).toList();
      break;
    case CatalogFilterChip.favorites:
      list = list.where((w) => favorites.contains(w.id)).toList();
      break;
    case CatalogFilterChip.material:
      list = list.where((w) => w.categoryId == 'material').toList();
      break;
    case CatalogFilterChip.cupertino:
      list = list.where((w) => w.categoryId == 'cupertino').toList();
      break;
  }

  return list;
});

final categoryByIdProvider = Provider.family<WidgetCategory?, String>((ref, id) {
  final repo = ref.watch(catalogRepositoryProvider);
  return repo.getCategoryById(id);
});

final categoryWidgetsProvider = Provider.family<List<WidgetItem>,
    ({String categoryId, String? subCategory})>((ref, args) {
  final repo = ref.watch(catalogRepositoryProvider);
  return repo.getWidgetsByCategory(
    args.categoryId,
    subCategory: args.subCategory,
  );
});

final widgetDetailProvider = Provider.family<WidgetItem?, String>((ref, id) {
  final repo = ref.watch(catalogRepositoryProvider);
  return repo.getWidgetById(id);
});

final featuredWidgetProvider = Provider<WidgetItem>((ref) {
  final repo = ref.watch(catalogRepositoryProvider);
  return repo.getFeaturedWidget();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/core/providers/storage_provider.dart';
import 'package:flutter_ui_catalog/core/services/storage_service.dart';

class FavoritesNotifier extends StateNotifier<Set<String>> {
  final StorageService _storage;

  FavoritesNotifier(this._storage) : super(_storage.getFavorites().toSet());

  bool isFavorite(String id) => state.contains(id);

  void toggleFavorite(String id) {
    final updated = Set<String>.from(state);
    if (updated.contains(id)) {
      updated.remove(id);
    } else {
      updated.add(id);
    }
    state = updated;
    _storage.saveFavorites(updated.toList());
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<String>>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return FavoritesNotifier(storage);
});

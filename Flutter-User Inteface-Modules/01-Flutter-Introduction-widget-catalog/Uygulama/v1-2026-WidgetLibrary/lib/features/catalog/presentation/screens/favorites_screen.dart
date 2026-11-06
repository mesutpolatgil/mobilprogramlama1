import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/empty_state.dart';
import '../providers/catalog_provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/widget_list_tile.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final allWidgets = ref.watch(allWidgetsProvider);
    final favoriteWidgets =
        allWidgets.where((w) => favorites.contains(w.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoriler'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: favoriteWidgets.isEmpty
              ? EmptyState(
                  icon: Icons.star_outline_rounded,
                  title: 'Henüz favori yok',
                  message:
                      'Bir widget\'ın yıldızına dokunarak burada saklayın. Favoriler çevrimdışı tutulur.',
                  action: FilledButton.tonal(
                    onPressed: () => context.go('/'),
                    child: const Text('Kategorilere göz at'),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.xl,
                    AppSpacing.lg,
                    AppSpacing.xl,
                    AppSpacing.xxl,
                  ),
                  itemCount: favoriteWidgets.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final item = favoriteWidgets[index];
                    return WidgetListTile(
                      item: item,
                      isFavorite: true,
                      onTap: () => context.push('/playground/${item.id}'),
                      onFavoriteToggle: () {
                        ref
                            .read(favoritesProvider.notifier)
                            .toggleFavorite(item.id);
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}

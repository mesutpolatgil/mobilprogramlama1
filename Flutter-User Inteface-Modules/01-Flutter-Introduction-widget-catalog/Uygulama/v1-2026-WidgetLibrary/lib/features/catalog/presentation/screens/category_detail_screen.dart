import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/catalog_artwork.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/glass_panel.dart';
import '../../../../core/widgets/section_label.dart';
import '../../domain/models/widget_category.dart';
import '../providers/catalog_provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/widget_list_tile.dart';

class CategoryDetailScreen extends ConsumerStatefulWidget {
  final String categoryId;

  const CategoryDetailScreen({
    super.key,
    required this.categoryId,
  });

  @override
  ConsumerState<CategoryDetailScreen> createState() =>
      _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends ConsumerState<CategoryDetailScreen> {
  String selectedSubCategory = 'Tümü';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final category = ref.watch(categoryByIdProvider(widget.categoryId));
    final favorites = ref.watch(favoritesProvider);

    if (category == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Kategori')),
        body: const EmptyState(
          icon: Icons.folder_off_outlined,
          title: 'Kategori bulunamadı',
          message: 'Bu kategori katalogda yer almıyor.',
        ),
      );
    }

    final subCategories = ['Tümü', ...category.subCategories];
    final widgets = ref.watch(
      categoryWidgetsProvider((
        categoryId: category.id,
        subCategory:
            selectedSubCategory == 'Tümü' ? null : selectedSubCategory,
      )),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        actions: [
          IconButton(
            tooltip: 'Favoriler',
            onPressed: () => context.push('/favorites'),
            icon: const Icon(Icons.star_outline_rounded),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.xl,
              AppSpacing.sm,
              AppSpacing.xl,
              AppSpacing.xxl,
            ),
            children: [
              _CategoryHero(
                category: category,
                widgetCount: widgets.length,
              ),
              const SizedBox(height: AppSpacing.xl),
              AppSectionLabel(
                text: 'Widget\'lar',
                trailing: Text(
                  '${widgets.length}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              if (subCategories.length > 1)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: subCategories.map((sub) {
                      final selected = selectedSubCategory == sub;
                      return Padding(
                        padding: const EdgeInsets.only(right: AppSpacing.sm),
                        child: ChoiceChip(
                          label: Text(sub),
                          selected: selected,
                          showCheckmark: false,
                          onSelected: (_) {
                            setState(() => selectedSubCategory = sub);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              const SizedBox(height: AppSpacing.md),
              if (widgets.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: AppSpacing.huge),
                  child: EmptyState(
                    icon: Icons.widgets_outlined,
                    title: 'Burada widget yok',
                    message:
                        'Bu alt kategoride henüz bir widget bulunmuyor.',
                  ),
                )
              else
                ...widgets.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: WidgetListTile(
                      item: item,
                      isFavorite: favorites.contains(item.id),
                      onTap: () => context.push('/playground/${item.id}'),
                      onFavoriteToggle: () {
                        ref
                            .read(favoritesProvider.notifier)
                            .toggleFavorite(item.id);
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryHero extends StatelessWidget {
  final WidgetCategory category;
  final int widgetCount;

  const _CategoryHero({
    required this.category,
    required this.widgetCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadii.xxl),
      child: SizedBox(
        height: 220,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CatalogArtwork(
              categoryId: category.id,
              seed: category.id,
              variant: CatalogArtworkVariant.category,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x14000000),
                    Color(0x66000000),
                    Color(0xEE000000),
                  ],
                  stops: [0, 0.4, 1],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GlassPanel(
                        padding: const EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(AppRadii.md),
                        child: Icon(
                          category.icon,
                          size: 21,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      GlassPanel(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.widgets_outlined,
                              size: 13,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '$widgetCount widget',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    category.name,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      shadows: const [
                        Shadow(color: Color(0x99000000), blurRadius: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    category.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.82),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

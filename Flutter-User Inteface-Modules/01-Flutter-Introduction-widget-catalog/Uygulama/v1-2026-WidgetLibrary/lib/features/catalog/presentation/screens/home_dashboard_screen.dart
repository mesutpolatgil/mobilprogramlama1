import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/catalog_artwork.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/glass_panel.dart';
import '../../../../core/widgets/section_label.dart';
import '../../domain/models/widget_item.dart';
import '../providers/catalog_provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/catalog_search_field.dart';
import '../widgets/category_card.dart';
import '../widgets/widget_list_tile.dart';

class HomeDashboardScreen extends ConsumerWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final categories = ref.watch(categoriesProvider);
    final allWidgets = ref.watch(allWidgetsProvider);
    final filteredWidgets = ref.watch(filteredCatalogWidgetsProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final activeFilter = ref.watch(activeFilterChipProvider);
    final favorites = ref.watch(favoritesProvider);
    final featured = ref.watch(featuredWidgetProvider);

    final isSearching =
        searchQuery.trim().isNotEmpty || activeFilter != CatalogFilterChip.all;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            tooltip: 'Favoriler',
            onPressed: () => context.push('/favorites'),
            icon: Badge(
              isLabelVisible: favorites.isNotEmpty,
              label: Text('${favorites.length}'),
              child: const Icon(Icons.star_outline_rounded),
            ),
          ),
          IconButton(
            tooltip: 'Ayarlar',
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.tune_rounded),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.xl,
                    AppSpacing.sm,
                    AppSpacing.xl,
                    AppSpacing.lg,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: _HeroBanner(
                      categoryCount: categories.length,
                      widgetCount: allWidgets.length,
                      onTap: () =>
                          context.push('/playground/${featured.id}'),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.xl,
                    0,
                    AppSpacing.xl,
                    AppSpacing.lg,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CatalogSearchField(
                          onChanged: (value) {
                            ref.read(searchQueryProvider.notifier).state =
                                value;
                          },
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _FilterChips(activeFilter: activeFilter),
                      ],
                    ),
                  ),
                ),
                if (isSearching)
                  ..._buildSearchResults(
                    context,
                    ref,
                    filteredWidgets,
                    favorites,
                  )
                else ...[
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.xl,
                      0,
                      AppSpacing.xl,
                      AppSpacing.xl,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: _FeaturedCard(
                        item: featured,
                        onTap: () =>
                            context.push('/playground/${featured.id}'),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xl,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: AppSectionLabel(
                        text: 'Kategoriler',
                        trailing: Text(
                          '${categories.length}',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppSpacing.md),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xl,
                    ),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 360,
                        mainAxisExtent: 220,
                        mainAxisSpacing: AppSpacing.md,
                        crossAxisSpacing: AppSpacing.md,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final category = categories[index];
                          final count = allWidgets
                              .where((w) => w.categoryId == category.id)
                              .length;
                          return CategoryCard(
                            category: category,
                            widgetCount: count,
                            onTap: () =>
                                context.push('/category/${category.id}'),
                          );
                        },
                        childCount: categories.length,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppSpacing.xxl),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.xl),
                        child: Text(
                          'Flutter 3.24 · Material 3 · Çevrimdışı çalışır',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSearchResults(
    BuildContext context,
    WidgetRef ref,
    List<WidgetItem> widgets,
    Set<String> favorites,
  ) {
    final theme = Theme.of(context);
    return [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xl,
          0,
          AppSpacing.xl,
          AppSpacing.md,
        ),
        sliver: SliverToBoxAdapter(
          child: AppSectionLabel(
            text: 'Sonuçlar',
            trailing: Text(
              '${widgets.length}',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
      if (widgets.isEmpty)
        SliverFillRemaining(
          hasScrollBody: false,
          child: EmptyState(
            icon: Icons.search_off_rounded,
            title: 'Sonuç bulunamadı',
            message:
                'Farklı bir isim, etiket veya kategori deneyin. Aramayı temizleyerek tüm widget\'ları görebilirsiniz.',
            action: FilledButton.tonal(
              onPressed: () {
                ref.read(searchQueryProvider.notifier).state = '';
                ref.read(activeFilterChipProvider.notifier).state =
                    CatalogFilterChip.all;
              },
              child: const Text('Aramayı temizle'),
            ),
          ),
        )
      else
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.xl,
            0,
            AppSpacing.xl,
            AppSpacing.xxl,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = widgets[index];
                return Padding(
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
                );
              },
              childCount: widgets.length,
            ),
          ),
        ),
    ];
  }
}

class _FilterChips extends ConsumerWidget {
  final CatalogFilterChip activeFilter;

  const _FilterChips({required this.activeFilter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: CatalogFilterChip.values.map((filter) {
          final isSelected = filter == activeFilter;
          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: ChoiceChip(
              label: Text(filter.label),
              selected: isSelected,
              showCheckmark: false,
              onSelected: (_) {
                ref.read(activeFilterChipProvider.notifier).state = filter;
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _HeroBanner extends StatelessWidget {
  final int categoryCount;
  final int widgetCount;
  final VoidCallback onTap;

  const _HeroBanner({
    required this.categoryCount,
    required this.widgetCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 620;
        final height = compact ? 250.0 : 300.0;
        return ClipRRect(
          borderRadius: BorderRadius.circular(AppRadii.xxl),
          child: SizedBox(
            height: height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const CatalogArtwork(
                  categoryId: 'hero',
                  variant: CatalogArtworkVariant.hero,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xB3000000),
                        Color(0x4D000000),
                        Color(0xCC000000),
                      ],
                      stops: [0, 0.5, 1],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(compact ? AppSpacing.lg : AppSpacing.xl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GlassPanel(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.auto_awesome_rounded,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '$categoryCount kategori · $widgetCount widget',
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
                        'Flutter\'ı dokunarak öğren.',
                        maxLines: 2,
                        style:
                            (compact
                                    ? theme.textTheme.headlineMedium
                                    : theme.textTheme.displaySmall)
                                ?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                          shadows: const [
                            Shadow(color: Color(0x99000000), blurRadius: 18),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Karmaşık dokümanlar yerine canlı örnekler. '
                        'Bir widget seç, ayarlarını değiştir, kodunu kopyala.',
                        maxLines: compact ? 2 : 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.82),
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      FilledButton.icon(
                        onPressed: onTap,
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF17181C),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                        ),
                        icon: const Icon(Icons.play_arrow_rounded, size: 19),
                        label: const Text('Canlı atölyeyi aç'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final WidgetItem item;
  final VoidCallback onTap;

  const _FeaturedCard({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadii.xxl),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 230,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CatalogArtwork(
                categoryId: item.categoryId,
                seed: item.id,
                glyph: item.displayIcon,
                variant: CatalogArtworkVariant.widget,
                glyphAlignment: Alignment.centerRight,
                glyphScale: 0.34,
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x0F000000),
                      Color(0x66000000),
                      Color(0xF2000000),
                    ],
                    stops: [0, 0.38, 1],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        GlassPanel(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.animation_rounded,
                                size: 14,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'ÖNE ÇIKAN ATÖLYE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GlassPanel(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.arrow_outward_rounded,
                            size: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      item.name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      item.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.78),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        Text(
                          'Canlı dene',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          size: 17,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

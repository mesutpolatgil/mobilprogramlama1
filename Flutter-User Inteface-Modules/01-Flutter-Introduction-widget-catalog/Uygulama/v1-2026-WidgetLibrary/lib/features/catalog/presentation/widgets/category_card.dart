import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/catalog_artwork.dart';
import '../../../../core/widgets/glass_panel.dart';
import '../../domain/models/widget_category.dart';

class CategoryCard extends StatelessWidget {
  final WidgetCategory category;
  final int widgetCount;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.widgetCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadii.xl),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
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
                    Color(0xE6000000),
                  ],
                  stops: [0, 0.46, 1],
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
                        padding: const EdgeInsets.all(9),
                        borderRadius: BorderRadius.circular(AppRadii.md),
                        child: Icon(
                          category.icon,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const GlassPanel(
                        padding: EdgeInsets.all(7),
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
                    category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      shadows: const [
                        Shadow(color: Color(0x66000000), blurRadius: 12),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    category.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withOpacity(0.78),
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(
                        Icons.widgets_outlined,
                        size: 13,
                        color: Colors.white.withOpacity(0.68),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '$widgetCount widget',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.white.withOpacity(0.74),
                        ),
                      ),
                    ],
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

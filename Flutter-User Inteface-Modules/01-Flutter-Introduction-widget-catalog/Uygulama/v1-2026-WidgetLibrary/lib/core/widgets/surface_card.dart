import 'package:flutter/material.dart';

import '../theme/theme.dart';

class SurfaceCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final VoidCallback? onTap;
  final double radius;

  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.color,
    this.onTap,
    this.radius = AppRadii.lg,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content = Padding(padding: padding, child: child);

    return Material(
      color: color ?? theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : InkWell(
              onTap: onTap,
              hoverColor: theme.colorScheme.surfaceContainerHigh.withOpacity(
                theme.brightness == Brightness.dark ? 0.45 : 0.6,
              ),
              child: content,
            ),
    );
  }
}

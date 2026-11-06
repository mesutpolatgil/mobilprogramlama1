import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// A bundled photograph with a graceful gradient fallback.
class AppImage extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final Alignment alignment;
  final BorderRadiusGeometry? borderRadius;
  final String? semanticLabel;

  const AppImage({
    super.key,
    required this.path,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.borderRadius,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      path,
      fit: fit,
      alignment: alignment,
      filterQuality: FilterQuality.medium,
      semanticLabel: semanticLabel,
      errorBuilder: (context, error, stackTrace) => const _ImageFallback(),
    );

    if (borderRadius == null) return image;
    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E2A5A),
            AppColors.accent,
            Color(0xFF7A5AF8),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.photo_outlined,
          color: Colors.white.withOpacity(0.72),
          size: 28,
        ),
      ),
    );
  }
}

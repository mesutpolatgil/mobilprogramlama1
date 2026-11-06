import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/catalog_artwork.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/glass_panel.dart';
import '../../../catalog/domain/models/widget_item.dart';
import '../../../catalog/presentation/providers/catalog_provider.dart';
import '../../../catalog/presentation/providers/favorites_provider.dart';
import '../playground_registry.dart';
import '../providers/playground_provider.dart';
import '../widgets/code_preview_view.dart';
import '../widgets/previews/reference_previews.dart';

/// The single playground shell used by every catalog entry.
///
/// Large screens keep the preview and the controls side by side. Compact
/// screens keep the controls in a persistent collapsible bottom sheet, so the
/// live preview is never covered by a modal.
class WidgetPlaygroundScreen extends ConsumerStatefulWidget {
  final String widgetId;

  const WidgetPlaygroundScreen({super.key, required this.widgetId});

  @override
  ConsumerState<WidgetPlaygroundScreen> createState() =>
      _WidgetPlaygroundScreenState();
}

class _WidgetPlaygroundScreenState
    extends ConsumerState<WidgetPlaygroundScreen> {
  bool _controlsExpanded = false;

  Future<void> _openDocs(WidgetItem item) async {
    final uri = Uri.tryParse(item.docsUrl);
    if (uri == null) return;
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched && mounted) {
        _showDocsError();
      }
    } catch (_) {
      if (mounted) _showDocsError();
    }
  }

  void _showDocsError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Dokümantasyon bağlantısı açılamadı')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final item = ref.watch(widgetDetailProvider(widget.widgetId));

    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Widget atölyesi')),
        body: const EmptyState(
          icon: Icons.widgets_outlined,
          title: 'Widget bulunamadı',
          message: 'Bu widget katalogda yer almıyor.',
        ),
      );
    }

    final spec = PlaygroundRegistry.forWidget(item.id);
    final config = spec == null
        ? null
        : ref.watch(playgroundProvider(item.id));
    final category = ref.watch(categoryByIdProvider(item.categoryId));
    final isFavorite = ref.watch(favoritesProvider).contains(item.id);
    final code =
        spec == null ? item.defaultCodeSnippet : spec.code(item, config!);
    final preview = spec == null
        ? ReferencePreview(item: item)
        : spec.preview(item);

    void reset() {
      ref.read(playgroundProvider(item.id).notifier).reset();
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 1),
            Text(
              '${category?.name ?? item.categoryId} · ${item.subCategory}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          if (spec != null)
            IconButton(
              tooltip: 'Ayarları sıfırla',
              onPressed: reset,
              icon: const Icon(Icons.restart_alt_rounded),
            ),
          IconButton(
            tooltip:
                isFavorite ? 'Favorilerden çıkar' : 'Favorilere ekle',
            onPressed: () {
              ref.read(favoritesProvider.notifier).toggleFavorite(item.id);
            },
            icon: Icon(
              isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
              color: isFavorite ? theme.colorScheme.primary : null,
            ),
          ),
          IconButton(
            tooltip: 'Resmî dokümantasyon',
            onPressed: () => _openDocs(item),
            icon: const Icon(Icons.open_in_new_rounded),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 1024;

            if (spec == null) {
              return _PlaygroundBody(
                item: item,
                preview: preview,
                code: code,
                isInteractive: false,
              );
            }

            final controls = spec.controls(item.id);

            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: _PlaygroundBody(
                      item: item,
                      preview: preview,
                      code: code,
                      isInteractive: true,
                    ),
                  ),
                  _SideControlsPanel(
                    item: item,
                    onReset: reset,
                    child: controls,
                  ),
                ],
              );
            }

            final sheetHeight =
                (constraints.maxHeight * 0.45).clamp(200.0, 520.0).toDouble();

            return Column(
              children: [
                Expanded(
                  child: _PlaygroundBody(
                    item: item,
                    preview: preview,
                    code: code,
                    isInteractive: true,
                  ),
                ),
                _BottomControlsSheet(
                  expanded: _controlsExpanded,
                  maxHeight: sheetHeight,
                  onToggle: () {
                    setState(() => _controlsExpanded = !_controlsExpanded);
                  },
                  onReset: reset,
                  child: controls,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _PlaygroundBody extends StatelessWidget {
  final WidgetItem item;
  final Widget preview;
  final String code;
  final bool isInteractive;

  const _PlaygroundBody({
    required this.item,
    required this.preview,
    required this.code,
    required this.isInteractive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.xl,
        AppSpacing.lg,
        AppSpacing.xl,
        AppSpacing.xxl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 880),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PreviewStage(
                item: item,
                preview: preview,
                isInteractive: isInteractive,
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      item.description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                  ),
                  if (!isInteractive) ...[
                    const SizedBox(width: AppSpacing.md),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(AppRadii.sm),
                      ),
                      child: Text(
                        'Referans',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              if (item.keyProperties.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Öne çıkan özellikler',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: item.keyProperties.map((property) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(AppRadii.sm),
                      ),
                      child: Text(
                        property,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontFamily: 'monospace',
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              CodePreviewView(dartCode: code),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewStage extends StatelessWidget {
  final WidgetItem item;
  final Widget preview;
  final bool isInteractive;

  const _PreviewStage({
    required this.item,
    required this.preview,
    required this.isInteractive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadii.xxl),
      child: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
              child: CatalogArtwork(
                categoryId: item.categoryId,
                seed: item.id,
                variant: CatalogArtworkVariant.category,
              ),
            ),
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xE617181C),
                    Color(0xD91B1D24),
                    Color(0xF017181C),
                  ],
                ),
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
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: isInteractive
                            ? const Color(0xFF34C759)
                            : Colors.white70,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: (isInteractive
                                    ? const Color(0xFF34C759)
                                    : Colors.white)
                                .withOpacity(0.55),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      isInteractive
                          ? 'Canlı önizleme'
                          : 'Referans görünüm',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        letterSpacing: 0.4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    GlassPanel(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isInteractive
                                ? Icons.touch_app_outlined
                                : Icons.visibility_outlined,
                            size: 13,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            isInteractive ? 'Etkileşimli' : 'Salt okunur',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(minHeight: 320),
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(AppRadii.xl),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.14),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        blurRadius: 30,
                        offset: const Offset(0, 14),
                      ),
                    ],
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: preview,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SideControlsPanel extends StatelessWidget {
  final WidgetItem item;
  final VoidCallback onReset;
  final Widget child;

  const _SideControlsPanel({
    required this.item,
    required this.onReset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 380,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        border: Border(
          left: BorderSide(
            color: theme.colorScheme.outlineVariant.withOpacity(0.5),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.xl,
              AppSpacing.lg,
              AppSpacing.sm,
              AppSpacing.sm,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadii.md),
                  child: SizedBox(
                    width: 38,
                    height: 38,
                    child: CatalogArtwork(
                      categoryId: item.categoryId,
                      seed: item.id,
                      glyph: item.displayIcon,
                      variant: CatalogArtworkVariant.widget,
                      glyphScale: 0.58,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kontroller', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 2),
                      Text(
                        'Widget özelliklerini gerçek zamanlı ayarla',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  onPressed: onReset,
                  icon: const Icon(Icons.restart_alt_rounded, size: 18),
                  label: const Text('Sıfırla'),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.xl,
                AppSpacing.sm,
                AppSpacing.xl,
                AppSpacing.xxl,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomControlsSheet extends StatelessWidget {
  final bool expanded;
  final double maxHeight;
  final VoidCallback onToggle;
  final VoidCallback onReset;
  final Widget child;

  const _BottomControlsSheet({
    required this.expanded,
    required this.maxHeight,
    required this.onToggle,
    required this.onReset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOutCubic,
      height: expanded ? maxHeight : 64,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppRadii.xxl),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              theme.brightness == Brightness.dark ? 0.24 : 0.05,
            ),
            blurRadius: 18,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            child: SizedBox(
              height: 64,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.tune_rounded,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kontroller',
                            style: theme.textTheme.titleSmall,
                          ),
                          Text(
                            expanded
                                ? 'Kapatmak için başlığa dokun'
                                : 'Özellikleri ayarlamak için dokun',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (expanded)
                      TextButton(
                        onPressed: onReset,
                        child: const Text('Sıfırla'),
                      ),
                    Icon(
                      expanded
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (expanded)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.xl,
                  0,
                  AppSpacing.xl,
                  AppSpacing.xxl,
                ),
                child: child,
              ),
            ),
        ],
      ),
    );
  }
}

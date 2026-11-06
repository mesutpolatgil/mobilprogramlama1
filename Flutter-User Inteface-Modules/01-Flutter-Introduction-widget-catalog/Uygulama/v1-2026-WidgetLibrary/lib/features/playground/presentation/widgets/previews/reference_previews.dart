import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/widgets/app_image.dart';
import '../../../../../core/widgets/catalog_artwork.dart';
import '../../../../../core/widgets/glass_panel.dart';
import '../../../../catalog/domain/models/widget_item.dart';

/// Focused, real examples for widgets that are not parameter playgrounds.
///
/// These widgets describe app-level structure or composition, so a slider panel
/// would be dishonest. Each reference below is still a real Flutter widget
/// instance, not a generic placeholder.
class ReferencePreview extends StatelessWidget {
  final WidgetItem item;

  const ReferencePreview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    switch (item.id) {
      case 'scaffold':
        return const _ScaffoldReference();
      case 'navigation_bar':
        return const _NavigationBarReference();
      case 'future_builder':
        return const _FutureBuilderReference();
      case 'theme_widget':
        return const _ThemeReference();
      case 'semantics':
        return const _SemanticsReference();
      default:
        return _GenericReference(item: item);
    }
  }
}

class _ScaffoldReference extends StatelessWidget {
  const _ScaffoldReference();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 320,
      height: 360,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.xl),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 56,
            title: const Text('Gezgin'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: const SizedBox(
                  height: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AppImage(path: AppImages.city),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x14000000), Color(0xB3000000)],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Text(
                            'İstanbul',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                  color: Color(0x99000000),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text('Ana içerik', style: theme.textTheme.titleSmall),
              const SizedBox(height: 4),
              Text(
                'appBar + body + yüzen aksiyon butonu',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.small(
            heroTag: null,
            onPressed: () {},
            child: const Icon(Icons.add_rounded),
          ),
        ),
      ),
    );
  }
}

class _NavigationBarReference extends StatefulWidget {
  const _NavigationBarReference();

  @override
  State<_NavigationBarReference> createState() =>
      _NavigationBarReferenceState();
}

class _NavigationBarReferenceState extends State<_NavigationBarReference> {
  int _selectedIndex = 0;

  static const List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded),
      label: 'Ana sayfa',
    ),
    NavigationDestination(
      icon: Icon(Icons.search_rounded),
      label: 'Ara',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline_rounded),
      selectedIcon: Icon(Icons.person_rounded),
      label: 'Profil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 330,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.xl),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 56,
            title: const Text('Keşfet'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 160,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const AppImage(path: AppImages.travel),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x14000000), Color(0xB3000000)],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Seyahat',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    Shadow(
                                      color: Color(0x99000000),
                                      blurRadius: 12,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Sekme ${_selectedIndex + 1} · Yeni rotalar',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() => _selectedIndex = index);
            },
            destinations: _destinations,
          ),
        ),
      ),
    );
  }
}

class _FutureBuilderReference extends StatefulWidget {
  const _FutureBuilderReference();

  @override
  State<_FutureBuilderReference> createState() =>
      _FutureBuilderReferenceState();
}

class _FutureBuilderReferenceState extends State<_FutureBuilderReference> {
  late Future<String> _future;

  @override
  void initState() {
    super.initState();
    _future = _load();
  }

  Future<String> _load() async {
    await Future<void>.delayed(const Duration(milliseconds: 900));
    return 'Rota hazır: 12 yeni durak';
  }

  void _reload() {
    setState(() => _future = _load());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 340,
      child: Material(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 112,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(path: AppImages.city),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x14000000), Color(0xB3000000)],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(14),
                      child: Text(
                        'Günün rotası',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(color: Color(0x99000000), blurRadius: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: FutureBuilder<String>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Text(
                          'Veriler getiriliyor…',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          color: theme.colorScheme.error,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        const Text('Bir şeyler ters gitti'),
                        const SizedBox(height: AppSpacing.md),
                        TextButton.icon(
                          onPressed: _reload,
                          icon: const Icon(Icons.refresh_rounded, size: 18),
                          label: const Text('Yeniden dene'),
                        ),
                      ],
                    );
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        snapshot.data ?? 'Veri yok',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      TextButton.icon(
                        onPressed: _reload,
                        icon: const Icon(Icons.refresh_rounded, size: 18),
                        label: const Text('Tekrar çalıştır'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeReference extends StatelessWidget {
  const _ThemeReference();

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context);
    final localTheme = base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.accent,
        onPrimary: Colors.white,
        primaryContainer: base.brightness == Brightness.light
            ? const Color(0xFFE5EAFF)
            : const Color(0xFF243B8F),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.xl),
          ),
        ),
      ),
    );

    return Theme(
      data: localTheme,
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          return SizedBox(
            width: 320,
            child: Material(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(AppRadii.xxl),
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 96,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CatalogArtwork(
                          categoryId: 'styling',
                          seed: 'theme',
                          variant: CatalogArtworkVariant.category,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0x14000000), Color(0xB3000000)],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.all(14),
                            child: Text(
                              'Yerel tema',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.palette_outlined,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.auto_awesome_rounded,
                            size: 18,
                          ),
                          label: const Text('Temalı buton'),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          'Alt widget’lar bu temayı Theme.of(context) ile okur.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SemanticsReference extends StatelessWidget {
  const _SemanticsReference();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: 'Ses kaydını oynat',
      hint: 'Seçili parçayı başlatır',
      button: true,
      child: SizedBox(
        width: 330,
        child: Material(
          color: theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(AppRadii.xxl),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 130,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const AppImage(path: AppImages.album),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x14000000), Color(0xCC000000)],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.24),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          iconSize: 28,
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Etiket: “Ses kaydını oynat”',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelMedium,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'İpucu: “Seçili parçayı başlatır”',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
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

class _GenericReference extends StatelessWidget {
  final WidgetItem item;

  const _GenericReference({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 230,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CatalogArtwork(
              categoryId: item.categoryId,
              seed: item.id,
              glyph: item.displayIcon,
              variant: CatalogArtworkVariant.widget,
              glyphAlignment: Alignment.topRight,
              glyphScale: 0.30,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x1A000000), Color(0xE6000000)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlassPanel(
                    padding: const EdgeInsets.all(9),
                    borderRadius: BorderRadius.circular(AppRadii.md),
                    child: Icon(
                      item.displayIcon,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(color: Color(0x99000000), blurRadius: 12),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.78),
                      fontSize: 12,
                      height: 1.35,
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

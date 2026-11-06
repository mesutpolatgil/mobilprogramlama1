import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/widgets/app_image.dart';
import '../../../../../core/widgets/catalog_artwork.dart';
import '../../../../../core/widgets/glass_panel.dart';
import '../../../../catalog/domain/models/widget_item.dart';
import '../../../domain/playground_config.dart';
import '../../providers/playground_provider.dart';

/// Renders the actual Flutter widget for the active playground.
///
/// Every branch is a different widget with different visual behavior. The
/// previews deliberately use the bundled photographs so the catalog feels like
/// a real product instead of a grid of colored boxes.
class PlaygroundPreview extends ConsumerWidget {
  final WidgetItem item;
  final String widgetId;

  const PlaygroundPreview({
    super.key,
    required this.item,
    required this.widgetId,
  });

  static const List<String> _sceneImages = [
    AppImages.travel,
    AppImages.food,
    AppImages.city,
    AppImages.watch,
    AppImages.plant,
  ];

  static const List<String> _sceneLabels = [
    'Seyahat',
    'Lezzet',
    'Şehir',
    'Saat',
    'Doğa',
  ];

  static const List<String> _listImages = [
    AppImages.album,
    AppImages.city,
    AppImages.food,
    AppImages.travel,
    AppImages.watch,
    AppImages.plant,
  ];

  static const List<String> _listTitles = [
    'Seyahat albümü',
    'Şehir notları',
    'Tarif defteri',
    'Hafta sonu planı',
    'Saat koleksiyonu',
    'Bitki günlüğü',
  ];

  static const List<String> _listSubtitles = [
    '12 fotoğraf',
    '8 fotoğraf',
    '5 tarif',
    '3 rota',
    '2 model',
    '6 not',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(playgroundProvider(widgetId));
    final notifier = ref.read(playgroundProvider(widgetId).notifier);

    switch (widgetId) {
      case 'text_widget':
        return _text(context, config);
      case 'rich_text':
        return _richText(context, config);
      case 'animated_container':
        return _animatedContainer(config);
      case 'animated_opacity':
        return _animatedOpacity(config);
      case 'row':
        return _flex(context, config, vertical: false);
      case 'column':
        return _flex(context, config, vertical: true);
      case 'wrap':
        return _wrap(context, config);
      case 'stack':
        return _stack(config);
      case 'align':
        return _align(config);
      case 'padding':
        return _padding(config);
      case 'container':
        return _container(config);
      case 'card':
        return _card(context, config);
      case 'elevated_button':
        return _elevatedButton(config);
      case 'floating_action_button':
        return _fab(config);
      case 'chip':
        return _chip(context, config);
      case 'list_tile':
        return _listTile(context, config);
      case 'cupertino_button':
        return _cupertinoButton(config);
      case 'cupertino_switch':
        return _cupertinoSwitch(context, config);
      case 'cupertino_activity_indicator':
        return _cupertinoActivityIndicator(config);
      case 'text_field':
        return _TextFieldPreview(config: config);
      case 'slider':
        return _slider(context, config, notifier);
      case 'switch_widget':
        return _switch(context, config, notifier);
      case 'gesture_detector':
        return _gestureDetector(context, config, notifier);
      case 'ink_well':
        return _inkWell(context, config);
      case 'list_view':
        return _listView(context, config);
      case 'grid_view':
        return _gridView(context, config);
      case 'clip_rrect':
        return _clipRRect(config);
      case 'opacity_widget':
        return _opacity(context, config);
      case 'icon_widget':
        return _icon(context, config);
      case 'tooltip':
        return _tooltip(config);
      case 'flutter_logo':
        return _flutterLogo(context, config);
      case 'placeholder':
        return _placeholder(context, config);
      default:
        return _ReferencePreview(item: item);
    }
  }

  Color _foregroundFor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.dark
        ? Colors.white
        : const Color(0xFF17181C);
  }

  Widget _photoScene({
    required String image,
    required double width,
    required double height,
    required Widget child,
    double radius = 24,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AppImage(path: image),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x1A000000),
                    Color(0x33000000),
                    Color(0xD9000000),
                  ],
                  stops: [0, 0.42, 1],
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }

  Widget _counterPill(BuildContext context, String label, int value) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$value',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _text(BuildContext context, PlaygroundConfig c) {
    return _photoScene(
      image: AppImages.city,
      width: 350,
      height: 240,
      radius: 26,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlassPanel(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.format_quote_rounded,
                    size: 14,
                    color: Colors.white,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'GÜNÜN ALINTISI',
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
            const Spacer(),
            Text(
              c.text,
              textAlign: c.textAlign,
              maxLines: c.maxLines,
              overflow: c.overflow,
              softWrap: c.softWrap,
              style: TextStyle(
                fontSize: c.fontSize,
                fontWeight: c.fontWeight,
                letterSpacing: c.letterSpacing,
                height: c.lineHeight,
                fontStyle: c.fontStyle,
                decoration: c.decoration,
                color: c.textColor ?? Colors.white,
                shadows: const [
                  Shadow(color: Color(0x99000000), blurRadius: 18),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '— Flutter Widget Atölyesi',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _richText(BuildContext context, PlaygroundConfig c) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 350,
      child: Material(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 118,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(path: AppImages.plant),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x14000000), Color(0xB3000000)],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 14,
                    child: GlassPanel(
                      child: Text(
                        'TİPOGRAFİ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RichText(
                textAlign: c.textAlign,
                text: TextSpan(
                  text: c.text,
                  style: TextStyle(
                    fontSize: c.fontSize,
                    color: c.primaryColor,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(
                      text: c.richAccentWord,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: c.richAccentColor,
                      ),
                    ),
                    TextSpan(text: c.secondaryText),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _animatedContainer(PlaygroundConfig c) {
    final expanded = c.animationExpanded;
    final width = expanded ? c.width : c.width * 0.6;
    final height = expanded ? c.height : c.height * 0.6;
    final radius = expanded ? c.borderRadius : c.borderRadius * 0.5;
    final alignment = expanded ? c.alignment : Alignment.centerLeft;

    return AnimatedContainer(
      duration: Duration(milliseconds: c.animationDurationMs),
      curve: c.curve.curve,
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: const DecorationImage(
          image: AssetImage(AppImages.album),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: c.primaryColor.withOpacity(0.34),
            blurRadius: 26,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x14000000), Color(0xCC000000)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.24),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      expanded ? Icons.pause_rounded : Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: alignment,
                  child: GlassPanel(
                    child: Text(
                      c.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
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

  Widget _animatedOpacity(PlaygroundConfig c) {
    return AnimatedOpacity(
      opacity: c.animationExpanded ? c.targetOpacity : 0,
      duration: Duration(milliseconds: c.animationDurationMs),
      curve: c.curve.curve,
      child: _photoScene(
        image: AppImages.headphones,
        width: c.width,
        height: c.height,
        radius: c.borderRadius,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.22),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.4)),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                c.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flex(
    BuildContext context,
    PlaygroundConfig c, {
    required bool vertical,
  }) {
    final theme = Theme.of(context);
    final children = <Widget>[];

    for (var i = 0; i < c.childCount; i++) {
      if (i > 0) {
        children.add(
          SizedBox(
            width: vertical ? 0 : c.spacing,
            height: vertical ? c.spacing : 0,
          ),
        );
      }
      final image = _sceneImages[i % _sceneImages.length];
      final label = _sceneLabels[i % _sceneLabels.length];
      children.add(
        SizedBox(
          width: vertical ? 240 : 64,
          height: vertical ? 46 : 90,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                AppImage(path: image),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x0D000000), Color(0xCC000000)],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(color: Color(0x99000000), blurRadius: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final layout = vertical
        ? Column(
            mainAxisAlignment: c.mainAxisAlignment,
            crossAxisAlignment: c.crossAxisAlignment,
            mainAxisSize: c.mainAxisSize,
            textBaseline: TextBaseline.alphabetic,
            children: children,
          )
        : Row(
            mainAxisAlignment: c.mainAxisAlignment,
            crossAxisAlignment: c.crossAxisAlignment,
            mainAxisSize: c.mainAxisSize,
            textBaseline: TextBaseline.alphabetic,
            children: children,
          );

    return Container(
      width: vertical ? 280 : 390,
      height: vertical ? 280 : 220,
      padding: const EdgeInsets.all(14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: layout,
    );
  }

  Widget _wrap(BuildContext context, PlaygroundConfig c) {
    final theme = Theme.of(context);
    const labels = ['Kahve', 'Şehir', 'Müzik', 'Seyahat', 'Yemek', 'Doğa'];
    const images = [
      AppImages.food,
      AppImages.city,
      AppImages.album,
      AppImages.travel,
      AppImages.food,
      AppImages.plant,
    ];

    return SizedBox(
      width: 350,
      height: c.direction == Axis.vertical ? 220 : 170,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.colorScheme.outlineVariant.withOpacity(0.5),
          ),
        ),
        child: Wrap(
          direction: c.direction,
          spacing: c.spacing,
          runSpacing: c.runSpacing,
          alignment: c.wrapAlignment,
          children: List.generate(
            labels.length,
            (index) => Chip(
              avatar: CircleAvatar(
                backgroundImage: AssetImage(images[index]),
              ),
              label: Text(labels[index]),
              visualDensity: VisualDensity.compact,
            ),
          ),
        ),
      ),
    );
  }

  Widget _stack(PlaygroundConfig c) {
    return SizedBox(
      width: 230,
      height: 230,
      child: Stack(
        alignment: c.alignment,
        fit: c.stackFit,
        clipBehavior: c.clipBehavior,
        children: [
          Container(
            width: 220,
            height: 220,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 22,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Stack(
              fit: StackFit.expand,
              children: [
                AppImage(path: AppImages.city),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x0D000000), Color(0xCC000000)],
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
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
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
          Transform.rotate(
            angle: -0.08,
            child: Container(
              width: 148,
              height: 148,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.24),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const AppImage(path: AppImages.food),
            ),
          ),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: c.primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: c.primaryColor.withOpacity(0.4),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(
              Icons.layers_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _align(PlaygroundConfig c) {
    return _photoScene(
      image: AppImages.city,
      width: 310,
      height: 190,
      radius: 22,
      child: Stack(
        children: [
          const Positioned(
            left: 14,
            top: 14,
            child: GlassPanel(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.explore_outlined,
                    size: 13,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'KONUM',
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
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: c.alignment,
              widthFactor: c.widthFactor,
              heightFactor: c.heightFactor,
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.location_on_rounded,
                  color: c.primaryColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _padding(PlaygroundConfig c) {
    return Container(
      padding: EdgeInsets.all(c.padding),
      decoration: BoxDecoration(
        color: c.primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: c.primaryColor.withOpacity(0.28)),
      ),
      child: _photoScene(
        image: AppImages.plant,
        width: c.width,
        height: c.height,
        radius: 18,
        child: const Center(
          child: GlassPanel(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Text(
              'Nefes al',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _container(PlaygroundConfig c) {
    final innerRadius =
        (c.borderRadius - c.padding).clamp(0.0, c.borderRadius).toDouble();
    return Container(
      width: c.width,
      height: c.height,
      padding: EdgeInsets.all(c.padding),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: c.primaryColor,
        borderRadius: BorderRadius.circular(c.borderRadius),
        boxShadow: c.showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.28),
                  blurRadius: c.elevation * 2,
                  offset: Offset(0, c.elevation / 2),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(innerRadius),
        child: Stack(
          fit: StackFit.expand,
          children: [
            const AppImage(path: AppImages.city),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x14000000), Color(0xCC000000)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: c.alignment,
                child: GlassPanel(
                  child: Text(
                    c.text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(BuildContext context, PlaygroundConfig c) {
    final foreground = _foregroundFor(c.primaryColor);
    return SizedBox(
      width: 320,
      child: Card(
        elevation: c.elevation,
        color: c.primaryColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(c.borderRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 142,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const AppImage(path: AppImages.headphones),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x14000000), Color(0x99000000)],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 12,
                    top: 12,
                    child: GlassPanel(
                      child: Text(
                        'YENİ SEZON',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.24),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(c.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    c.text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    c.secondaryText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: foreground.withOpacity(0.68),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 15,
                        color: foreground.withOpacity(0.78),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '4,9 · 128 değerlendirme',
                        style: TextStyle(
                          color: foreground.withOpacity(0.64),
                          fontSize: 10,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 16,
                        color: foreground.withOpacity(0.7),
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

  Widget _elevatedButton(PlaygroundConfig c) {
    return _photoScene(
      image: AppImages.shoes,
      width: 330,
      height: 230,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlassPanel(
              child: Text(
                'YENİ SEZON',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'Adımını yenile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
                shadows: [Shadow(color: Color(0x99000000), blurRadius: 14)],
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'Rahat kesim, günlük stil.',
              style: TextStyle(
                color: Colors.white.withOpacity(0.76),
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 14),
            ElevatedButton.icon(
              onPressed: c.isEnabled ? () {} : null,
              icon: Icon(c.icon, size: 18),
              label: Text(c.text),
              style: ElevatedButton.styleFrom(
                backgroundColor: c.primaryColor,
                foregroundColor: _foregroundFor(c.primaryColor),
                elevation: c.elevation,
                padding: EdgeInsets.symmetric(
                  horizontal: c.padding,
                  vertical: c.padding * 0.6,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(c.borderRadius),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fab(PlaygroundConfig c) {
    final fab = c.extended
        ? FloatingActionButton.extended(
            heroTag: null,
            onPressed: () {},
            elevation: c.elevation,
            backgroundColor: c.primaryColor,
            foregroundColor: _foregroundFor(c.primaryColor),
            icon: Icon(c.icon),
            label: Text(c.text),
          )
        : FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            elevation: c.elevation,
            backgroundColor: c.primaryColor,
            foregroundColor: _foregroundFor(c.primaryColor),
            child: Icon(c.icon),
          );

    return _photoScene(
      image: AppImages.city,
      width: 330,
      height: 230,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GlassPanel(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.sticky_note_2_outlined,
                        size: 13,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'NOTLAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Bugün',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                _skeletonLine(190),
                const SizedBox(height: 7),
                _skeletonLine(140),
                const SizedBox(height: 7),
                _skeletonLine(160),
              ],
            ),
          ),
          Positioned(right: 18, bottom: 18, child: fab),
        ],
      ),
    );
  }

  Widget _skeletonLine(double width) {
    return Container(
      width: width,
      height: 7,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.24),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }

  Widget _chip(BuildContext context, PlaygroundConfig c) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 320,
      child: Material(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 120,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(path: AppImages.food),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x14000000), Color(0x99000000)],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 14,
                    bottom: 12,
                    child: Text(
                      'Haftanın seçkisi',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        shadows: [
                          Shadow(color: Color(0x99000000), blurRadius: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ETİKETLER',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(
                        avatar: c.showAvatar ? Icon(c.icon, size: 18) : null,
                        label: Text(c.text),
                        onDeleted: c.showDeleteIcon ? () {} : null,
                        backgroundColor: c.primaryColor.withOpacity(0.12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(c.borderRadius),
                        ),
                      ),
                      const Chip(
                        label: Text('Tümü'),
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Seçili etiketleri filtrelemek için kullan.',
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
    );
  }

  Widget _listTile(BuildContext context, PlaygroundConfig c) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 340,
      child: Material(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          leading: c.showLeading
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: const SizedBox(
                    width: 52,
                    height: 52,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        AppImage(path: AppImages.album),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0x0D000000), Color(0x99000000)],
                            ),
                          ),
                        ),
                        Center(
                          child: Icon(
                            Icons.photo_library_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
          title: Text(
            c.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            c.secondaryText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: c.showTrailing
              ? Icon(c.trailingIcon ?? Icons.chevron_right_rounded)
              : null,
          dense: c.dense,
          enabled: c.isEnabled,
          onTap: () {},
        ),
      ),
    );
  }

  Widget _cupertinoButton(PlaygroundConfig c) {
    return _photoScene(
      image: AppImages.watch,
      width: 320,
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlassPanel(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone_iphone_rounded,
                      size: 13, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    'iOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: CupertinoButton(
                color: c.filled ? c.primaryColor : null,
                borderRadius: BorderRadius.circular(c.borderRadius),
                padding: EdgeInsets.symmetric(
                  horizontal: c.padding,
                  vertical: 12,
                ),
                onPressed: () {},
                child: Text(
                  c.text,
                  style: TextStyle(
                    color: c.filled
                        ? _foregroundFor(c.primaryColor)
                        : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cupertinoSwitch(BuildContext context, PlaygroundConfig c) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 330,
      child: Material(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: const SizedBox(
                  width: 46,
                  height: 46,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AppImage(path: AppImages.headphones),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x0D000000), Color(0x99000000)],
                          ),
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.headphones_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bildirimler', style: theme.textTheme.titleSmall),
                    Text(
                      'Yeni albümlerden haberdar ol',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoSwitch(
                value: c.isSelected,
                activeColor: c.primaryColor,
                trackColor: c.secondaryColor,
                onChanged: (_) {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cupertinoActivityIndicator(PlaygroundConfig c) {
    return _photoScene(
      image: AppImages.headphones,
      width: 280,
      height: 180,
      child: Center(
        child: GlassPanel(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoActivityIndicator(
                radius: c.padding,
                animating: c.animating,
              ),
              const SizedBox(height: 10),
              const Text(
                'Yükleniyor…',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _slider(
    BuildContext context,
    PlaygroundConfig c,
    PlaygroundNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final value = c.sliderValue.clamp(c.minValue, c.maxValue);
    return SizedBox(
      width: 330,
      child: Material(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 170,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(path: AppImages.album),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x14000000), Color(0xCC000000)],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 14,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gece Sürüşü',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(color: Color(0x99000000), blurRadius: 10),
                            ],
                          ),
                        ),
                        Text(
                          'Flutter Sessions',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.volume_up_rounded,
                        size: 18,
                        color: c.primaryColor,
                      ),
                      const SizedBox(width: 6),
                      Text('Ses seviyesi', style: theme.textTheme.bodySmall),
                      const Spacer(),
                      Text(
                        value.toStringAsFixed(0),
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: c.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: value,
                    min: c.minValue,
                    max: c.maxValue,
                    divisions: c.divisions,
                    label: value.toStringAsFixed(0),
                    activeColor: c.primaryColor,
                    onChanged: (newValue) {
                      notifier.update(
                        (state) => state.copyWith(sliderValue: newValue),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _switch(
    BuildContext context,
    PlaygroundConfig c,
    PlaygroundNotifier notifier,
  ) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 330,
      child: Material(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: const SizedBox(
                  width: 46,
                  height: 46,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AppImage(path: AppImages.watch),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x0D000000), Color(0x99000000)],
                          ),
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bildirimler', style: theme.textTheme.titleSmall),
                    Text(
                      'Yeni içeriklerden haberdar ol',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: c.isSelected,
                activeColor: c.primaryColor,
                thumbIcon: c.showThumbIcon
                    ? const WidgetStatePropertyAll<Icon?>(
                        Icon(Icons.check_rounded),
                      )
                    : null,
                onChanged: (value) {
                  notifier.update(
                    (state) => state.copyWith(isSelected: value),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gestureDetector(
    BuildContext context,
    PlaygroundConfig c,
    PlaygroundNotifier notifier,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: c.enableTap
              ? () => notifier.update(
                    (state) => state.copyWith(tapCount: state.tapCount + 1),
                  )
              : null,
          onDoubleTap: c.enableDoubleTap
              ? () => notifier.update(
                    (state) => state.copyWith(
                        doubleTapCount: state.doubleTapCount + 1),
                  )
              : null,
          onLongPress: c.enableLongPress
              ? () => notifier.update(
                    (state) => state.copyWith(
                        longPressCount: state.longPressCount + 1),
                  )
              : null,
          child: _photoScene(
            image: AppImages.watch,
            width: 310,
            height: 205,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.22),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    child: const Icon(
                      Icons.touch_app_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    c.text,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      shadows: [
                        Shadow(color: Color(0x99000000), blurRadius: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Dokun · çift dokun · basılı tut',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.72),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          alignment: WrapAlignment.center,
          children: [
            _counterPill(context, 'Dokun', c.tapCount),
            _counterPill(context, 'Çift', c.doubleTapCount),
            _counterPill(context, 'Uzun', c.longPressCount),
          ],
        ),
      ],
    );
  }

  Widget _inkWell(BuildContext context, PlaygroundConfig c) {
    return SizedBox(
      width: 330,
      height: 210,
      child: Material(
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        clipBehavior: Clip.antiAlias,
        child: Ink.image(
          image: const AssetImage(AppImages.food),
          fit: BoxFit.cover,
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                const SnackBar(content: Text('Karta dokundun')),
              );
            },
            splashColor: c.primaryColor.withOpacity(0.35),
            highlightColor: c.primaryColor.withOpacity(0.12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x0D000000), Color(0xD9000000)],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      GlassPanel(
                        child: Text(
                          c.text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Dokun ve mürekkep dalgasını gör',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.72),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listView(BuildContext context, PlaygroundConfig c) {
    final theme = Theme.of(context);

    if (c.direction == Axis.horizontal) {
      return SizedBox(
        width: 340,
        height: 160,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: c.itemCount,
          separatorBuilder: (_, __) => c.showSeparator
              ? const SizedBox(width: 8)
              : const SizedBox.shrink(),
          itemBuilder: (context, index) {
            final image = _listImages[index % _listImages.length];
            final title = _listTitles[index % _listTitles.length];
            final subtitle = _listSubtitles[index % _listSubtitles.length];
            return SizedBox(
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AppImage(path: image),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x0D000000), Color(0xD9000000)],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
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

    Widget itemBuilder(BuildContext context, int index) {
      final image = _listImages[index % _listImages.length];
      final title = _listTitles[index % _listTitles.length];
      final subtitle = _listSubtitles[index % _listSubtitles.length];
      final compact = c.height < 58;
      final thumb = (c.height - 16).clamp(26.0, 48.0).toDouble();
      return SizedBox(
        height: c.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Material(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: thumb,
                      height: thumb,
                      child: AppImage(path: image),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (!compact)
                          Text(
                            subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: 340,
      height: 300,
      child: c.showSeparator
          ? ListView.separated(
              itemCount: c.itemCount,
              separatorBuilder: (_, __) => const SizedBox(height: 2),
              itemBuilder: itemBuilder,
            )
          : ListView.builder(
              itemCount: c.itemCount,
              itemBuilder: itemBuilder,
            ),
    );
  }

  Widget _gridView(BuildContext context, PlaygroundConfig c) {
    return SizedBox(
      width: 340,
      height: 300,
      child: GridView.count(
        crossAxisCount: c.crossAxisCount,
        mainAxisSpacing: c.spacing,
        crossAxisSpacing: c.spacing,
        childAspectRatio: c.childAspectRatio,
        children: List.generate(
          c.itemCount,
          (index) {
            final image = _listImages[index % _listImages.length];
            final title = _listTitles[index % _listTitles.length];
            return ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(path: image),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x0D000000), Color(0xB3000000)],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(color: Color(0x99000000), blurRadius: 8),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _clipRRect(PlaygroundConfig c) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(c.borderRadius),
        boxShadow: [
          BoxShadow(
            color: c.primaryColor.withOpacity(0.3),
            blurRadius: 26,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(c.borderRadius),
        clipBehavior: c.clipBehavior,
        child: SizedBox(
          width: c.width,
          height: c.height,
          child: const Stack(
            fit: StackFit.expand,
            children: [
              AppImage(path: AppImages.plant),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x0D000000), Color(0xCC000000)],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Yaprak',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
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
      ),
    );
  }

  Widget _opacity(BuildContext context, PlaygroundConfig c) {
    final theme = Theme.of(context);
    return SizedBox(
      width: c.width,
      height: c.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(c.borderRadius),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant,
                  width: 1.5,
                ),
              ),
            ),
          ),
          Opacity(
            opacity: c.opacity,
            alwaysIncludeSemantics: c.alwaysIncludeSemantics,
            child: _photoScene(
              image: AppImages.city,
              width: c.width,
              height: c.height,
              radius: c.borderRadius,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: GlassPanel(
                    child: Text(
                      '${(c.opacity * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _icon(BuildContext context, PlaygroundConfig c) {
    final badge = (c.fontSize + 40).clamp(64.0, 120.0).toDouble();
    return _photoScene(
      image: AppImages.watch,
      width: 260,
      height: 190,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: badge,
            height: badge,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.28),
                  blurRadius: 22,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              c.icon,
              size: c.fontSize.clamp(16.0, 96.0).toDouble(),
              color: c.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          GlassPanel(
            child: Text(
              c.text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tooltip(PlaygroundConfig c) {
    return _photoScene(
      image: AppImages.headphones,
      width: 300,
      height: 190,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tooltip(
            message: c.tooltipMessage,
            waitDuration: Duration(milliseconds: c.tooltipWaitMs),
            showDuration: Duration(milliseconds: c.tooltipShowMs),
            triggerMode: c.tooltipTapTrigger
                ? TooltipTriggerMode.tap
                : TooltipTriggerMode.longPress,
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(c.icon, color: c.primaryColor),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'İndirmek için basılı tut',
            style: TextStyle(
              color: Colors.white.withOpacity(0.74),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _flutterLogo(BuildContext context, PlaygroundConfig c) {
    final theme = Theme.of(context);
    return Container(
      width: 250,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            c.primaryColor.withOpacity(0.16),
            theme.colorScheme.surfaceContainerLow,
            c.primaryColor.withOpacity(0.06),
          ],
        ),
        border: Border.all(color: c.primaryColor.withOpacity(0.18)),
        boxShadow: [
          BoxShadow(
            color: c.primaryColor.withOpacity(0.12),
            blurRadius: 30,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: FlutterLogo(
              size: c.width,
              style: c.logoStyle,
            ),
          ),
          Positioned(
            left: 14,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.9),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant.withOpacity(0.6),
                ),
              ),
              child: Text(
                'Flutter 3.24',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholder(BuildContext context, PlaygroundConfig c) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 330,
      child: Material(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: const SizedBox(
                  width: 92,
                  height: 92,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AppImage(path: AppImages.city),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x0D000000), Color(0x99000000)],
                          ),
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.image_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Placeholder(
                      color: c.primaryColor,
                      strokeWidth: c.padding,
                      fallbackWidth: c.width.clamp(80.0, 170.0).toDouble(),
                      fallbackHeight: c.height.clamp(40.0, 90.0).toDouble(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Görsel yükleniyor…',
                      style: theme.textTheme.bodySmall?.copyWith(
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

class _TextFieldPreview extends StatefulWidget {
  final PlaygroundConfig config;

  const _TextFieldPreview({required this.config});

  @override
  State<_TextFieldPreview> createState() => _TextFieldPreviewState();
}

class _TextFieldPreviewState extends State<_TextFieldPreview> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.config;
    final theme = Theme.of(context);
    return SizedBox(
      width: 330,
      child: Material(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 104,
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
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Hesabına giriş yap',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
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
              padding: const EdgeInsets.all(18),
              child: TextField(
                controller: _controller,
                obscureText: c.obscureText,
                maxLines: c.obscureText ? 1 : c.maxLines,
                decoration: InputDecoration(
                  labelText: c.text,
                  hintText: c.secondaryText,
                  prefixIcon: c.showPrefixIcon ? Icon(c.icon) : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(c.borderRadius),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReferencePreview extends StatelessWidget {
  final WidgetItem item;

  const _ReferencePreview({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 240,
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
              padding: const EdgeInsets.all(20),
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
                      fontSize: 22,
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/theme.dart';
import '../../../domain/playground_config.dart';
import '../../providers/playground_provider.dart';
import 'control_widgets.dart';

/// Controls that expose the real properties of the Flutter [Text] widget.
///
/// This panel is intentionally different from every other playground: it does
/// not contain width, height, elevation, or animation controls.
class TextPlaygroundControls extends ConsumerWidget {
  final String widgetId;

  const TextPlaygroundControls({super.key, required this.widgetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(playgroundProvider(widgetId));
    final notifier = ref.read(playgroundProvider(widgetId).notifier);

    void update(PlaygroundConfig Function(PlaygroundConfig) fn) {
      notifier.update(fn);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ControlSection(
          title: 'İçerik',
          children: [
            ControlTextField(
              label: 'Metin',
              initialValue: config.text,
              maxLines: 3,
              onChanged: (value) => update((c) => c.copyWith(text: value)),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        ControlSection(
          title: 'Tipografi',
          children: [
            ControlSlider(
              label: 'Yazı boyutu',
              valueLabel: '${config.fontSize.toStringAsFixed(0)} px',
              value: config.fontSize,
              min: 10,
              max: 72,
              divisions: 62,
              onChanged: (value) =>
                  update((c) => c.copyWith(fontSize: value)),
            ),
            ControlDropdown<FontWeight>(
              label: 'Yazı kalınlığı',
              value: config.fontWeight,
              items: const [
                DropdownMenuItem(
                  value: FontWeight.w300,
                  child: Text('İnce · 300'),
                ),
                DropdownMenuItem(
                  value: FontWeight.w400,
                  child: Text('Normal · 400'),
                ),
                DropdownMenuItem(
                  value: FontWeight.w500,
                  child: Text('Orta · 500'),
                ),
                DropdownMenuItem(
                  value: FontWeight.w600,
                  child: Text('Yarı kalın · 600'),
                ),
                DropdownMenuItem(
                  value: FontWeight.w700,
                  child: Text('Kalın · 700'),
                ),
                DropdownMenuItem(
                  value: FontWeight.w800,
                  child: Text('Ekstra kalın · 800'),
                ),
                DropdownMenuItem(
                  value: FontWeight.w900,
                  child: Text('Siyah · 900'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  update((c) => c.copyWith(fontWeight: value));
                }
              },
            ),
            ControlSlider(
              label: 'Harf aralığı',
              valueLabel: '${config.letterSpacing.toStringAsFixed(1)} px',
              value: config.letterSpacing,
              min: -2,
              max: 8,
              divisions: 100,
              onChanged: (value) =>
                  update((c) => c.copyWith(letterSpacing: value)),
            ),
            ControlSlider(
              label: 'Satır yüksekliği',
              valueLabel: config.lineHeight.toStringAsFixed(2),
              value: config.lineHeight,
              min: 1,
              max: 2,
              divisions: 20,
              onChanged: (value) =>
                  update((c) => c.copyWith(lineHeight: value)),
            ),
            ControlSegmented<FontStyle>(
              label: 'Yazı stili',
              value: config.fontStyle,
              segments: const [
                ButtonSegment(
                  value: FontStyle.normal,
                  label: Text('Normal'),
                ),
                ButtonSegment(
                  value: FontStyle.italic,
                  label: Text('İtalik'),
                ),
              ],
              onChanged: (value) =>
                  update((c) => c.copyWith(fontStyle: value)),
            ),
            ControlDropdown<TextDecoration>(
              label: 'Süsleme',
              value: config.decoration,
              items: const [
                DropdownMenuItem(
                  value: TextDecoration.none,
                  child: Text('Yok'),
                ),
                DropdownMenuItem(
                  value: TextDecoration.underline,
                  child: Text('Altı çizili'),
                ),
                DropdownMenuItem(
                  value: TextDecoration.lineThrough,
                  child: Text('Üstü çizili'),
                ),
                DropdownMenuItem(
                  value: TextDecoration.overline,
                  child: Text('Üst çizgi'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  update((c) => c.copyWith(decoration: value));
                }
              },
            ),
            ControlColorPicker(
              label: 'Yazı rengi',
              selected: config.textColor,
              onChanged: (color) =>
                  update((c) => c.copyWith(textColor: color)),
              onClear: () => update((c) => c.copyWith(clearTextColor: true)),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        ControlSection(
          title: 'Düzen',
          children: [
            ControlSegmented<TextAlign>(
              label: 'Metin hizası',
              value: config.textAlign,
              segments: const [
                ButtonSegment(
                  value: TextAlign.left,
                  icon: Icon(Icons.format_align_left_rounded),
                  tooltip: 'Sol',
                ),
                ButtonSegment(
                  value: TextAlign.center,
                  icon: Icon(Icons.format_align_center_rounded),
                  tooltip: 'Orta',
                ),
                ButtonSegment(
                  value: TextAlign.right,
                  icon: Icon(Icons.format_align_right_rounded),
                  tooltip: 'Sağ',
                ),
                ButtonSegment(
                  value: TextAlign.justify,
                  icon: Icon(Icons.format_align_justify_rounded),
                  tooltip: 'İki yana yasla',
                ),
              ],
              onChanged: (value) =>
                  update((c) => c.copyWith(textAlign: value)),
            ),
            ControlSlider(
              label: 'Maks. satır',
              valueLabel: '${config.maxLines}',
              value: config.maxLines.toDouble(),
              min: 1,
              max: 5,
              divisions: 4,
              onChanged: (value) =>
                  update((c) => c.copyWith(maxLines: value.round())),
            ),
            ControlDropdown<TextOverflow>(
              label: 'Taşma',
              value: config.overflow,
              items: const [
                DropdownMenuItem(
                  value: TextOverflow.clip,
                  child: Text('Kırp'),
                ),
                DropdownMenuItem(
                  value: TextOverflow.ellipsis,
                  child: Text('Üç nokta'),
                ),
                DropdownMenuItem(
                  value: TextOverflow.fade,
                  child: Text('Soluklaştır'),
                ),
                DropdownMenuItem(
                  value: TextOverflow.visible,
                  child: Text('Görünür'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  update((c) => c.copyWith(overflow: value));
                }
              },
            ),
            ControlSwitch(
              label: 'Yumuşak sarma',
              subtitle: 'Metnin satırlara bölünmesine izin ver.',
              value: config.softWrap,
              onChanged: (value) =>
                  update((c) => c.copyWith(softWrap: value)),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/theme.dart';
import '../../../domain/playground_config.dart';
import '../../providers/playground_provider.dart';
import 'control_widgets.dart';
import 'icon_options.dart';

class DisplayPlaygroundControls extends ConsumerWidget {
  final String widgetId;

  const DisplayPlaygroundControls({super.key, required this.widgetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(playgroundProvider(widgetId));
    final notifier = ref.read(playgroundProvider(widgetId).notifier);

    void update(PlaygroundConfig Function(PlaygroundConfig) fn) {
      notifier.update(fn);
    }

    switch (widgetId) {
      case 'rich_text':
        return _richText(config, update);
      case 'icon_widget':
        return _icon(config, update);
      case 'tooltip':
        return _tooltip(config, update);
      case 'flutter_logo':
        return _logo(config, update);
      case 'clip_rrect':
        return _clipRRect(config, update);
      case 'opacity_widget':
        return _opacity(config, update);
      default:
        return _placeholder(config, update);
    }
  }

  Widget _richText(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ControlSection(
          title: 'Metin parçaları',
          children: [
            ControlTextField(
              label: 'Baştaki metin',
              initialValue: config.text,
              onChanged: (value) => update((c) => c.copyWith(text: value)),
            ),
            ControlTextField(
              label: 'Vurgu kelimesi',
              initialValue: config.richAccentWord,
              onChanged: (value) =>
                  update((c) => c.copyWith(richAccentWord: value)),
            ),
            ControlTextField(
              label: 'Sondaki metin',
              initialValue: config.secondaryText,
              onChanged: (value) =>
                  update((c) => c.copyWith(secondaryText: value)),
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
              min: 12,
              max: 48,
              divisions: 36,
              onChanged: (value) =>
                  update((c) => c.copyWith(fontSize: value)),
            ),
            ControlColorPicker(
              label: 'Temel renk',
              selected: config.primaryColor,
              onChanged: (color) =>
                  update((c) => c.copyWith(primaryColor: color)),
            ),
            ControlColorPicker(
              label: 'Vurgu rengi',
              selected: config.richAccentColor,
              onChanged: (color) =>
                  update((c) => c.copyWith(richAccentColor: color)),
            ),
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
              ],
              onChanged: (value) =>
                  update((c) => c.copyWith(textAlign: value)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _icon(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'Simge özellikleri',
      children: [
        ControlDropdown<IconData>(
          label: 'Simge',
          value: config.icon,
          items: playgroundIconOptions
              .map(
                (option) => DropdownMenuItem(
                  value: option.icon,
                  child: Row(
                    children: [
                      Icon(option.icon, size: 18),
                      const SizedBox(width: AppSpacing.sm),
                      Text(option.label),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              update((c) => c.copyWith(icon: value));
            }
          },
        ),
        ControlSlider(
          label: 'Boyut',
          valueLabel: '${config.fontSize.toStringAsFixed(0)} px',
          value: config.fontSize,
          min: 16,
          max: 96,
          divisions: 80,
          onChanged: (value) => update((c) => c.copyWith(fontSize: value)),
        ),
        ControlColorPicker(
          label: 'Renk',
          selected: config.primaryColor,
          onChanged: (color) =>
              update((c) => c.copyWith(primaryColor: color)),
        ),
        ControlTextField(
          label: 'Anlamsal etiket',
          initialValue: config.text,
          onChanged: (value) => update((c) => c.copyWith(text: value)),
        ),
      ],
    );
  }

  Widget _tooltip(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'İpucu özellikleri',
      children: [
        ControlTextField(
          label: 'Mesaj',
          initialValue: config.tooltipMessage,
          onChanged: (value) =>
              update((c) => c.copyWith(tooltipMessage: value)),
        ),
        ControlSlider(
          label: 'Bekleme süresi',
          valueLabel: '${config.tooltipWaitMs} ms',
          value: config.tooltipWaitMs.toDouble(),
          min: 0,
          max: 1500,
          divisions: 15,
          onChanged: (value) =>
              update((c) => c.copyWith(tooltipWaitMs: value.round())),
        ),
        ControlSlider(
          label: 'Görünme süresi',
          valueLabel: '${config.tooltipShowMs} ms',
          value: config.tooltipShowMs.toDouble(),
          min: 500,
          max: 4000,
          divisions: 35,
          onChanged: (value) =>
              update((c) => c.copyWith(tooltipShowMs: value.round())),
        ),
        ControlSwitch(
          label: 'Dokununca göster',
          subtitle: 'Kapalıyken uzun basış kullanılır.',
          value: config.tooltipTapTrigger,
          onChanged: (value) =>
              update((c) => c.copyWith(tooltipTapTrigger: value)),
        ),
        ControlDropdown<IconData>(
          label: 'Simge',
          value: config.icon,
          items: playgroundIconOptions
              .map(
                (option) => DropdownMenuItem(
                  value: option.icon,
                  child: Text(option.label),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              update((c) => c.copyWith(icon: value));
            }
          },
        ),
      ],
    );
  }

  Widget _logo(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'FlutterLogo özellikleri',
      children: [
        ControlSlider(
          label: 'Boyut',
          valueLabel: '${config.width.toStringAsFixed(0)} px',
          value: config.width,
          min: 40,
          max: 200,
          divisions: 32,
          onChanged: (value) => update((c) => c.copyWith(width: value)),
        ),
        ControlDropdown<FlutterLogoStyle>(
          label: 'Stil',
          value: config.logoStyle,
          items: const [
            DropdownMenuItem(
              value: FlutterLogoStyle.markOnly,
              child: Text('Yalnızca işaret'),
            ),
            DropdownMenuItem(
              value: FlutterLogoStyle.horizontal,
              child: Text('Yatay'),
            ),
            DropdownMenuItem(
              value: FlutterLogoStyle.stacked,
              child: Text('Üst üste'),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              update((c) => c.copyWith(logoStyle: value));
            }
          },
        ),
      ],
    );
  }

  Widget _clipRRect(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'ClipRRect özellikleri',
      children: [
        ControlSlider(
          label: 'Genişlik',
          valueLabel: '${config.width.toStringAsFixed(0)} px',
          value: config.width,
          min: 80,
          max: 280,
          divisions: 40,
          onChanged: (value) => update((c) => c.copyWith(width: value)),
        ),
        ControlSlider(
          label: 'Yükseklik',
          valueLabel: '${config.height.toStringAsFixed(0)} px',
          value: config.height,
          min: 80,
          max: 280,
          divisions: 40,
          onChanged: (value) => update((c) => c.copyWith(height: value)),
        ),
        ControlSlider(
          label: 'Köşe yarıçapı',
          valueLabel: '${config.borderRadius.toStringAsFixed(0)} px',
          value: config.borderRadius,
          min: 0,
          max: 96,
          divisions: 96,
          onChanged: (value) =>
              update((c) => c.copyWith(borderRadius: value)),
        ),
        ControlDropdown<Clip>(
          label: 'Kırpma davranışı',
          value: config.clipBehavior,
          items: const [
            DropdownMenuItem(value: Clip.none, child: Text('Yok')),
            DropdownMenuItem(value: Clip.hardEdge, child: Text('Keskin kenar')),
            DropdownMenuItem(value: Clip.antiAlias, child: Text('Yumuşak kenar')),
            DropdownMenuItem(
              value: Clip.antiAliasWithSaveLayer,
              child: Text('Yumuşak kenar + katman'),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              update((c) => c.copyWith(clipBehavior: value));
            }
          },
        ),
        ControlColorPicker(
          label: 'Renk',
          selected: config.primaryColor,
          onChanged: (color) =>
              update((c) => c.copyWith(primaryColor: color)),
        ),
      ],
    );
  }

  Widget _opacity(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'Opaklık özellikleri',
      children: [
        ControlSlider(
          label: 'Opaklık',
          valueLabel: '${(config.opacity * 100).toStringAsFixed(0)}%',
          value: config.opacity,
          min: 0,
          max: 1,
          divisions: 20,
          onChanged: (value) => update((c) => c.copyWith(opacity: value)),
        ),
        ControlSwitch(
          label: 'Anlamı her zaman koru',
          subtitle: 'Sıfır opaklıkta bile erişilebilirlik bilgisini korur.',
          value: config.alwaysIncludeSemantics,
          onChanged: (value) => update(
            (c) => c.copyWith(alwaysIncludeSemantics: value),
          ),
        ),
        ControlSlider(
          label: 'Genişlik',
          valueLabel: '${config.width.toStringAsFixed(0)} px',
          value: config.width,
          min: 80,
          max: 280,
          divisions: 40,
          onChanged: (value) => update((c) => c.copyWith(width: value)),
        ),
        ControlSlider(
          label: 'Yükseklik',
          valueLabel: '${config.height.toStringAsFixed(0)} px',
          value: config.height,
          min: 80,
          max: 220,
          divisions: 28,
          onChanged: (value) => update((c) => c.copyWith(height: value)),
        ),
        ControlSlider(
          label: 'Köşe yarıçapı',
          valueLabel: '${config.borderRadius.toStringAsFixed(0)} px',
          value: config.borderRadius,
          min: 0,
          max: 64,
          divisions: 64,
          onChanged: (value) =>
              update((c) => c.copyWith(borderRadius: value)),
        ),
        ControlColorPicker(
          label: 'Renk',
          selected: config.primaryColor,
          onChanged: (color) =>
              update((c) => c.copyWith(primaryColor: color)),
        ),
      ],
    );
  }

  Widget _placeholder(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'Yer tutucu özellikleri',
      children: [
        ControlSlider(
          label: 'Genişlik',
          valueLabel: '${config.width.toStringAsFixed(0)} px',
          value: config.width,
          min: 60,
          max: 280,
          divisions: 44,
          onChanged: (value) => update((c) => c.copyWith(width: value)),
        ),
        ControlSlider(
          label: 'Yükseklik',
          valueLabel: '${config.height.toStringAsFixed(0)} px',
          value: config.height,
          min: 40,
          max: 220,
          divisions: 36,
          onChanged: (value) => update((c) => c.copyWith(height: value)),
        ),
        ControlSlider(
          label: 'Çizgi kalınlığı',
          valueLabel: config.padding.toStringAsFixed(1),
          value: config.padding,
          min: 1,
          max: 6,
          divisions: 10,
          onChanged: (value) => update((c) => c.copyWith(padding: value)),
        ),
        ControlColorPicker(
          label: 'Renk',
          selected: config.primaryColor,
          onChanged: (color) =>
              update((c) => c.copyWith(primaryColor: color)),
        ),
      ],
    );
  }
}

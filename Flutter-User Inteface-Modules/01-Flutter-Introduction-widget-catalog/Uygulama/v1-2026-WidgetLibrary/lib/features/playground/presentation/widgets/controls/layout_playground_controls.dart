import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/playground_config.dart';
import '../../providers/playground_provider.dart';
import 'control_widgets.dart';

/// Widget-specific controls for Row, Column, Wrap, Stack, Align, Padding and
/// Container. Each branch exposes only the properties that widget really has.
class LayoutPlaygroundControls extends ConsumerWidget {
  final String widgetId;

  const LayoutPlaygroundControls({super.key, required this.widgetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(playgroundProvider(widgetId));
    final notifier = ref.read(playgroundProvider(widgetId).notifier);

    void update(PlaygroundConfig Function(PlaygroundConfig) fn) {
      notifier.update(fn);
    }

    if (widgetId == 'row' || widgetId == 'column') {
      return _flex(context, config, update);
    }
    if (widgetId == 'wrap') {
      return _wrap(context, config, update);
    }
    if (widgetId == 'stack') {
      return _stack(context, config, update);
    }
    if (widgetId == 'align') {
      return _align(context, config, update);
    }
    if (widgetId == 'padding') {
      return _padding(context, config, update);
    }
    return _container(context, config, update);
  }

  Widget _flex(
    BuildContext context,
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    final isRow = widgetId == 'row';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ControlSection(
          title: 'Esnek düzen',
          children: [
            ControlDropdown<MainAxisAlignment>(
              label: 'Ana eksen hizası',
              value: config.mainAxisAlignment,
              items: const [
                DropdownMenuItem(
                  value: MainAxisAlignment.start,
                  child: Text('Başlangıç'),
                ),
                DropdownMenuItem(
                  value: MainAxisAlignment.center,
                  child: Text('Merkez'),
                ),
                DropdownMenuItem(
                  value: MainAxisAlignment.end,
                  child: Text('Son'),
                ),
                DropdownMenuItem(
                  value: MainAxisAlignment.spaceBetween,
                  child: Text('Aralarında boşluk'),
                ),
                DropdownMenuItem(
                  value: MainAxisAlignment.spaceAround,
                  child: Text('Çevresinde boşluk'),
                ),
                DropdownMenuItem(
                  value: MainAxisAlignment.spaceEvenly,
                  child: Text('Eşit boşluk'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  update((c) => c.copyWith(mainAxisAlignment: value));
                }
              },
            ),
            ControlDropdown<CrossAxisAlignment>(
              label: 'Çapraz eksen hizası',
              value: config.crossAxisAlignment,
              items: const [
                DropdownMenuItem(
                  value: CrossAxisAlignment.start,
                  child: Text('Başlangıç'),
                ),
                DropdownMenuItem(
                  value: CrossAxisAlignment.center,
                  child: Text('Merkez'),
                ),
                DropdownMenuItem(
                  value: CrossAxisAlignment.end,
                  child: Text('Son'),
                ),
                DropdownMenuItem(
                  value: CrossAxisAlignment.stretch,
                  child: Text('Uzat'),
                ),
                DropdownMenuItem(
                  value: CrossAxisAlignment.baseline,
                  child: Text('Taban çizgisi'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  update((c) => c.copyWith(crossAxisAlignment: value));
                }
              },
            ),
            ControlSegmented<MainAxisSize>(
              label: 'Ana eksen boyutu',
              value: config.mainAxisSize,
              segments: const [
                ButtonSegment(
                  value: MainAxisSize.min,
                  label: Text('Küçük'),
                ),
                ButtonSegment(
                  value: MainAxisSize.max,
                  label: Text('Büyük'),
                ),
              ],
              onChanged: (value) =>
                  update((c) => c.copyWith(mainAxisSize: value)),
            ),
            ControlSlider(
              label: 'Aralık',
              valueLabel: '${config.spacing.toStringAsFixed(0)} px',
              value: config.spacing,
              min: 0,
              max: 32,
              divisions: 32,
              onChanged: (value) =>
                  update((c) => c.copyWith(spacing: value)),
            ),
            ControlSlider(
              label: 'Öğe sayısı',
              valueLabel: '${config.childCount}',
              value: config.childCount.toDouble(),
              min: 2,
              max: 5,
              divisions: 3,
              onChanged: (value) =>
                  update((c) => c.copyWith(childCount: value.round())),
            ),
            Text(
              isRow
                  ? 'Aralık, Row içindeki öğeler arasına SizedBox ile eklenir; Flutter 3.24 ile uyumludur.'
                  : 'Aralık, Column içindeki öğeler arasına SizedBox ile eklenir; Flutter 3.24 ile uyumludur.',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _wrap(
    BuildContext context,
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'Sarma düzeni',
      children: [
        ControlSegmented<Axis>(
          label: 'Yön',
          value: config.direction,
          segments: const [
            ButtonSegment(value: Axis.horizontal, label: Text('Yatay')),
            ButtonSegment(value: Axis.vertical, label: Text('Dikey')),
          ],
          onChanged: (value) => update((c) => c.copyWith(direction: value)),
        ),
        ControlSlider(
          label: 'Aralık',
          valueLabel: '${config.spacing.toStringAsFixed(0)} px',
          value: config.spacing,
          min: 0,
          max: 32,
          divisions: 32,
          onChanged: (value) => update((c) => c.copyWith(spacing: value)),
        ),
        ControlSlider(
          label: 'Satır aralığı',
          valueLabel: '${config.runSpacing.toStringAsFixed(0)} px',
          value: config.runSpacing,
          min: 0,
          max: 32,
          divisions: 32,
          onChanged: (value) => update((c) => c.copyWith(runSpacing: value)),
        ),
        ControlDropdown<WrapAlignment>(
          label: 'Hizalama',
          value: config.wrapAlignment,
          items: const [
            DropdownMenuItem(value: WrapAlignment.start, child: Text('Başlangıç')),
            DropdownMenuItem(value: WrapAlignment.center, child: Text('Merkez')),
            DropdownMenuItem(value: WrapAlignment.end, child: Text('Son')),
            DropdownMenuItem(
              value: WrapAlignment.spaceBetween,
              child: Text('Aralarında boşluk'),
            ),
            DropdownMenuItem(
              value: WrapAlignment.spaceAround,
              child: Text('Çevresinde boşluk'),
            ),
            DropdownMenuItem(
              value: WrapAlignment.spaceEvenly,
              child: Text('Eşit boşluk'),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              update((c) => c.copyWith(wrapAlignment: value));
            }
          },
        ),
      ],
    );
  }

  Widget _stack(
    BuildContext context,
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'Katman düzeni',
      children: [
        AlignmentSelector(
          value: config.alignment,
          onChanged: (value) => update((c) => c.copyWith(alignment: value)),
        ),
        ControlDropdown<StackFit>(
          label: 'Sığdırma',
          value: config.stackFit,
          items: const [
            DropdownMenuItem(value: StackFit.loose, child: Text('Gevşek')),
            DropdownMenuItem(value: StackFit.expand, child: Text('Genişlet')),
            DropdownMenuItem(
              value: StackFit.passthrough,
              child: Text('Olduğu gibi geçir'),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              update((c) => c.copyWith(stackFit: value));
            }
          },
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
      ],
    );
  }

  Widget _align(
    BuildContext context,
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'Hizalama düzeni',
      children: [
        AlignmentSelector(
          value: config.alignment,
          onChanged: (value) => update((c) => c.copyWith(alignment: value)),
        ),
        ControlSlider(
          label: 'Genişlik oranı',
          valueLabel: config.widthFactor.toStringAsFixed(2),
          value: config.widthFactor,
          min: 0.5,
          max: 2,
          divisions: 15,
          onChanged: (value) => update((c) => c.copyWith(widthFactor: value)),
        ),
        ControlSlider(
          label: 'Yükseklik oranı',
          valueLabel: config.heightFactor.toStringAsFixed(2),
          value: config.heightFactor,
          min: 0.5,
          max: 2,
          divisions: 15,
          onChanged: (value) => update((c) => c.copyWith(heightFactor: value)),
        ),
      ],
    );
  }

  Widget _padding(
    BuildContext context,
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'Dolgu düzeni',
      children: [
        ControlSlider(
          label: 'Dolgu',
          valueLabel: '${config.padding.toStringAsFixed(0)} px',
          value: config.padding,
          min: 0,
          max: 64,
          divisions: 64,
          onChanged: (value) => update((c) => c.copyWith(padding: value)),
        ),
        ControlSlider(
          label: 'İçerik genişliği',
          valueLabel: '${config.width.toStringAsFixed(0)} px',
          value: config.width,
          min: 80,
          max: 280,
          divisions: 40,
          onChanged: (value) => update((c) => c.copyWith(width: value)),
        ),
        ControlSlider(
          label: 'İçerik yüksekliği',
          valueLabel: '${config.height.toStringAsFixed(0)} px',
          value: config.height,
          min: 60,
          max: 220,
          divisions: 32,
          onChanged: (value) => update((c) => c.copyWith(height: value)),
        ),
      ],
    );
  }

  Widget _container(
    BuildContext context,
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ControlSection(
          title: 'Kutu düzeni',
          children: [
            ControlSlider(
              label: 'Genişlik',
              valueLabel: '${config.width.toStringAsFixed(0)} px',
              value: config.width,
              min: 80,
              max: 300,
              divisions: 44,
              onChanged: (value) => update((c) => c.copyWith(width: value)),
            ),
            ControlSlider(
              label: 'Yükseklik',
              valueLabel: '${config.height.toStringAsFixed(0)} px',
              value: config.height,
              min: 60,
              max: 280,
              divisions: 44,
              onChanged: (value) => update((c) => c.copyWith(height: value)),
            ),
            ControlSlider(
              label: 'Dolgu',
              valueLabel: '${config.padding.toStringAsFixed(0)} px',
              value: config.padding,
              min: 0,
              max: 48,
              divisions: 48,
              onChanged: (value) => update((c) => c.copyWith(padding: value)),
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
            AlignmentSelector(
              value: config.alignment,
              onChanged: (value) =>
                  update((c) => c.copyWith(alignment: value)),
            ),
            ControlSwitch(
              label: 'Gölge',
              value: config.showShadow,
              onChanged: (value) =>
                  update((c) => c.copyWith(showShadow: value)),
            ),
            if (config.showShadow)
              ControlSlider(
                label: 'Gölge gücü',
                valueLabel: config.elevation.toStringAsFixed(0),
                value: config.elevation,
                min: 1,
                max: 24,
                divisions: 23,
                onChanged: (value) =>
                    update((c) => c.copyWith(elevation: value)),
              ),
          ],
        ),
      ],
    );
  }
}

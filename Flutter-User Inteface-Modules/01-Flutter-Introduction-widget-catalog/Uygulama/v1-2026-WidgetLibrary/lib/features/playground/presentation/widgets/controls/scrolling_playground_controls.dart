import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/playground_config.dart';
import '../../providers/playground_provider.dart';
import 'control_widgets.dart';

class ScrollingPlaygroundControls extends ConsumerWidget {
  final String widgetId;

  const ScrollingPlaygroundControls({super.key, required this.widgetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(playgroundProvider(widgetId));
    final notifier = ref.read(playgroundProvider(widgetId).notifier);

    void update(PlaygroundConfig Function(PlaygroundConfig) fn) {
      notifier.update(fn);
    }

    if (widgetId == 'list_view') {
      return ControlSection(
        title: 'ListView özellikleri',
        children: [
          ControlSlider(
            label: 'Öğe sayısı',
            valueLabel: '${config.itemCount}',
            value: config.itemCount.toDouble(),
            min: 1,
            max: 20,
            divisions: 19,
            onChanged: (value) =>
                update((c) => c.copyWith(itemCount: value.round())),
          ),
          ControlSwitch(
            label: 'Ayırıcılar',
            value: config.showSeparator,
            onChanged: (value) =>
                update((c) => c.copyWith(showSeparator: value)),
          ),
          ControlSegmented<Axis>(
            label: 'Kaydırma yönü',
            value: config.direction,
            segments: const [
              ButtonSegment(
                value: Axis.vertical,
                label: Text('Dikey'),
              ),
              ButtonSegment(
                value: Axis.horizontal,
                label: Text('Yatay'),
              ),
            ],
            onChanged: (value) =>
                update((c) => c.copyWith(direction: value)),
          ),
          ControlSlider(
            label: 'Öğe yüksekliği',
            valueLabel: '${config.height.toStringAsFixed(0)} px',
            value: config.height,
            min: 40,
            max: 88,
            divisions: 24,
            onChanged: (value) => update((c) => c.copyWith(height: value)),
          ),
        ],
      );
    }

    return ControlSection(
      title: 'GridView özellikleri',
      children: [
        ControlSlider(
          label: 'Sütun sayısı',
          valueLabel: '${config.crossAxisCount}',
          value: config.crossAxisCount.toDouble(),
          min: 2,
          max: 5,
          divisions: 3,
          onChanged: (value) =>
              update((c) => c.copyWith(crossAxisCount: value.round())),
        ),
        ControlSlider(
          label: 'Öğe sayısı',
          valueLabel: '${config.itemCount}',
          value: config.itemCount.toDouble(),
          min: 2,
          max: 20,
          divisions: 18,
          onChanged: (value) =>
              update((c) => c.copyWith(itemCount: value.round())),
        ),
        ControlSlider(
          label: 'Aralık',
          valueLabel: '${config.spacing.toStringAsFixed(0)} px',
          value: config.spacing,
          min: 0,
          max: 24,
          divisions: 24,
          onChanged: (value) => update((c) => c.copyWith(spacing: value)),
        ),
        ControlSlider(
          label: 'Öğe en-boy oranı',
          valueLabel: config.childAspectRatio.toStringAsFixed(2),
          value: config.childAspectRatio,
          min: 0.6,
          max: 1.8,
          divisions: 24,
          onChanged: (value) =>
              update((c) => c.copyWith(childAspectRatio: value)),
        ),
      ],
    );
  }
}

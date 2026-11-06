import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/playground_config.dart';
import '../../providers/playground_provider.dart';
import 'control_widgets.dart';

class CupertinoPlaygroundControls extends ConsumerWidget {
  final String widgetId;

  const CupertinoPlaygroundControls({super.key, required this.widgetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(playgroundProvider(widgetId));
    final notifier = ref.read(playgroundProvider(widgetId).notifier);

    void update(PlaygroundConfig Function(PlaygroundConfig) fn) {
      notifier.update(fn);
    }

    switch (widgetId) {
      case 'cupertino_button':
        return ControlSection(
          title: 'CupertinoButton özellikleri',
          children: [
            ControlTextField(
              label: 'Etiket',
              initialValue: config.text,
              onChanged: (value) => update((c) => c.copyWith(text: value)),
            ),
            ControlSwitch(
              label: 'Dolgulu stil',
              value: config.filled,
              onChanged: (value) => update((c) => c.copyWith(filled: value)),
            ),
            ControlSlider(
              label: 'Köşe yarıçapı',
              valueLabel: '${config.borderRadius.toStringAsFixed(0)} px',
              value: config.borderRadius,
              min: 0,
              max: 32,
              divisions: 32,
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
      case 'cupertino_switch':
        return ControlSection(
          title: 'CupertinoSwitch özellikleri',
          children: [
            ControlSwitch(
              label: 'Değer',
              value: config.isSelected,
              onChanged: (value) =>
                  update((c) => c.copyWith(isSelected: value)),
            ),
            ControlColorPicker(
              label: 'Etkin renk',
              selected: config.primaryColor,
              onChanged: (color) =>
                  update((c) => c.copyWith(primaryColor: color)),
            ),
            ControlColorPicker(
              label: 'Ray rengi',
              selected: config.secondaryColor,
              onChanged: (color) =>
                  update((c) => c.copyWith(secondaryColor: color)),
            ),
          ],
        );
      default:
        return ControlSection(
          title: 'CupertinoActivityIndicator özellikleri',
          children: [
            ControlSlider(
              label: 'Yarıçap',
              valueLabel: '${config.padding.toStringAsFixed(0)} px',
              value: config.padding,
              min: 8,
              max: 32,
              divisions: 24,
              onChanged: (value) => update((c) => c.copyWith(padding: value)),
            ),
            ControlSwitch(
              label: 'Dönüyor',
              value: config.animating,
              onChanged: (value) =>
                  update((c) => c.copyWith(animating: value)),
            ),
          ],
        );
    }
  }
}

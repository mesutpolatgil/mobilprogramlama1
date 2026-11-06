import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/theme.dart';
import '../../../domain/playground_config.dart';
import '../../providers/playground_provider.dart';
import 'control_widgets.dart';

/// Controls that expose the real motion properties of animated widgets.
///
/// Both AnimatedContainer and AnimatedOpacity share duration and curve, but
/// their target-property sections are different.
class AnimationPlaygroundControls extends ConsumerWidget {
  final String widgetId;

  const AnimationPlaygroundControls({super.key, required this.widgetId});

  bool get _isOpacity => widgetId == 'animated_opacity';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(playgroundProvider(widgetId));
    final notifier = ref.read(playgroundProvider(widgetId).notifier);

    void update(PlaygroundConfig Function(PlaygroundConfig) fn) {
      notifier.update(fn);
    }

    final playLabel = config.animationExpanded
        ? (_isOpacity ? 'Soldur' : 'Daralt')
        : (_isOpacity ? 'Belirginleştir' : 'Genişlet');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ControlSection(
          title: 'Hareket',
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton.tonalIcon(
                onPressed: () {
                  update(
                    (c) => c.copyWith(
                      animationExpanded: !c.animationExpanded,
                    ),
                  );
                },
                icon: Icon(
                  config.animationExpanded
                      ? Icons.replay_rounded
                      : Icons.play_arrow_rounded,
                ),
                label: Text(playLabel),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Oynat, hedef durumu değiştirir ve gerçek bir örtük animasyonu tetikler.',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: AppSpacing.md),
            ControlSlider(
              label: 'Süre',
              valueLabel: '${config.animationDurationMs} ms',
              value: config.animationDurationMs.toDouble(),
              min: 100,
              max: 2000,
              divisions: 19,
              onChanged: (value) => update(
                (c) => c.copyWith(animationDurationMs: value.round()),
              ),
            ),
            ControlDropdown<AnimationCurveOption>(
              label: 'Eğri',
              value: config.curve,
              items: AnimationCurveOption.values
                  .map(
                    (curve) => DropdownMenuItem(
                      value: curve,
                      child: Text(curve.label),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  update((c) => c.copyWith(curve: value));
                }
              },
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        if (_isOpacity)
          ControlSection(
            title: 'Hedef',
            children: [
              ControlSlider(
                label: 'Hedef saydamlık',
                valueLabel:
                    '${(config.targetOpacity * 100).toStringAsFixed(0)}%',
                value: config.targetOpacity,
                min: 0,
                max: 1,
                divisions: 20,
                onChanged: (value) => update(
                  (c) => c.copyWith(targetOpacity: value),
                ),
              ),
              ControlTextField(
                label: 'İçerik etiketi',
                initialValue: config.text,
                onChanged: (value) => update((c) => c.copyWith(text: value)),
              ),
            ],
          )
        else
          ControlSection(
            title: 'Hedef',
            children: [
              ControlSlider(
                label: 'Genişlik',
                valueLabel: '${config.width.toStringAsFixed(0)} px',
                value: config.width,
                min: 80,
                max: 260,
                divisions: 36,
                onChanged: (value) =>
                    update((c) => c.copyWith(width: value)),
              ),
              ControlSlider(
                label: 'Yükseklik',
                valueLabel: '${config.height.toStringAsFixed(0)} px',
                value: config.height,
                min: 80,
                max: 260,
                divisions: 36,
                onChanged: (value) =>
                    update((c) => c.copyWith(height: value)),
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
                onChanged: (alignment) =>
                    update((c) => c.copyWith(alignment: alignment)),
              ),
            ],
          ),
      ],
    );
  }
}

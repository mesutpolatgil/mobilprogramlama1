import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/theme.dart';
import '../../../domain/playground_config.dart';
import '../../providers/playground_provider.dart';
import 'control_widgets.dart';
import 'icon_options.dart';

class InputPlaygroundControls extends ConsumerWidget {
  final String widgetId;

  const InputPlaygroundControls({super.key, required this.widgetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(playgroundProvider(widgetId));
    final notifier = ref.read(playgroundProvider(widgetId).notifier);

    void update(PlaygroundConfig Function(PlaygroundConfig) fn) {
      notifier.update(fn);
    }

    if (widgetId == 'text_field') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ControlSection(
            title: 'Alan içeriği',
            children: [
              ControlTextField(
                label: 'Etiket',
                initialValue: config.text,
                onChanged: (value) => update((c) => c.copyWith(text: value)),
              ),
              ControlTextField(
                label: 'İpucu',
                initialValue: config.secondaryText,
                onChanged: (value) =>
                    update((c) => c.copyWith(secondaryText: value)),
              ),
              ControlDropdown<IconData>(
                label: 'Baştaki simge',
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
              ControlSwitch(
                label: 'Baştaki simgeyi göster',
                value: config.showPrefixIcon,
                onChanged: (value) =>
                    update((c) => c.copyWith(showPrefixIcon: value)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ControlSection(
            title: 'Alan davranışı',
            children: [
              ControlSwitch(
                label: 'Metni gizle',
                subtitle: 'Şifre alanları için kullanışlıdır.',
                value: config.obscureText,
                onChanged: (value) =>
                    update((c) => c.copyWith(obscureText: value)),
              ),
              if (!config.obscureText)
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
              ControlSlider(
                label: 'Köşe yarıçapı',
                valueLabel: '${config.borderRadius.toStringAsFixed(0)} px',
                value: config.borderRadius,
                min: 0,
                max: 24,
                divisions: 24,
                onChanged: (value) =>
                    update((c) => c.copyWith(borderRadius: value)),
              ),
            ],
          ),
        ],
      );
    }

    if (widgetId == 'slider') {
      return ControlSection(
        title: 'Kaydırıcı özellikleri',
        children: [
          ControlSlider(
            label: 'Değer',
            valueLabel: config.sliderValue.toStringAsFixed(1),
            value: config.sliderValue,
            min: config.minValue,
            max: config.maxValue,
            divisions: config.divisions,
            onChanged: (value) =>
                update((c) => c.copyWith(sliderValue: value)),
          ),
          ControlSlider(
            label: 'En az',
            valueLabel: config.minValue.toStringAsFixed(0),
            value: config.minValue,
            min: 0,
            max: 50,
            divisions: 50,
            onChanged: (value) {
              update(
                (c) => c.copyWith(
                  minValue: value,
                  sliderValue: c.sliderValue.clamp(value, c.maxValue),
                ),
              );
            },
          ),
          ControlSlider(
            label: 'En çok',
            valueLabel: config.maxValue.toStringAsFixed(0),
            value: config.maxValue,
            min: 50,
            max: 200,
            divisions: 150,
            onChanged: (value) {
              update(
                (c) => c.copyWith(
                  maxValue: value,
                  sliderValue: c.sliderValue.clamp(c.minValue, value),
                ),
              );
            },
          ),
          ControlSlider(
            label: 'Bölme sayısı',
            valueLabel: '${config.divisions}',
            value: config.divisions.toDouble(),
            min: 1,
            max: 20,
            divisions: 19,
            onChanged: (value) =>
                update((c) => c.copyWith(divisions: value.round())),
          ),
          ControlColorPicker(
            label: 'Etkin renk',
            selected: config.primaryColor,
            onChanged: (color) =>
                update((c) => c.copyWith(primaryColor: color)),
          ),
        ],
      );
    }

    return ControlSection(
      title: 'Anahtar özellikleri',
      children: [
        ControlSwitch(
          label: 'Değer',
          value: config.isSelected,
          onChanged: (value) =>
              update((c) => c.copyWith(isSelected: value)),
        ),
        ControlSwitch(
          label: 'Topuz simgesi',
          value: config.showThumbIcon,
          onChanged: (value) =>
              update((c) => c.copyWith(showThumbIcon: value)),
        ),
        ControlColorPicker(
          label: 'Etkin renk',
          selected: config.primaryColor,
          onChanged: (color) =>
              update((c) => c.copyWith(primaryColor: color)),
        ),
      ],
    );
  }
}

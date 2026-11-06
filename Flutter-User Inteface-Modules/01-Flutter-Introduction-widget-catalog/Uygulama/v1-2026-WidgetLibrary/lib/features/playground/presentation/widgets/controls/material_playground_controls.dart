import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/theme.dart';
import '../../../domain/playground_config.dart';
import '../../providers/playground_provider.dart';
import 'control_widgets.dart';
import 'icon_options.dart';

class MaterialPlaygroundControls extends ConsumerWidget {
  final String widgetId;

  const MaterialPlaygroundControls({super.key, required this.widgetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(playgroundProvider(widgetId));
    final notifier = ref.read(playgroundProvider(widgetId).notifier);

    void update(PlaygroundConfig Function(PlaygroundConfig) fn) {
      notifier.update(fn);
    }

    switch (widgetId) {
      case 'card':
        return _card(config, update);
      case 'elevated_button':
        return _button(context, config, update);
      case 'floating_action_button':
        return _fab(config, update);
      case 'chip':
        return _chip(config, update);
      case 'list_tile':
        return _listTile(config, update);
      default:
        return _inkWell(config, update);
    }
  }

  Widget _card(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ControlSection(
          title: 'Kart içeriği',
          children: [
            ControlTextField(
              label: 'Başlık',
              initialValue: config.text,
              onChanged: (value) => update((c) => c.copyWith(text: value)),
            ),
            ControlTextField(
              label: 'Açıklama',
              initialValue: config.secondaryText,
              onChanged: (value) =>
                  update((c) => c.copyWith(secondaryText: value)),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        ControlSection(
          title: 'Kart yüzeyi',
          children: [
            ControlSlider(
              label: 'Gölge yüksekliği',
              valueLabel: config.elevation.toStringAsFixed(1),
              value: config.elevation,
              min: 0,
              max: 8,
              divisions: 16,
              onChanged: (value) =>
                  update((c) => c.copyWith(elevation: value)),
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
            ControlSlider(
              label: 'Dolgu',
              valueLabel: '${config.padding.toStringAsFixed(0)} px',
              value: config.padding,
              min: 8,
              max: 40,
              divisions: 32,
              onChanged: (value) => update((c) => c.copyWith(padding: value)),
            ),
            ControlColorPicker(
              label: 'Yüzey rengi',
              selected: config.primaryColor,
              onChanged: (color) =>
                  update((c) => c.copyWith(primaryColor: color)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _button(
    BuildContext context,
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ControlSection(
          title: 'Buton içeriği',
          children: [
            ControlTextField(
              label: 'Etiket',
              initialValue: config.text,
              onChanged: (value) => update((c) => c.copyWith(text: value)),
            ),
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
            ControlSwitch(
              label: 'Etkin',
              value: config.isEnabled,
              onChanged: (value) =>
                  update((c) => c.copyWith(isEnabled: value)),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        ControlSection(
          title: 'Buton stili',
          children: [
            ControlSlider(
              label: 'Gölge yüksekliği',
              valueLabel: config.elevation.toStringAsFixed(1),
              value: config.elevation,
              min: 0,
              max: 12,
              divisions: 24,
              onChanged: (value) =>
                  update((c) => c.copyWith(elevation: value)),
            ),
            ControlSlider(
              label: 'Yatay dolgu',
              valueLabel: '${config.padding.toStringAsFixed(0)} px',
              value: config.padding,
              min: 8,
              max: 40,
              divisions: 32,
              onChanged: (value) => update((c) => c.copyWith(padding: value)),
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
        ),
      ],
    );
  }

  Widget _fab(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ControlSection(
          title: 'Yüzen aksiyon butonu',
          children: [
            ControlSwitch(
              label: 'Genişletilmiş',
              subtitle: 'Simgenin yanında bir etiket göster.',
              value: config.extended,
              onChanged: (value) =>
                  update((c) => c.copyWith(extended: value)),
            ),
            if (config.extended)
              ControlTextField(
                label: 'Etiket',
                initialValue: config.text,
                onChanged: (value) => update((c) => c.copyWith(text: value)),
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
            ControlSlider(
              label: 'Gölge yüksekliği',
              valueLabel: config.elevation.toStringAsFixed(1),
              value: config.elevation,
              min: 0,
              max: 12,
              divisions: 24,
              onChanged: (value) =>
                  update((c) => c.copyWith(elevation: value)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _chip(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ControlSection(
          title: 'Etiket içeriği',
          children: [
            ControlTextField(
              label: 'Etiket',
              initialValue: config.text,
              onChanged: (value) => update((c) => c.copyWith(text: value)),
            ),
            ControlSwitch(
              label: 'Avatar simgesi',
              value: config.showAvatar,
              onChanged: (value) =>
                  update((c) => c.copyWith(showAvatar: value)),
            ),
            ControlSwitch(
              label: 'Silme işlemi',
              value: config.showDeleteIcon,
              onChanged: (value) =>
                  update((c) => c.copyWith(showDeleteIcon: value)),
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
            ControlColorPicker(
              label: 'Ton',
              selected: config.primaryColor,
              onChanged: (color) =>
                  update((c) => c.copyWith(primaryColor: color)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _listTile(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'Liste öğesi içeriği',
      children: [
        ControlTextField(
          label: 'Başlık',
          initialValue: config.text,
          onChanged: (value) => update((c) => c.copyWith(text: value)),
        ),
        ControlTextField(
          label: 'Alt başlık',
          initialValue: config.secondaryText,
          onChanged: (value) =>
              update((c) => c.copyWith(secondaryText: value)),
        ),
        ControlSwitch(
          label: 'Baştaki simge',
          value: config.showLeading,
          onChanged: (value) => update((c) => c.copyWith(showLeading: value)),
        ),
        ControlSwitch(
          label: 'Sondaki simge',
          value: config.showTrailing,
          onChanged: (value) => update((c) => c.copyWith(showTrailing: value)),
        ),
        ControlSwitch(
          label: 'Sık düzen',
          value: config.dense,
          onChanged: (value) => update((c) => c.copyWith(dense: value)),
        ),
        ControlSwitch(
          label: 'Etkin',
          value: config.isEnabled,
          onChanged: (value) => update((c) => c.copyWith(isEnabled: value)),
        ),
      ],
    );
  }

  Widget _inkWell(
    PlaygroundConfig config,
    void Function(PlaygroundConfig Function(PlaygroundConfig)) update,
  ) {
    return ControlSection(
      title: 'Mürekkep efekti',
      children: [
        ControlTextField(
          label: 'Etiket',
          initialValue: config.text,
          onChanged: (value) => update((c) => c.copyWith(text: value)),
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
          label: 'Dalga rengi',
          selected: config.primaryColor,
          onChanged: (color) =>
              update((c) => c.copyWith(primaryColor: color)),
        ),
      ],
    );
  }
}

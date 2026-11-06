import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/theme.dart';
import '../../../domain/playground_config.dart';
import '../../providers/playground_provider.dart';
import 'control_widgets.dart';

class InteractionPlaygroundControls extends ConsumerWidget {
  final String widgetId;

  const InteractionPlaygroundControls({super.key, required this.widgetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(playgroundProvider(widgetId));
    final notifier = ref.read(playgroundProvider(widgetId).notifier);

    void update(PlaygroundConfig Function(PlaygroundConfig) fn) {
      notifier.update(fn);
    }

    return ControlSection(
      title: 'Jest geri çağrıları',
      children: [
        ControlTextField(
          label: 'Yönlendirme metni',
          initialValue: config.text,
          onChanged: (value) => update((c) => c.copyWith(text: value)),
        ),
        ControlSwitch(
          label: 'onTap',
          subtitle: 'Tek dokunuşu algılar.',
          value: config.enableTap,
          onChanged: (value) => update((c) => c.copyWith(enableTap: value)),
        ),
        ControlSwitch(
          label: 'onDoubleTap',
          subtitle: 'Hızlı iki dokunuşu algılar.',
          value: config.enableDoubleTap,
          onChanged: (value) =>
              update((c) => c.copyWith(enableDoubleTap: value)),
        ),
        ControlSwitch(
          label: 'onLongPress',
          subtitle: 'Yaklaşık yarım saniye basılı tutmayı algılar.',
          value: config.enableLongPress,
          onChanged: (value) =>
              update((c) => c.copyWith(enableLongPress: value)),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Canlı önizleme her olayı sayar; geri çağrıları hemen doğrulayabilirsin.',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        OutlinedButton.icon(
          onPressed: () => update(
            (c) => c.copyWith(
              tapCount: 0,
              doubleTapCount: 0,
              longPressCount: 0,
            ),
          ),
          icon: const Icon(Icons.restart_alt_rounded, size: 18),
          label: const Text('Olay kaydını temizle'),
        ),
      ],
    );
  }
}

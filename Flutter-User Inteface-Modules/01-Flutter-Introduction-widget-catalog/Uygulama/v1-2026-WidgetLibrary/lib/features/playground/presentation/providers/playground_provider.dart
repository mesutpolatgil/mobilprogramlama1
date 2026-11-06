import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/playground_config.dart';
import '../../domain/playground_defaults.dart';

class PlaygroundNotifier extends StateNotifier<PlaygroundConfig> {
  final PlaygroundConfig _defaults;

  PlaygroundNotifier(this._defaults) : super(_defaults);

  void update(PlaygroundConfig Function(PlaygroundConfig) update) {
    state = update(state);
  }

  void reset() {
    state = _defaults;
  }
}

/// Each widget gets its own playground state, so changing Text settings never
/// leaks into the Animation playground.
final playgroundProvider = StateNotifierProvider.autoDispose
    .family<PlaygroundNotifier, PlaygroundConfig, String>((ref, widgetId) {
  return PlaygroundNotifier(PlaygroundDefaults.forWidget(widgetId));
});

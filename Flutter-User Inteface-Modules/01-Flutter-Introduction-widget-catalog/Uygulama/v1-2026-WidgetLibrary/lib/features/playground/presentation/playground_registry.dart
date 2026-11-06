import 'package:flutter/material.dart';

import '../../catalog/domain/models/widget_item.dart';
import '../domain/code_generator.dart';
import '../domain/playground_config.dart';
import 'widgets/controls/animation_playground_controls.dart';
import 'widgets/controls/cupertino_playground_controls.dart';
import 'widgets/controls/display_playground_controls.dart';
import 'widgets/controls/input_playground_controls.dart';
import 'widgets/controls/interaction_playground_controls.dart';
import 'widgets/controls/layout_playground_controls.dart';
import 'widgets/controls/material_playground_controls.dart';
import 'widgets/controls/scrolling_playground_controls.dart';
import 'widgets/controls/text_playground_controls.dart';
import 'widgets/previews/playground_preview.dart';

typedef PlaygroundPreviewBuilder = Widget Function(WidgetItem item);
typedef PlaygroundControlsBuilder = Widget Function(String widgetId);
typedef PlaygroundCodeBuilder = String Function(
  WidgetItem item,
  PlaygroundConfig config,
);

/// The complete contract for one interactive playground.
///
/// A registry entry always supplies all three pieces, so the screen never has
/// to guess which control panel or code generator belongs to a widget.
class PlaygroundSpec {
  final PlaygroundPreviewBuilder preview;
  final PlaygroundControlsBuilder controls;
  final PlaygroundCodeBuilder code;

  const PlaygroundSpec({
    required this.preview,
    required this.controls,
    required this.code,
  });
}

abstract final class PlaygroundRegistry {
  static PlaygroundSpec _spec(PlaygroundControlsBuilder controls) {
    return PlaygroundSpec(
      preview: (item) => PlaygroundPreview(item: item, widgetId: item.id),
      controls: controls,
      code: PlaygroundCodeGenerator.generate,
    );
  }

  static final Map<String, PlaygroundSpec> _specs = {
    // Text
    'text_widget': _spec((id) => TextPlaygroundControls(widgetId: id)),
    'rich_text': _spec((id) => DisplayPlaygroundControls(widgetId: id)),

    // Motion
    'animated_container': _spec(
      (id) => AnimationPlaygroundControls(widgetId: id),
    ),
    'animated_opacity': _spec(
      (id) => AnimationPlaygroundControls(widgetId: id),
    ),

    // Layout
    'row': _spec((id) => LayoutPlaygroundControls(widgetId: id)),
    'column': _spec((id) => LayoutPlaygroundControls(widgetId: id)),
    'wrap': _spec((id) => LayoutPlaygroundControls(widgetId: id)),
    'stack': _spec((id) => LayoutPlaygroundControls(widgetId: id)),
    'align': _spec((id) => LayoutPlaygroundControls(widgetId: id)),
    'padding': _spec((id) => LayoutPlaygroundControls(widgetId: id)),
    'container': _spec((id) => LayoutPlaygroundControls(widgetId: id)),

    // Material
    'card': _spec((id) => MaterialPlaygroundControls(widgetId: id)),
    'elevated_button': _spec(
      (id) => MaterialPlaygroundControls(widgetId: id),
    ),
    'floating_action_button': _spec(
      (id) => MaterialPlaygroundControls(widgetId: id),
    ),
    'chip': _spec((id) => MaterialPlaygroundControls(widgetId: id)),
    'list_tile': _spec((id) => MaterialPlaygroundControls(widgetId: id)),
    'ink_well': _spec((id) => MaterialPlaygroundControls(widgetId: id)),

    // Input
    'text_field': _spec((id) => InputPlaygroundControls(widgetId: id)),
    'slider': _spec((id) => InputPlaygroundControls(widgetId: id)),
    'switch_widget': _spec((id) => InputPlaygroundControls(widgetId: id)),

    // Interaction
    'gesture_detector': _spec(
      (id) => InteractionPlaygroundControls(widgetId: id),
    ),

    // Scrolling
    'list_view': _spec((id) => ScrollingPlaygroundControls(widgetId: id)),
    'grid_view': _spec((id) => ScrollingPlaygroundControls(widgetId: id)),

    // Display
    'icon_widget': _spec((id) => DisplayPlaygroundControls(widgetId: id)),
    'tooltip': _spec((id) => DisplayPlaygroundControls(widgetId: id)),
    'flutter_logo': _spec((id) => DisplayPlaygroundControls(widgetId: id)),
    'placeholder': _spec((id) => DisplayPlaygroundControls(widgetId: id)),

    // Cupertino
    'cupertino_button': _spec(
      (id) => CupertinoPlaygroundControls(widgetId: id),
    ),
    'cupertino_switch': _spec(
      (id) => CupertinoPlaygroundControls(widgetId: id),
    ),
    'cupertino_activity_indicator': _spec(
      (id) => CupertinoPlaygroundControls(widgetId: id),
    ),

    // Painting
    'clip_rrect': _spec((id) => DisplayPlaygroundControls(widgetId: id)),
    'opacity_widget': _spec((id) => DisplayPlaygroundControls(widgetId: id)),
  };

  /// Returns the spec for an interactive widget, or null for a reference-only
  /// widget such as Scaffold, NavigationBar, FutureBuilder, Theme or Semantics.
  static PlaygroundSpec? forWidget(String widgetId) => _specs[widgetId];

  static bool isInteractive(String widgetId) => _specs.containsKey(widgetId);

  static List<String> get interactiveWidgetIds =>
      _specs.keys.toList(growable: false);
}

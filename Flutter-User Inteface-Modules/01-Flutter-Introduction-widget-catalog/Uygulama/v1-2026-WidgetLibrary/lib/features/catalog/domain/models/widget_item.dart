import 'package:flutter/material.dart';

class WidgetItem {
  final String id;
  final String name;
  final String categoryId;
  final String subCategory;
  final String description;
  final String docsUrl;
  final bool isPlaygroundReady;
  final List<String> tags;
  final String defaultCodeSnippet;
  final List<String> keyProperties;

  /// Optional per-widget glyph used by the catalog artwork and list tiles.
  ///
  /// Core entries fall back to [_fallbackIcons], while entries added from the
  /// wider widget catalog define their own icon so the artwork always matches
  /// the heading.
  final IconData? icon;

  const WidgetItem({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.subCategory,
    required this.description,
    required this.docsUrl,
    this.isPlaygroundReady = false,
    this.tags = const [],
    required this.defaultCodeSnippet,
    this.keyProperties = const [],
    this.icon,
  });

  /// The icon that represents this widget in artwork and list tiles.
  IconData get displayIcon =>
      icon ?? _fallbackIcons[id] ?? Icons.widgets_outlined;

  static const Map<String, IconData> _fallbackIcons = {
    'container': Icons.crop_square,
    'scaffold': Icons.web_asset,
    'row': Icons.view_week_outlined,
    'column': Icons.view_agenda_outlined,
    'flutter_logo': Icons.flutter_dash,
    'placeholder': Icons.crop_landscape,
    'elevated_button': Icons.ads_click,
    'card': Icons.credit_card,
    'floating_action_button': Icons.add,
    'chip': Icons.label_outline,
    'list_tile': Icons.view_list,
    'navigation_bar': Icons.navigation,
    'cupertino_button': Icons.touch_app,
    'cupertino_switch': Icons.toggle_on,
    'cupertino_activity_indicator': Icons.autorenew,
    'padding': Icons.padding,
    'align': Icons.align_horizontal_left,
    'stack': Icons.layers,
    'wrap': Icons.wrap_text,
    'text_widget': Icons.text_fields,
    'rich_text': Icons.format_size,
    'text_field': Icons.edit_note,
    'slider': Icons.tune,
    'switch_widget': Icons.toggle_on,
    'gesture_detector': Icons.gesture,
    'ink_well': Icons.touch_app,
    'list_view': Icons.view_list,
    'grid_view': Icons.grid_view,
    'animated_container': Icons.animation,
    'animated_opacity': Icons.opacity,
    'future_builder': Icons.hourglass_bottom,
    'clip_rrect': Icons.rounded_corner,
    'opacity_widget': Icons.opacity,
    'icon_widget': Icons.star_outline,
    'theme_widget': Icons.palette,
    'tooltip': Icons.info_outline,
    'semantics': Icons.accessibility_new,
  };
}

import 'package:flutter/material.dart';

/// Bundled, offline-first imagery used across the catalog.
///
/// Every category, widget and preview scene resolves to a real photograph so
/// the interface feels like a visual guide rather than a wall of colored boxes.
abstract final class AppImages {
  static const String _base = 'assets/images/';

  static const String hero = '${_base}scene_hero.jpg';
  static const String album = '${_base}scene_album.jpg';
  static const String headphones = '${_base}scene_headphones.jpg';
  static const String watch = '${_base}scene_watch.jpg';
  static const String shoes = '${_base}scene_shoes.jpg';
  static const String food = '${_base}scene_food.jpg';
  static const String travel = '${_base}scene_travel.jpg';
  static const String city = '${_base}scene_city.jpg';
  static const String plant = '${_base}scene_plant.jpg';

  static const List<String> avatars = [
    '${_base}avatar_1.jpg',
    '${_base}avatar_2.jpg',
    '${_base}avatar_3.jpg',
    '${_base}avatar_4.jpg',
  ];

  static const Map<String, String> categoryImages = {
    'basics': '${_base}category_basics.jpg',
    'material': '${_base}category_material.jpg',
    'cupertino': '${_base}category_cupertino.jpg',
    'layout': '${_base}category_layout.jpg',
    'text': '${_base}category_text.jpg',
    'input': '${_base}category_input.jpg',
    'interaction': '${_base}category_interaction.jpg',
    'scrolling': '${_base}category_scrolling.jpg',
    'animation': '${_base}category_animation.jpg',
    'async': '${_base}category_async.jpg',
    'painting': '${_base}category_painting.jpg',
    'assets': '${_base}category_assets.jpg',
    'styling': '${_base}category_styling.jpg',
    'accessibility': '${_base}category_accessibility.jpg',
  };

  /// A photograph that matches the purpose of each widget.
  static const Map<String, String> widgetImages = {
    // Basics
    'container': plant,
    'scaffold': city,
    'row': travel,
    'column': food,
    'flutter_logo': '${_base}category_basics.jpg',
    'placeholder': '${_base}category_layout.jpg',
    // Material
    'elevated_button': shoes,
    'card': headphones,
    'floating_action_button': city,
    'chip': food,
    'list_tile': album,
    'navigation_bar': travel,
    // Cupertino
    'cupertino_button': '${_base}category_cupertino.jpg',
    'cupertino_switch': '${_base}category_cupertino.jpg',
    'cupertino_activity_indicator': '${_base}category_cupertino.jpg',
    // Layout
    'padding': plant,
    'align': city,
    'stack': city,
    'wrap': food,
    // Text
    'text_widget': '${_base}category_text.jpg',
    'rich_text': '${_base}category_text.jpg',
    // Input
    'text_field': '${_base}category_input.jpg',
    'slider': headphones,
    'switch_widget': '${_base}category_input.jpg',
    // Interaction
    'gesture_detector': watch,
    'ink_well': food,
    // Scrolling
    'list_view': album,
    'grid_view': travel,
    // Animation
    'animated_container': album,
    'animated_opacity': headphones,
    // Async
    'future_builder': '${_base}category_async.jpg',
    // Painting
    'clip_rrect': plant,
    'opacity_widget': city,
    // Assets
    'icon_widget': watch,
    // Styling
    'theme_widget': '${_base}category_styling.jpg',
    // Accessibility
    'tooltip': headphones,
    'semantics': album,
  };

  static const Map<String, IconData> widgetIcons = {
    'container': Icons.crop_square_rounded,
    'scaffold': Icons.dashboard_customize_outlined,
    'row': Icons.view_week_outlined,
    'column': Icons.view_agenda_outlined,
    'flutter_logo': Icons.flutter_dash,
    'placeholder': Icons.crop_free_rounded,
    'elevated_button': Icons.touch_app_outlined,
    'card': Icons.photo_library_outlined,
    'floating_action_button': Icons.add_circle_outline_rounded,
    'chip': Icons.label_outline_rounded,
    'list_tile': Icons.list_alt_rounded,
    'navigation_bar': Icons.space_dashboard_outlined,
    'cupertino_button': Icons.phone_iphone_rounded,
    'cupertino_switch': Icons.toggle_on_outlined,
    'cupertino_activity_indicator': Icons.hourglass_empty_rounded,
    'padding': Icons.space_bar_rounded,
    'align': Icons.align_horizontal_center_rounded,
    'stack': Icons.layers_outlined,
    'wrap': Icons.wrap_text_rounded,
    'text_widget': Icons.text_fields_rounded,
    'rich_text': Icons.format_color_text_rounded,
    'text_field': Icons.email_outlined,
    'slider': Icons.tune_rounded,
    'switch_widget': Icons.toggle_on_outlined,
    'gesture_detector': Icons.gesture_rounded,
    'ink_well': Icons.ads_click_rounded,
    'list_view': Icons.view_list_rounded,
    'grid_view': Icons.grid_view_rounded,
    'animated_container': Icons.animation_rounded,
    'animated_opacity': Icons.blur_on_rounded,
    'future_builder': Icons.hourglass_bottom_rounded,
    'clip_rrect': Icons.rounded_corner_rounded,
    'opacity_widget': Icons.opacity_rounded,
    'icon_widget': Icons.favorite_rounded,
    'theme_widget': Icons.palette_outlined,
    'tooltip': Icons.info_outline_rounded,
    'semantics': Icons.accessibility_new_rounded,
  };

  static String category(String categoryId) {
    return categoryImages[categoryId] ?? hero;
  }

  static String widget(String widgetId) {
    return widgetImages[widgetId] ?? hero;
  }

  static IconData icon(String widgetId) {
    return widgetIcons[widgetId] ?? Icons.widgets_outlined;
  }

  static String avatar(int index) {
    return avatars[index % avatars.length];
  }
}

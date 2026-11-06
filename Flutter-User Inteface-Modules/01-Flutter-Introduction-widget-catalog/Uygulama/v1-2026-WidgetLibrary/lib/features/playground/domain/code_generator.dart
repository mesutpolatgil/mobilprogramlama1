import 'package:flutter/material.dart';

import '../../catalog/domain/models/widget_item.dart';
import 'playground_config.dart';

/// Facade for all live code generation.
///
/// Every playground-ready widget has an explicit branch. The fallback is only
/// used by the reference view for widgets that are not interactive yet.
abstract final class PlaygroundCodeGenerator {
  static String generate(WidgetItem item, PlaygroundConfig config) {
    switch (item.id) {
      case 'text_widget':
        return _text(config);
      case 'rich_text':
        return _richText(config);
      case 'animated_container':
        return _animatedContainer(config);
      case 'animated_opacity':
        return _animatedOpacity(config);
      case 'row':
        return _flex(config, vertical: false);
      case 'column':
        return _flex(config, vertical: true);
      case 'wrap':
        return _wrap(config);
      case 'stack':
        return _stack(config);
      case 'align':
        return _align(config);
      case 'padding':
        return _padding(config);
      case 'container':
        return _container(config);
      case 'card':
        return _card(config);
      case 'elevated_button':
        return _elevatedButton(config);
      case 'floating_action_button':
        return _fab(config);
      case 'chip':
        return _chip(config);
      case 'list_tile':
        return _listTile(config);
      case 'cupertino_button':
        return _cupertinoButton(config);
      case 'cupertino_switch':
        return _cupertinoSwitch(config);
      case 'cupertino_activity_indicator':
        return _cupertinoActivityIndicator(config);
      case 'text_field':
        return _textField(config);
      case 'slider':
        return _slider(config);
      case 'switch_widget':
        return _switch(config);
      case 'gesture_detector':
        return _gestureDetector(config);
      case 'ink_well':
        return _inkWell(config);
      case 'list_view':
        return _listView(config);
      case 'grid_view':
        return _gridView(config);
      case 'clip_rrect':
        return _clipRRect(config);
      case 'opacity_widget':
        return _opacity(config);
      case 'icon_widget':
        return _iconWidget(config);
      case 'tooltip':
        return _tooltip(config);
      case 'flutter_logo':
        return _flutterLogo(config);
      case 'placeholder':
        return _placeholder(config);
      default:
        return item.defaultCodeSnippet;
    }
  }

  static String _text(PlaygroundConfig c) {
    final style = <String>[
      'fontSize: ${c.fontSize.toStringAsFixed(1)}',
      'fontWeight: ${_fontWeight(c.fontWeight)}',
      'letterSpacing: ${c.letterSpacing.toStringAsFixed(1)}',
      'height: ${c.lineHeight.toStringAsFixed(2)}',
      if (c.fontStyle != FontStyle.normal)
        'fontStyle: ${_fontStyle(c.fontStyle)}',
      if (c.decoration != TextDecoration.none)
        'decoration: ${_decoration(c.decoration)}',
      if (c.textColor != null) 'color: ${_color(c.textColor!)}',
    ].join(',\n    ');

    return '''Text(
  '${_escape(c.text)}',
  textAlign: ${_textAlign(c.textAlign)},
  maxLines: ${c.maxLines},
  overflow: ${_overflow(c.overflow)},
  softWrap: ${c.softWrap},
  style: const TextStyle(
    $style,
  ),
)''';
  }

  static String _richText(PlaygroundConfig c) {
    return '''RichText(
  textAlign: ${_textAlign(c.textAlign)},
  text: TextSpan(
    text: '${_escape(c.text)}',
    style: TextStyle(
      fontSize: ${c.fontSize.toStringAsFixed(1)},
      color: ${_color(c.primaryColor)},
    ),
    children: [
      TextSpan(
        text: '${_escape(c.richAccentWord)}',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: ${_color(c.richAccentColor)},
        ),
      ),
      TextSpan(text: '${_escape(c.secondaryText)}'),
    ],
  ),
)''';
  }

  static String _animatedContainer(PlaygroundConfig c) {
    final expanded = c.animationExpanded;
    final width = expanded ? c.width : c.width * 0.6;
    final height = expanded ? c.height : c.height * 0.6;
    final radius = expanded ? c.borderRadius : c.borderRadius * 0.5;
    final alignment = expanded ? c.alignment : Alignment.centerLeft;
    final color = expanded ? c.primaryColor : c.primaryColor.withOpacity(0.55);

    return '''AnimatedContainer(
  duration: const Duration(milliseconds: ${c.animationDurationMs}),
  curve: ${c.curve.codeName},
  width: ${width.toStringAsFixed(0)},
  height: ${height.toStringAsFixed(0)},
  alignment: ${_alignment(alignment)},
  decoration: BoxDecoration(
    color: ${_color(color)},
    borderRadius: BorderRadius.circular(${radius.toStringAsFixed(0)}),
  ),
  child: Center(
    child: Text(
      '${_escape(c.text)}',
      style: const TextStyle(
        color: ${_foreground(color)},
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
)''';
  }

  static String _animatedOpacity(PlaygroundConfig c) {
    final opacity = c.animationExpanded ? c.targetOpacity : 0.0;
    return '''AnimatedOpacity(
  opacity: ${opacity.toStringAsFixed(2)},
  duration: const Duration(milliseconds: ${c.animationDurationMs}),
  curve: ${c.curve.codeName},
  child: Container(
    width: ${c.width.toStringAsFixed(0)},
    height: ${c.height.toStringAsFixed(0)},
    decoration: BoxDecoration(
      color: ${_color(c.primaryColor)},
      borderRadius: BorderRadius.circular(${c.borderRadius.toStringAsFixed(0)}),
    ),
    child: Center(
      child: Text(
        '${_escape(c.text)}',
        style: const TextStyle(color: ${_foreground(c.primaryColor)}),
      ),
    ),
  ),
)''';
  }

  static String _flex(PlaygroundConfig c, {required bool vertical}) {
    final axis = vertical ? 'Column' : 'Row';
    final gap = vertical ? 'height' : 'width';
    final items = <String>[];
    for (var i = 0; i < c.childCount; i++) {
      if (i > 0) {
        items.add('    SizedBox($gap: ${c.spacing.toStringAsFixed(0)}),');
      }
      items.add('''    Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: ${_color(c.primaryColor.withOpacity(0.12 + (i * 0.12)))},
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text('${i + 1}')),
    ),''');
    }

    final baseline = c.crossAxisAlignment == CrossAxisAlignment.baseline
        ? '\n  textBaseline: TextBaseline.alphabetic,'
        : '';

    return '''$axis(
  mainAxisAlignment: ${_mainAxisAlignment(c.mainAxisAlignment)},
  crossAxisAlignment: ${_crossAxisAlignment(c.crossAxisAlignment)},
  mainAxisSize: ${_mainAxisSize(c.mainAxisSize)},$baseline
  children: [
${items.join('\n')}
  ],
)''';
  }

  static String _wrap(PlaygroundConfig c) {
    return '''Wrap(
  direction: ${c.direction == Axis.horizontal ? 'Axis.horizontal' : 'Axis.vertical'},
  spacing: ${c.spacing.toStringAsFixed(0)},
  runSpacing: ${c.runSpacing.toStringAsFixed(0)},
  alignment: ${_wrapAlignment(c.wrapAlignment)},
  children: const [
    Chip(label: Text('Dart')),
    Chip(label: Text('Flutter')),
    Chip(label: Text('Riverpod')),
    Chip(label: Text('Material 3')),
  ],
)''';
  }

  static String _stack(PlaygroundConfig c) {
    return '''Stack(
  alignment: ${_alignment(c.alignment)},
  fit: ${_stackFit(c.stackFit)},
  clipBehavior: ${_clip(c.clipBehavior)},
  children: [
    Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: ${_color(c.primaryColor.withOpacity(0.12))},
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: ${_color(c.primaryColor.withOpacity(0.35))},
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: ${_color(c.primaryColor)},
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ],
)''';
  }

  static String _align(PlaygroundConfig c) {
    return '''Container(
  width: 260,
  height: 160,
  decoration: BoxDecoration(
    color: ${_color(c.secondaryColor.withOpacity(0.12))},
    borderRadius: BorderRadius.circular(16),
  ),
  child: Align(
    alignment: ${_alignment(c.alignment)},
    widthFactor: ${c.widthFactor.toStringAsFixed(2)},
    heightFactor: ${c.heightFactor.toStringAsFixed(2)},
    child: Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: ${_color(c.primaryColor)},
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
)''';
  }

  static String _padding(PlaygroundConfig c) {
    return '''Padding(
  padding: EdgeInsets.all(${c.padding.toStringAsFixed(0)}),
  child: Container(
    width: ${c.width.toStringAsFixed(0)},
    height: ${c.height.toStringAsFixed(0)},
    decoration: BoxDecoration(
      color: ${_color(c.primaryColor)},
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: Text(
        'Padded content',
        style: TextStyle(color: ${_foreground(c.primaryColor)}),
      ),
    ),
  ),
)''';
  }

  static String _container(PlaygroundConfig c) {
    return '''Container(
  width: ${c.width.toStringAsFixed(0)},
  height: ${c.height.toStringAsFixed(0)},
  padding: EdgeInsets.all(${c.padding.toStringAsFixed(0)}),
  alignment: ${_alignment(c.alignment)},
  decoration: BoxDecoration(
    color: ${_color(c.primaryColor)},
    borderRadius: BorderRadius.circular(${c.borderRadius.toStringAsFixed(0)}),
    ${c.showShadow ? '''boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.18),
        blurRadius: ${(c.elevation * 2).toStringAsFixed(0)},
        offset: Offset(0, ${(c.elevation / 2).toStringAsFixed(0)}),
      ),
    ],''' : ''}
  ),
  child: Text(
    '${_escape(c.text)}',
    style: TextStyle(
      color: ${_foreground(c.primaryColor)},
      fontWeight: FontWeight.w600,
    ),
  ),
)''';
  }

  static String _card(PlaygroundConfig c) {
    return '''Card(
  elevation: ${c.elevation.toStringAsFixed(1)},
  color: ${_color(c.primaryColor)},
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(${c.borderRadius.toStringAsFixed(0)}),
  ),
  child: Padding(
    padding: EdgeInsets.all(${c.padding.toStringAsFixed(0)}),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_escape(c.text)}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ${_foreground(c.primaryColor)},
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${_escape(c.secondaryText)}',
          style: TextStyle(color: ${_foreground(c.primaryColor)}),
        ),
      ],
    ),
  ),
)''';
  }

  static String _elevatedButton(PlaygroundConfig c) {
    return '''ElevatedButton.icon(
  onPressed: ${c.isEnabled ? '() {}' : 'null'},
  icon: const Icon(${_iconCode(c.icon)}),
  label: const Text('${_escape(c.text)}'),
  style: ElevatedButton.styleFrom(
    backgroundColor: ${_color(c.primaryColor)},
    foregroundColor: ${_foreground(c.primaryColor)},
    elevation: ${c.elevation.toStringAsFixed(1)},
    padding: EdgeInsets.symmetric(
      horizontal: ${c.padding.toStringAsFixed(0)},
      vertical: ${(c.padding * 0.6).toStringAsFixed(0)},
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(${c.borderRadius.toStringAsFixed(0)}),
    ),
  ),
)''';
  }

  static String _fab(PlaygroundConfig c) {
    if (c.extended) {
      return '''FloatingActionButton.extended(
  onPressed: () {},
  elevation: ${c.elevation.toStringAsFixed(1)},
  backgroundColor: ${_color(c.primaryColor)},
  foregroundColor: ${_foreground(c.primaryColor)},
  icon: const Icon(${_iconCode(c.icon)}),
  label: const Text('${_escape(c.text)}'),
)''';
    }
    return '''FloatingActionButton(
  onPressed: () {},
  elevation: ${c.elevation.toStringAsFixed(1)},
  backgroundColor: ${_color(c.primaryColor)},
  foregroundColor: ${_foreground(c.primaryColor)},
  child: const Icon(${_iconCode(c.icon)}),
)''';
  }

  static String _chip(PlaygroundConfig c) {
    return '''Chip(
  avatar: ${c.showAvatar ? 'const Icon(${_iconCode(c.icon)}, size: 18)' : 'null'},
  label: const Text('${_escape(c.text)}'),
  onDeleted: ${c.showDeleteIcon ? '() {}' : 'null'},
  backgroundColor: ${_color(c.primaryColor.withOpacity(0.12))},
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(${c.borderRadius.toStringAsFixed(0)}),
  ),
)''';
  }

  static String _listTile(PlaygroundConfig c) {
    return '''ListTile(
  leading: ${c.showLeading ? 'const Icon(${_iconCode(c.icon)})' : 'null'},
  title: const Text('${_escape(c.text)}'),
  subtitle: const Text('${_escape(c.secondaryText)}'),
  trailing: ${c.showTrailing ? 'const Icon(${_iconCode(c.trailingIcon ?? Icons.chevron_right_rounded)})' : 'null'},
  dense: ${c.dense},
  enabled: ${c.isEnabled},
  onTap: () {},
)''';
  }

  static String _cupertinoButton(PlaygroundConfig c) {
    return '''CupertinoButton(
  color: ${c.filled ? _color(c.primaryColor) : 'null'},
  borderRadius: BorderRadius.circular(${c.borderRadius.toStringAsFixed(0)}),
  padding: EdgeInsets.symmetric(
    horizontal: ${c.padding.toStringAsFixed(0)},
    vertical: 12,
  ),
  onPressed: () {},
  child: Text('${_escape(c.text)}'),
)''';
  }

  static String _cupertinoSwitch(PlaygroundConfig c) {
    return '''CupertinoSwitch(
  value: ${c.isSelected},
  activeColor: ${_color(c.primaryColor)},
  trackColor: ${_color(c.secondaryColor)},
  onChanged: (bool value) {},
)''';
  }

  static String _cupertinoActivityIndicator(PlaygroundConfig c) {
    return '''CupertinoActivityIndicator(
  radius: ${c.padding.toStringAsFixed(0)},
  animating: ${c.animating},
)''';
  }

  static String _textField(PlaygroundConfig c) {
    return '''TextField(
  obscureText: ${c.obscureText},
  maxLines: ${c.obscureText ? 1 : c.maxLines},
  decoration: InputDecoration(
    labelText: '${_escape(c.text)}',
    hintText: '${_escape(c.secondaryText)}',
    prefixIcon: ${c.showPrefixIcon ? 'const Icon(${_iconCode(c.icon)})' : 'null'},
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(${c.borderRadius.toStringAsFixed(0)}),
    ),
  ),
)''';
  }

  static String _slider(PlaygroundConfig c) {
    return '''Slider(
  value: ${c.sliderValue.toStringAsFixed(1)},
  min: ${c.minValue.toStringAsFixed(1)},
  max: ${c.maxValue.toStringAsFixed(1)},
  divisions: ${c.divisions},
  label: '${c.sliderValue.toStringAsFixed(0)}',
  activeColor: ${_color(c.primaryColor)},
  onChanged: (double value) {},
)''';
  }

  static String _switch(PlaygroundConfig c) {
    return '''Switch(
  value: ${c.isSelected},
  activeColor: ${_color(c.primaryColor)},
  thumbIcon: ${c.showThumbIcon ? 'const WidgetStatePropertyAll<Icon?>(Icon(Icons.check_rounded))' : 'null'},
  onChanged: (bool value) {},
)''';
  }

  static String _gestureDetector(PlaygroundConfig c) {
    return '''GestureDetector(
  onTap: ${c.enableTap ? '() {}' : 'null'},
  onDoubleTap: ${c.enableDoubleTap ? '() {}' : 'null'},
  onLongPress: ${c.enableLongPress ? '() {}' : 'null'},
  child: Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: ${_color(c.primaryColor.withOpacity(0.12))},
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Text('${_escape(c.text)}'),
  ),
)''';
  }

  static String _inkWell(PlaygroundConfig c) {
    return '''InkWell(
  onTap: () {},
  borderRadius: BorderRadius.circular(${c.borderRadius.toStringAsFixed(0)}),
  splashColor: ${_color(c.primaryColor.withOpacity(0.2))},
  highlightColor: ${_color(c.primaryColor.withOpacity(0.08))},
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    child: Text('${_escape(c.text)}'),
  ),
)''';
  }

  static String _listView(PlaygroundConfig c) {
    final horizontal = c.direction == Axis.horizontal;
    final extent = horizontal
        ? 'width: 180'
        : 'height: ${c.height.toStringAsFixed(0)}';
    final separator = c.showSeparator
        ? horizontal
            ? 'separatorBuilder: (context, index) => const SizedBox(width: 8),'
            : 'separatorBuilder: (context, index) => const Divider(height: 1),'
        : '';

    return '''ListView.${c.showSeparator ? 'separated' : 'builder'}(
  scrollDirection: ${horizontal ? 'Axis.horizontal' : 'Axis.vertical'},
  itemCount: ${c.itemCount},
  $separator
  itemBuilder: (context, index) => SizedBox(
    $extent,
    child: ListTile(
      leading: CircleAvatar(child: Text('\${index + 1}')),
      title: Text('Öğe \${index + 1}'),
    ),
  ),
)''';
  }

  static String _gridView(PlaygroundConfig c) {
    return '''GridView.count(
  crossAxisCount: ${c.crossAxisCount},
  mainAxisSpacing: ${c.spacing.toStringAsFixed(0)},
  crossAxisSpacing: ${c.spacing.toStringAsFixed(0)},
  childAspectRatio: ${c.childAspectRatio.toStringAsFixed(2)},
  children: List.generate(
    ${c.itemCount},
    (index) => Container(
      decoration: BoxDecoration(
        color: ${_color(c.primaryColor.withOpacity(0.12))},
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text('Kart \${index + 1}')),
    ),
  ),
)''';
  }

  static String _clipRRect(PlaygroundConfig c) {
    return '''ClipRRect(
  borderRadius: BorderRadius.circular(${c.borderRadius.toStringAsFixed(0)}),
  clipBehavior: ${_clip(c.clipBehavior)},
  child: Container(
    width: ${c.width.toStringAsFixed(0)},
    height: ${c.height.toStringAsFixed(0)},
    color: ${_color(c.primaryColor)},
    child: Center(
      child: Text(
        'Kırpılmış içerik',
        style: TextStyle(color: ${_foreground(c.primaryColor)}),
      ),
    ),
  ),
)''';
  }

  static String _opacity(PlaygroundConfig c) {
    return '''Opacity(
  opacity: ${c.opacity.toStringAsFixed(2)},
  alwaysIncludeSemantics: ${c.alwaysIncludeSemantics},
  child: Container(
    width: ${c.width.toStringAsFixed(0)},
    height: ${c.height.toStringAsFixed(0)},
    decoration: BoxDecoration(
      color: ${_color(c.primaryColor)},
      borderRadius: BorderRadius.circular(${c.borderRadius.toStringAsFixed(0)}),
    ),
    child: Center(
      child: Text(
        '%${(c.opacity * 100).toStringAsFixed(0)} opaklık',
        style: TextStyle(color: ${_foreground(c.primaryColor)}),
      ),
    ),
  ),
)''';
  }

  static String _iconWidget(PlaygroundConfig c) {
    return '''Icon(
  ${_iconCode(c.icon)},
  size: ${c.fontSize.toStringAsFixed(1)},
  color: ${_color(c.primaryColor)},
  semanticLabel: '${_escape(c.text)}',
)''';
  }

  static String _tooltip(PlaygroundConfig c) {
    return '''Tooltip(
  message: '${_escape(c.tooltipMessage)}',
  waitDuration: const Duration(milliseconds: ${c.tooltipWaitMs}),
  showDuration: const Duration(milliseconds: ${c.tooltipShowMs}),
  triggerMode: ${c.tooltipTapTrigger ? 'TooltipTriggerMode.tap' : 'TooltipTriggerMode.longPress'},
  child: IconButton(
    icon: const Icon(${_iconCode(c.icon)}),
    onPressed: () {},
  ),
)''';
  }

  static String _flutterLogo(PlaygroundConfig c) {
    return '''FlutterLogo(
  size: ${c.width.toStringAsFixed(0)},
  style: ${c.logoStyle == FlutterLogoStyle.markOnly ? 'FlutterLogoStyle.markOnly' : c.logoStyle == FlutterLogoStyle.horizontal ? 'FlutterLogoStyle.horizontal' : 'FlutterLogoStyle.stacked'},
)''';
  }

  static String _placeholder(PlaygroundConfig c) {
    return '''Placeholder(
  color: ${_color(c.primaryColor)},
  strokeWidth: ${c.padding.toStringAsFixed(1)},
  fallbackWidth: ${c.width.toStringAsFixed(0)},
  fallbackHeight: ${c.height.toStringAsFixed(0)},
)''';
  }

  // ---------------------------------------------------------------------------
  // Formatting helpers
  // ---------------------------------------------------------------------------

  static String _escape(String value) {
    return value
        .replaceAll('\\', '\\\\')
        .replaceAll("'", "\\'")
        .replaceAll('\$', '\\\$')
        .replaceAll('\n', '\\n')
        .replaceAll('\r', '\\r')
        .replaceAll('\t', '\\t');
  }

  static String _color(Color color) {
    final hex = color.value.toRadixString(16).padLeft(8, '0').toUpperCase();
    return 'Color(0x$hex)';
  }

  /// Keeps preview text legible on user-selected backgrounds.
  static String _foreground(Color background) {
    final brightness = ThemeData.estimateBrightnessForColor(background);
    return _color(
      brightness == Brightness.dark ? Colors.white : const Color(0xFF17181C),
    );
  }

  static String _fontWeight(FontWeight weight) {
    return 'FontWeight.w${(weight.index + 1) * 100}';
  }

  static String _fontStyle(FontStyle style) {
    return style == FontStyle.italic ? 'FontStyle.italic' : 'FontStyle.normal';
  }

  static String _decoration(TextDecoration decoration) {
    if (decoration == TextDecoration.underline) {
      return 'TextDecoration.underline';
    }
    if (decoration == TextDecoration.lineThrough) {
      return 'TextDecoration.lineThrough';
    }
    if (decoration == TextDecoration.overline) {
      return 'TextDecoration.overline';
    }
    return 'TextDecoration.none';
  }

  static String _textAlign(TextAlign align) {
    switch (align) {
      case TextAlign.left:
        return 'TextAlign.left';
      case TextAlign.right:
        return 'TextAlign.right';
      case TextAlign.justify:
        return 'TextAlign.justify';
      case TextAlign.start:
        return 'TextAlign.start';
      case TextAlign.end:
        return 'TextAlign.end';
      case TextAlign.center:
        return 'TextAlign.center';
    }
  }

  static String _overflow(TextOverflow overflow) {
    switch (overflow) {
      case TextOverflow.clip:
        return 'TextOverflow.clip';
      case TextOverflow.fade:
        return 'TextOverflow.fade';
      case TextOverflow.visible:
        return 'TextOverflow.visible';
      case TextOverflow.ellipsis:
        return 'TextOverflow.ellipsis';
    }
  }

  static String _alignment(Alignment alignment) {
    if (alignment == Alignment.topLeft) return 'Alignment.topLeft';
    if (alignment == Alignment.topCenter) return 'Alignment.topCenter';
    if (alignment == Alignment.topRight) return 'Alignment.topRight';
    if (alignment == Alignment.centerLeft) return 'Alignment.centerLeft';
    if (alignment == Alignment.centerRight) return 'Alignment.centerRight';
    if (alignment == Alignment.bottomLeft) return 'Alignment.bottomLeft';
    if (alignment == Alignment.bottomCenter) return 'Alignment.bottomCenter';
    if (alignment == Alignment.bottomRight) return 'Alignment.bottomRight';
    return 'Alignment.center';
  }

  static String _mainAxisAlignment(MainAxisAlignment value) {
    switch (value) {
      case MainAxisAlignment.start:
        return 'MainAxisAlignment.start';
      case MainAxisAlignment.end:
        return 'MainAxisAlignment.end';
      case MainAxisAlignment.center:
        return 'MainAxisAlignment.center';
      case MainAxisAlignment.spaceBetween:
        return 'MainAxisAlignment.spaceBetween';
      case MainAxisAlignment.spaceAround:
        return 'MainAxisAlignment.spaceAround';
      case MainAxisAlignment.spaceEvenly:
        return 'MainAxisAlignment.spaceEvenly';
    }
  }

  static String _crossAxisAlignment(CrossAxisAlignment value) {
    switch (value) {
      case CrossAxisAlignment.start:
        return 'CrossAxisAlignment.start';
      case CrossAxisAlignment.end:
        return 'CrossAxisAlignment.end';
      case CrossAxisAlignment.center:
        return 'CrossAxisAlignment.center';
      case CrossAxisAlignment.stretch:
        return 'CrossAxisAlignment.stretch';
      case CrossAxisAlignment.baseline:
        return 'CrossAxisAlignment.baseline';
    }
  }

  static String _mainAxisSize(MainAxisSize value) {
    return value == MainAxisSize.min ? 'MainAxisSize.min' : 'MainAxisSize.max';
  }

  static String _wrapAlignment(WrapAlignment value) {
    switch (value) {
      case WrapAlignment.start:
        return 'WrapAlignment.start';
      case WrapAlignment.end:
        return 'WrapAlignment.end';
      case WrapAlignment.center:
        return 'WrapAlignment.center';
      case WrapAlignment.spaceBetween:
        return 'WrapAlignment.spaceBetween';
      case WrapAlignment.spaceAround:
        return 'WrapAlignment.spaceAround';
      case WrapAlignment.spaceEvenly:
        return 'WrapAlignment.spaceEvenly';
    }
  }

  static String _stackFit(StackFit value) {
    switch (value) {
      case StackFit.loose:
        return 'StackFit.loose';
      case StackFit.expand:
        return 'StackFit.expand';
      case StackFit.passthrough:
        return 'StackFit.passthrough';
    }
  }

  static String _clip(Clip value) {
    switch (value) {
      case Clip.none:
        return 'Clip.none';
      case Clip.hardEdge:
        return 'Clip.hardEdge';
      case Clip.antiAlias:
        return 'Clip.antiAlias';
      case Clip.antiAliasWithSaveLayer:
        return 'Clip.antiAliasWithSaveLayer';
    }
  }

  static String _iconCode(IconData icon) {
    final code = icon.codePoint.toRadixString(16);
    return 'IconData(0x$code, fontFamily: \'MaterialIcons\')';
  }
}

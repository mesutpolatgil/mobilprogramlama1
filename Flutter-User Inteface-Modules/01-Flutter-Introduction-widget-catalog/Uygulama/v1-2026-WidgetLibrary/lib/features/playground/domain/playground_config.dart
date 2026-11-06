import 'package:flutter/material.dart';

/// A single immutable configuration shared by all playground screens.
///
/// Each widget-specific control panel only mutates the fields that are real
/// properties of that widget. The preview and code generator read the same
/// values, so the live preview and the generated Dart always stay in sync.
class PlaygroundConfig {
  final String text;
  final String secondaryText;
  final double width;
  final double height;
  final double padding;
  final double margin;
  final double borderRadius;
  final double elevation;
  final double opacity;
  final double fontSize;
  final double letterSpacing;
  final double lineHeight;
  final double widthFactor;
  final double heightFactor;
  final double spacing;
  final double runSpacing;
  final double childAspectRatio;
  final double sliderValue;
  final double minValue;
  final double maxValue;
  final double targetOpacity;
  final Color primaryColor;
  final Color secondaryColor;
  final Color? textColor;
  final Color richAccentColor;
  final bool showShadow;
  final bool isEnabled;
  final bool isSelected;
  final bool dense;
  final bool showAvatar;
  final bool showDeleteIcon;
  final bool extended;
  final bool filled;
  final bool obscureText;
  final bool showPrefixIcon;
  final bool showSeparator;
  final bool alwaysIncludeSemantics;
  final bool softWrap;
  final bool animating;
  final bool animationExpanded;
  final bool enableTap;
  final bool enableDoubleTap;
  final bool enableLongPress;
  final bool showLeading;
  final bool showTrailing;
  final bool showThumbIcon;
  final bool tooltipTapTrigger;
  final int maxLines;
  final int divisions;
  final int itemCount;
  final int crossAxisCount;
  final int childCount;
  final int animationDurationMs;
  final int tooltipWaitMs;
  final int tooltipShowMs;
  final int tapCount;
  final int doubleTapCount;
  final int longPressCount;
  final Alignment alignment;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextDecoration decoration;
  final TextOverflow overflow;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Axis direction;
  final WrapAlignment wrapAlignment;
  final StackFit stackFit;
  final Clip clipBehavior;
  final AnimationCurveOption curve;
  final IconData icon;
  final IconData? trailingIcon;
  final String tooltipMessage;
  final FlutterLogoStyle logoStyle;
  final String richAccentWord;

  const PlaygroundConfig({
    this.text = 'Flutter Widget',
    this.secondaryText = 'Kısa bir alt başlık',
    this.width = 180,
    this.height = 180,
    this.padding = 16,
    this.margin = 0,
    this.borderRadius = 16,
    this.elevation = 0,
    this.opacity = 1,
    this.fontSize = 28,
    this.letterSpacing = 0,
    this.lineHeight = 1.3,
    this.widthFactor = 1,
    this.heightFactor = 1,
    this.spacing = 12,
    this.runSpacing = 12,
    this.childAspectRatio = 1,
    this.sliderValue = 50,
    this.minValue = 0,
    this.maxValue = 100,
    this.targetOpacity = 1,
    this.primaryColor = const Color(0xFF3B5BDB),
    this.secondaryColor = const Color(0xFF5F636B),
    this.textColor,
    this.richAccentColor = const Color(0xFF3B5BDB),
    this.showShadow = false,
    this.isEnabled = true,
    this.isSelected = true,
    this.dense = false,
    this.showAvatar = true,
    this.showDeleteIcon = true,
    this.extended = true,
    this.filled = true,
    this.obscureText = false,
    this.showPrefixIcon = true,
    this.showSeparator = true,
    this.alwaysIncludeSemantics = false,
    this.softWrap = true,
    this.animating = true,
    this.animationExpanded = false,
    this.enableTap = true,
    this.enableDoubleTap = true,
    this.enableLongPress = true,
    this.showLeading = true,
    this.showTrailing = true,
    this.showThumbIcon = false,
    this.tooltipTapTrigger = false,
    this.maxLines = 3,
    this.divisions = 10,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.childCount = 3,
    this.animationDurationMs = 500,
    this.tooltipWaitMs = 500,
    this.tooltipShowMs = 1500,
    this.tapCount = 0,
    this.doubleTapCount = 0,
    this.longPressCount = 0,
    this.alignment = Alignment.center,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.w600,
    this.fontStyle = FontStyle.normal,
    this.decoration = TextDecoration.none,
    this.overflow = TextOverflow.ellipsis,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.direction = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.stackFit = StackFit.loose,
    this.clipBehavior = Clip.antiAlias,
    this.curve = AnimationCurveOption.easeInOut,
    this.icon = Icons.favorite_rounded,
    this.trailingIcon,
    this.tooltipMessage = 'Fotoğrafı indir',
    this.logoStyle = FlutterLogoStyle.markOnly,
    this.richAccentWord = 'Flutter',
  });

  PlaygroundConfig copyWith({
    String? text,
    String? secondaryText,
    double? width,
    double? height,
    double? padding,
    double? margin,
    double? borderRadius,
    double? elevation,
    double? opacity,
    double? fontSize,
    double? letterSpacing,
    double? lineHeight,
    double? widthFactor,
    double? heightFactor,
    double? spacing,
    double? runSpacing,
    double? childAspectRatio,
    double? sliderValue,
    double? minValue,
    double? maxValue,
    double? targetOpacity,
    Color? primaryColor,
    Color? secondaryColor,
    Color? textColor,
    bool clearTextColor = false,
    Color? richAccentColor,
    bool? showShadow,
    bool? isEnabled,
    bool? isSelected,
    bool? dense,
    bool? showAvatar,
    bool? showDeleteIcon,
    bool? extended,
    bool? filled,
    bool? obscureText,
    bool? showPrefixIcon,
    bool? showSeparator,
    bool? alwaysIncludeSemantics,
    bool? softWrap,
    bool? animating,
    bool? animationExpanded,
    bool? enableTap,
    bool? enableDoubleTap,
    bool? enableLongPress,
    bool? showLeading,
    bool? showTrailing,
    bool? showThumbIcon,
    bool? tooltipTapTrigger,
    int? maxLines,
    int? divisions,
    int? itemCount,
    int? crossAxisCount,
    int? childCount,
    int? animationDurationMs,
    int? tooltipWaitMs,
    int? tooltipShowMs,
    int? tapCount,
    int? doubleTapCount,
    int? longPressCount,
    Alignment? alignment,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    TextOverflow? overflow,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    Axis? direction,
    WrapAlignment? wrapAlignment,
    StackFit? stackFit,
    Clip? clipBehavior,
    AnimationCurveOption? curve,
    IconData? icon,
    IconData? trailingIcon,
    String? tooltipMessage,
    FlutterLogoStyle? logoStyle,
    String? richAccentWord,
  }) {
    return PlaygroundConfig(
      text: text ?? this.text,
      secondaryText: secondaryText ?? this.secondaryText,
      width: width ?? this.width,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      opacity: opacity ?? this.opacity,
      fontSize: fontSize ?? this.fontSize,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      lineHeight: lineHeight ?? this.lineHeight,
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
      spacing: spacing ?? this.spacing,
      runSpacing: runSpacing ?? this.runSpacing,
      childAspectRatio: childAspectRatio ?? this.childAspectRatio,
      sliderValue: sliderValue ?? this.sliderValue,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
      targetOpacity: targetOpacity ?? this.targetOpacity,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      textColor: clearTextColor ? null : (textColor ?? this.textColor),
      richAccentColor: richAccentColor ?? this.richAccentColor,
      showShadow: showShadow ?? this.showShadow,
      isEnabled: isEnabled ?? this.isEnabled,
      isSelected: isSelected ?? this.isSelected,
      dense: dense ?? this.dense,
      showAvatar: showAvatar ?? this.showAvatar,
      showDeleteIcon: showDeleteIcon ?? this.showDeleteIcon,
      extended: extended ?? this.extended,
      filled: filled ?? this.filled,
      obscureText: obscureText ?? this.obscureText,
      showPrefixIcon: showPrefixIcon ?? this.showPrefixIcon,
      showSeparator: showSeparator ?? this.showSeparator,
      alwaysIncludeSemantics:
          alwaysIncludeSemantics ?? this.alwaysIncludeSemantics,
      softWrap: softWrap ?? this.softWrap,
      animating: animating ?? this.animating,
      animationExpanded: animationExpanded ?? this.animationExpanded,
      enableTap: enableTap ?? this.enableTap,
      enableDoubleTap: enableDoubleTap ?? this.enableDoubleTap,
      enableLongPress: enableLongPress ?? this.enableLongPress,
      showLeading: showLeading ?? this.showLeading,
      showTrailing: showTrailing ?? this.showTrailing,
      showThumbIcon: showThumbIcon ?? this.showThumbIcon,
      tooltipTapTrigger: tooltipTapTrigger ?? this.tooltipTapTrigger,
      maxLines: maxLines ?? this.maxLines,
      divisions: divisions ?? this.divisions,
      itemCount: itemCount ?? this.itemCount,
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      childCount: childCount ?? this.childCount,
      animationDurationMs:
          animationDurationMs ?? this.animationDurationMs,
      tooltipWaitMs: tooltipWaitMs ?? this.tooltipWaitMs,
      tooltipShowMs: tooltipShowMs ?? this.tooltipShowMs,
      tapCount: tapCount ?? this.tapCount,
      doubleTapCount: doubleTapCount ?? this.doubleTapCount,
      longPressCount: longPressCount ?? this.longPressCount,
      alignment: alignment ?? this.alignment,
      textAlign: textAlign ?? this.textAlign,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      decoration: decoration ?? this.decoration,
      overflow: overflow ?? this.overflow,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      direction: direction ?? this.direction,
      wrapAlignment: wrapAlignment ?? this.wrapAlignment,
      stackFit: stackFit ?? this.stackFit,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      curve: curve ?? this.curve,
      icon: icon ?? this.icon,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      tooltipMessage: tooltipMessage ?? this.tooltipMessage,
      logoStyle: logoStyle ?? this.logoStyle,
      richAccentWord: richAccentWord ?? this.richAccentWord,
    );
  }
}

/// Real Flutter curves exposed by the animation playground.
enum AnimationCurveOption {
  linear('Doğrusal', 'Curves.linear', Curves.linear),
  easeIn('Yavaş başla', 'Curves.easeIn', Curves.easeIn),
  easeOut('Yavaş bitir', 'Curves.easeOut', Curves.easeOut),
  easeInOut('Yumuşak', 'Curves.easeInOut', Curves.easeInOut),
  fastOutSlowIn(
    'Hızlı çık, yavaş in',
    'Curves.fastOutSlowIn',
    Curves.fastOutSlowIn,
  ),
  bounceOut('Zıplayarak', 'Curves.bounceOut', Curves.bounceOut),
  elasticOut('Esneyerek', 'Curves.elasticOut', Curves.elasticOut);

  final String label;
  final String codeName;
  final Curve curve;

  const AnimationCurveOption(this.label, this.codeName, this.curve);
}

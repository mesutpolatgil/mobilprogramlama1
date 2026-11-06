import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';

class DartCodeHighlightView extends StatelessWidget {
  final String code;
  final bool isDarkMode;
  final double fontSize;

  const DartCodeHighlightView({
    super.key,
    required this.code,
    required this.isDarkMode,
    this.fontSize = 13.5,
  });

  @override
  Widget build(BuildContext context) {
    return HighlightView(
      code,
      language: 'dart',
      theme: isDarkMode ? atomOneDarkTheme : atomOneLightTheme,
      padding: const EdgeInsets.all(16),
      textStyle: TextStyle(
        fontFamily: 'monospace',
        fontSize: fontSize,
        height: 1.45,
      ),
    );
  }
}

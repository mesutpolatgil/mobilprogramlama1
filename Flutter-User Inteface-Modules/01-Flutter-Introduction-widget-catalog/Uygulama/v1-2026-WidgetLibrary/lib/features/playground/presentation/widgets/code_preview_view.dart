import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/syntax_highlighter.dart';

/// A quiet, collapsible code surface that always reflects the live config.
class CodePreviewView extends StatefulWidget {
  final String dartCode;

  const CodePreviewView({
    super.key,
    required this.dartCode,
  });

  @override
  State<CodePreviewView> createState() => _CodePreviewViewState();
}

class _CodePreviewViewState extends State<CodePreviewView> {
  bool _expanded = false;

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.dartCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_rounded, size: 18),
            SizedBox(width: AppSpacing.sm),
            Text('Dart kodu panoya kopyalandı'),
          ],
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final lineCount = widget.dartCode.split('\n').length;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.sm,
              AppSpacing.sm,
              AppSpacing.sm,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppRadii.md),
                    onTap: _toggle,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              borderRadius:
                                  BorderRadius.circular(AppRadii.md),
                            ),
                            child: Icon(
                              Icons.code_rounded,
                              size: 19,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dart kodu',
                                  style: theme.textTheme.titleSmall,
                                ),
                                Text(
                                  _expanded
                                      ? 'Canlı güncellenir · $lineCount satır'
                                      : 'Göstermek için dokun · $lineCount satır',
                                  style:
                                      theme.textTheme.labelSmall?.copyWith(
                                    color:
                                        theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: _copyToClipboard,
                  icon: const Icon(Icons.copy_rounded, size: 16),
                  label: const Text('Kopyala'),
                ),
                IconButton(
                  tooltip: _expanded ? 'Kodu gizle' : 'Kodu göster',
                  onPressed: _toggle,
                  icon: AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    child: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: _expanded
                ? Container(
                    color: isDark
                        ? const Color(0xFF282C34)
                        : const Color(0xFFFAFAFA),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 360),
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DartCodeHighlightView(
                            code: widget.dartCode,
                            isDarkMode: isDark,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

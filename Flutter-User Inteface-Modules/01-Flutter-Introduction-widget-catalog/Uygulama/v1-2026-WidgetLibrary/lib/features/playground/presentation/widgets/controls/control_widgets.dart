import 'package:flutter/material.dart';

import '../../../../../core/theme/theme.dart';

class ControlSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ControlSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...children,
      ],
    );
  }
}

class ControlSlider extends StatelessWidget {
  final String label;
  final String valueLabel;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final ValueChanged<double> onChanged;

  const ControlSlider({
    super.key,
    required this.label,
    required this.valueLabel,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.divisions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(label, style: theme.textTheme.bodySmall),
              ),
              Text(
                valueLabel,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          Slider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class ControlDropdown<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  const ControlDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.textTheme.bodySmall),
          const SizedBox(height: AppSpacing.xs),
          DropdownButtonFormField<T>(
            value: value,
            isExpanded: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: items,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class ControlSegmented<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<ButtonSegment<T>> segments;
  final ValueChanged<T> onChanged;

  const ControlSegmented({
    super.key,
    required this.label,
    required this.value,
    required this.segments,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.textTheme.bodySmall),
          const SizedBox(height: AppSpacing.xs),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SegmentedButton<T>(
              showSelectedIcon: false,
              segments: segments,
              selected: {value},
              onSelectionChanged: (selection) => onChanged(selection.first),
            ),
          ),
        ],
      ),
    );
  }
}

class ControlSwitch extends StatelessWidget {
  final String label;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ControlSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label, style: theme.textTheme.bodySmall),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle!,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

class ControlTextField extends StatefulWidget {
  final String label;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final int maxLines;

  const ControlTextField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.maxLines = 1,
  });

  @override
  State<ControlTextField> createState() => _ControlTextFieldState();
}

class _ControlTextFieldState extends State<ControlTextField> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant ControlTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_focusNode.hasFocus &&
        widget.initialValue != _controller.text) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: theme.textTheme.bodySmall),
          const SizedBox(height: AppSpacing.xs),
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
            decoration: const InputDecoration(),
          ),
        ],
      ),
    );
  }
}

class ControlColorPicker extends StatelessWidget {
  final String label;
  final Color? selected;
  final ValueChanged<Color> onChanged;
  final VoidCallback? onClear;

  const ControlColorPicker({
    super.key,
    required this.label,
    required this.selected,
    required this.onChanged,
    this.onClear,
  });

  static const List<Color> _swatches = [
    Color(0xFF3B5BDB),
    Color(0xFF17181C),
    Color(0xFF5F636B),
    Color(0xFFB42318),
    Color(0xFF027A48),
    Color(0xFFB54708),
    Color(0xFF7A5AF8),
    Color(0xFFC11574),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(label, style: theme.textTheme.bodySmall),
              ),
              if (onClear != null)
                TextButton(
                  onPressed: onClear,
                  child: const Text('Varsayılan'),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              ..._swatches.map((color) {
                final isSelected = selected?.value == color.value;
                return _Swatch(
                  color: color,
                  isSelected: isSelected,
                  onTap: () => onChanged(color),
                );
              }),
              _Swatch(
                color: selected ?? theme.colorScheme.primary,
                isSelected: false,
                onTap: () async {
                  final picked = await showDialog<Color>(
                    context: context,
                    builder: (_) => _ColorPickerDialog(
                      initial: selected ?? theme.colorScheme.primary,
                    ),
                  );
                  if (picked != null) onChanged(picked);
                },
                icon: Icons.tune_rounded,
                outlined: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;
  final bool outlined;

  const _Swatch({
    required this.color,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadii.sm),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: outlined ? null : color,
          borderRadius: BorderRadius.circular(AppRadii.sm),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.onSurface
                : theme.colorScheme.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: icon != null
            ? Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant)
            : isSelected
                ? Icon(
                    Icons.check_rounded,
                    size: 16,
                    color: ThemeData.estimateBrightnessForColor(color) ==
                            Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )
                : null,
      ),
    );
  }
}

class _ColorPickerDialog extends StatefulWidget {
  final Color initial;

  const _ColorPickerDialog({required this.initial});

  @override
  State<_ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<_ColorPickerDialog> {
  late HSVColor _hsv;

  @override
  void initState() {
    super.initState();
    _hsv = HSVColor.fromColor(widget.initial);
  }

  @override
  Widget build(BuildContext context) {
    final color = _hsv.toColor();
    return AlertDialog(
      title: const Text('Özel renk'),
      content: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(AppRadii.md),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            _hsvSlider('Renk tonu', _hsv.hue, 0, 360, (v) {
              setState(() => _hsv = _hsv.withHue(v));
            }),
            _hsvSlider('Doygunluk', _hsv.saturation, 0, 1, (v) {
              setState(() => _hsv = _hsv.withSaturation(v));
            }),
            _hsvSlider('Parlaklık', _hsv.value, 0, 1, (v) {
              setState(() => _hsv = _hsv.withValue(v));
            }),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Vazgeç'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, color),
          child: const Text('Rengi kullan'),
        ),
      ],
    );
  }

  Widget _hsvSlider(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Row(
      children: [
        SizedBox(width: 76, child: Text(label)),
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class AlignmentSelector extends StatelessWidget {
  final Alignment value;
  final ValueChanged<Alignment> onChanged;

  const AlignmentSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  static const List<Alignment> _alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hizalama', style: theme.textTheme.bodySmall),
          const SizedBox(height: AppSpacing.xs),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            child: Column(
              children: List.generate(3, (row) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (col) {
                    final alignment = _alignments[row * 3 + col];
                    final selected = value == alignment;
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: InkWell(
                        onTap: () => onChanged(alignment),
                        borderRadius: BorderRadius.circular(AppRadii.sm),
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: selected
                                ? theme.colorScheme.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(AppRadii.sm),
                          ),
                          child: Icon(
                            Icons.circle,
                            size: 7,
                            color: selected
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

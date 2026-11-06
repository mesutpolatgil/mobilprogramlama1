import 'dart:math' as math;

import 'package:flutter/material.dart';

/// The visual language used for every category and widget heading.
///
/// Instead of unrelated stock photography, the catalog draws a schematic of
/// the concept it represents: a form for input widgets, a scrollable list for
/// scrolling, a spinner for async widgets, and so on. The artwork is painted
/// at runtime, so it stays sharp at every size and works fully offline.
enum CatalogArtworkVariant { hero, category, widget }

class CatalogArtwork extends StatelessWidget {
  final String categoryId;
  final String? seed;
  final IconData? glyph;
  final CatalogArtworkVariant variant;
  final Alignment glyphAlignment;
  final double glyphScale;

  const CatalogArtwork({
    super.key,
    required this.categoryId,
    this.seed,
    this.glyph,
    this.variant = CatalogArtworkVariant.category,
    this.glyphAlignment = Alignment.center,
    this.glyphScale = 0.42,
  });

  @override
  Widget build(BuildContext context) {
    final palette = ArtworkPalette.of(categoryId, seed: seed);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite ? constraints.maxWidth : 320.0;
        final height = constraints.maxHeight.isFinite ? constraints.maxHeight : 220.0;
        final shortest = math.min(width, height);
        final glyphSize = (shortest * glyphScale).clamp(18.0, 96.0);

        return Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: _CatalogArtworkPainter(
                categoryId: categoryId,
                seed: seed,
                variant: variant,
                palette: palette,
              ),
            ),
            if (glyph != null)
              Align(
                alignment: glyphAlignment,
                child: Padding(
                  padding: EdgeInsets.all(shortest * 0.08),
                  child: Container(
                    width: glyphSize,
                    height: glyphSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(glyphSize * 0.28),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.18),
                          Colors.white.withOpacity(0.06),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: palette.accent.withOpacity(0.28),
                          blurRadius: glyphSize * 0.34,
                          spreadRadius: -2,
                        ),
                      ],
                    ),
                    child: Icon(
                      glyph,
                      size: glyphSize * 0.54,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// Deep, saturated palettes that keep white display text readable while
/// giving every category its own recognizable mood.
class ArtworkPalette {
  final Color start;
  final Color end;
  final Color accent;
  final Color secondary;

  const ArtworkPalette({
    required this.start,
    required this.end,
    required this.accent,
    required this.secondary,
  });

  static const Map<String, ArtworkPalette> _palettes = {
    'basics': ArtworkPalette(
      start: Color(0xFF14215A),
      end: Color(0xFF060913),
      accent: Color(0xFF7C9CFF),
      secondary: Color(0xFF4DD0E1),
    ),
    'material': ArtworkPalette(
      start: Color(0xFF10315F),
      end: Color(0xFF050B14),
      accent: Color(0xFF5EA8FF),
      secondary: Color(0xFF9F7BFF),
    ),
    'cupertino': ArtworkPalette(
      start: Color(0xFF1D3557),
      end: Color(0xFF060B12),
      accent: Color(0xFF86B9FF),
      secondary: Color(0xFF64D2FF),
    ),
    'layout': ArtworkPalette(
      start: Color(0xFF2C1B5E),
      end: Color(0xFF0B0616),
      accent: Color(0xFFB59CFF),
      secondary: Color(0xFFFF9AD5),
    ),
    'text': ArtworkPalette(
      start: Color(0xFF4E2F0E),
      end: Color(0xFF150C04),
      accent: Color(0xFFFFC46B),
      secondary: Color(0xFFFF8A65),
    ),
    'input': ArtworkPalette(
      start: Color(0xFF0B403E),
      end: Color(0xFF031110),
      accent: Color(0xFF6EE7D8),
      secondary: Color(0xFF7FB2FF),
    ),
    'interaction': ArtworkPalette(
      start: Color(0xFF4E173F),
      end: Color(0xFF16040E),
      accent: Color(0xFFFF8FD1),
      secondary: Color(0xFFFFB86B),
    ),
    'scrolling': ArtworkPalette(
      start: Color(0xFF083348),
      end: Color(0xFF020B11),
      accent: Color(0xFF6BD8FF),
      secondary: Color(0xFF8A9CFF),
    ),
    'animation': ArtworkPalette(
      start: Color(0xFF54220F),
      end: Color(0xFF150602),
      accent: Color(0xFFFFA26B),
      secondary: Color(0xFFFFE07A),
    ),
    'async': ArtworkPalette(
      start: Color(0xFF0D3450),
      end: Color(0xFF030A11),
      accent: Color(0xFF76C7FF),
      secondary: Color(0xFF7BEFC0),
    ),
    'painting': ArtworkPalette(
      start: Color(0xFF3E1A52),
      end: Color(0xFF110514),
      accent: Color(0xFFE59BFF),
      secondary: Color(0xFFFF9B8A),
    ),
    'assets': ArtworkPalette(
      start: Color(0xFF0F442D),
      end: Color(0xFF03110C),
      accent: Color(0xFF7BEFAE),
      secondary: Color(0xFF6BD8FF),
    ),
    'styling': ArtworkPalette(
      start: Color(0xFF2F215C),
      end: Color(0xFF0A0614),
      accent: Color(0xFFC4B5FD),
      secondary: Color(0xFFFFB86B),
    ),
    'accessibility': ArtworkPalette(
      start: Color(0xFF163559),
      end: Color(0xFF040910),
      accent: Color(0xFF93C5FD),
      secondary: Color(0xFF7BEFAE),
    ),
    'hero': ArtworkPalette(
      start: Color(0xFF101E52),
      end: Color(0xFF04060F),
      accent: Color(0xFF7C9CFF),
      secondary: Color(0xFF6EE7D8),
    ),
  };

  static ArtworkPalette of(String categoryId, {String? seed}) {
    final base = _palettes[categoryId] ?? _palettes['basics']!;
    if (seed == null || seed.isEmpty) return base;

    final hash = seed.codeUnits.fold<int>(0, (value, unit) => value + unit);
    final mix = (hash % 5) / 10;
    return ArtworkPalette(
      start: base.start,
      end: base.end,
      accent: Color.lerp(base.accent, base.secondary, mix * 0.5) ?? base.accent,
      secondary: Color.lerp(base.secondary, base.accent, mix * 0.35) ??
          base.secondary,
    );
  }
}

class _CatalogArtworkPainter extends CustomPainter {
  final String categoryId;
  final String? seed;
  final CatalogArtworkVariant variant;
  final ArtworkPalette palette;

  _CatalogArtworkPainter({
    required this.categoryId,
    required this.seed,
    required this.variant,
    required this.palette,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;

    final rect = Offset.zero & size;
    _paintBackdrop(canvas, size, rect);
    _paintGrid(canvas, size);
    _paintMotif(canvas, size);
    _paintVignette(canvas, size, rect);
  }

  void _paintBackdrop(Canvas canvas, Size size, Rect rect) {
    final background = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [palette.start, palette.end],
      ).createShader(rect);
    canvas.drawRect(rect, background);

    final glowCenter = Offset(size.width * 0.78, size.height * 0.2);
    final glowRadius = size.shortestSide * 0.85;
    final glow = Paint()
      ..shader = RadialGradient(
        colors: [
          palette.accent.withOpacity(0.36),
          palette.accent.withOpacity(0.08),
          Colors.transparent,
        ],
        stops: const [0, 0.5, 1],
      ).createShader(
        Rect.fromCircle(center: glowCenter, radius: glowRadius),
      );
    canvas.drawCircle(glowCenter, glowRadius, glow);

    final streak = Path()
      ..moveTo(size.width * 0.42, size.height)
      ..lineTo(size.width * 0.9, 0)
      ..lineTo(size.width * 1.08, 0)
      ..lineTo(size.width * 0.62, size.height)
      ..close();
    canvas.drawPath(
      streak,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.055),
            Colors.white.withOpacity(0.0),
          ],
        ).createShader(rect),
    );
  }

  void _paintGrid(Canvas canvas, Size size) {
    final step = size.shortestSide < 140 ? 18.0 : 34.0;
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.045)
      ..strokeWidth = 1;

    for (double x = step; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = step; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  void _paintMotif(Canvas canvas, Size size) {
    final isWide = size.width > size.height * 1.45;
    final side = isWide
        ? math.min(size.height * 0.68, size.width * 0.34)
        : size.shortestSide * 0.8;

    final Offset origin;
    if (variant == CatalogArtworkVariant.hero) {
      origin = Offset(size.width - side - size.width * 0.055, (size.height - side) / 2);
    } else if (isWide) {
      origin = Offset(size.width * 0.62, (size.height - side) / 2);
    } else {
      origin = Offset(
        (size.width - side) / 2,
        (size.height - side) / 2,
      );
    }

    canvas.save();
    canvas.translate(origin.dx, origin.dy);
    canvas.scale(side / 100);
    _paintMotifUnit(canvas, categoryId: categoryId, palette: palette);
    canvas.restore();
  }

  void _paintMotifUnit(
    Canvas canvas, {
    required String categoryId,
    required ArtworkPalette palette,
  }) {
    switch (categoryId) {
      case 'material':
        _materialMotif(canvas, palette);
        break;
      case 'cupertino':
        _cupertinoMotif(canvas, palette);
        break;
      case 'layout':
        _layoutMotif(canvas, palette);
        break;
      case 'text':
        _textMotif(canvas, palette);
        break;
      case 'input':
        _inputMotif(canvas, palette);
        break;
      case 'interaction':
        _interactionMotif(canvas, palette);
        break;
      case 'scrolling':
        _scrollingMotif(canvas, palette);
        break;
      case 'animation':
        _animationMotif(canvas, palette);
        break;
      case 'async':
        _asyncMotif(canvas, palette);
        break;
      case 'painting':
        _paintingMotif(canvas, palette);
        break;
      case 'assets':
        _assetsMotif(canvas, palette);
        break;
      case 'styling':
        _stylingMotif(canvas, palette);
        break;
      case 'accessibility':
        _accessibilityMotif(canvas, palette);
        break;
      case 'hero':
        _heroMotif(canvas, palette);
        break;
      case 'basics':
      default:
        _basicsMotif(canvas, palette);
    }
  }

  // ---------------------------------------------------------------------------
  // Motifs are drawn in a 100 x 100 coordinate space and scaled by the caller.
  // ---------------------------------------------------------------------------

  void _basicsMotif(Canvas canvas, ArtworkPalette palette) {
    _strokeRRect(canvas, const Rect.fromLTWH(10, 12, 80, 76), 10,
        Colors.white.withOpacity(0.24), 1.4);
    _fillRRect(canvas, const Rect.fromLTWH(16, 20, 68, 12), 6,
        palette.accent.withOpacity(0.32));
    _fillRRect(canvas, const Rect.fromLTWH(16, 38, 30, 20), 5,
        Colors.white.withOpacity(0.12));
    _fillRRect(canvas, const Rect.fromLTWH(50, 38, 34, 20), 5,
        palette.secondary.withOpacity(0.22));
    _fillRRect(canvas, const Rect.fromLTWH(16, 64, 68, 8), 4,
        Colors.white.withOpacity(0.16));
    _fillRRect(canvas, const Rect.fromLTWH(16, 76, 44, 6), 3,
        Colors.white.withOpacity(0.10));
  }

  void _materialMotif(Canvas canvas, ArtworkPalette palette) {
    _fillRRect(canvas, const Rect.fromLTWH(8, 10, 46, 18), 9,
        palette.accent.withOpacity(0.55));
    _fillRRect(canvas, const Rect.fromLTWH(8, 34, 64, 52), 9,
        Colors.white.withOpacity(0.10));
    _strokeRRect(canvas, const Rect.fromLTWH(8, 34, 64, 52), 9,
        Colors.white.withOpacity(0.18), 1.2);
    _fillRRect(canvas, const Rect.fromLTWH(16, 44, 48, 7), 3.5,
        Colors.white.withOpacity(0.22));
    _fillRRect(canvas, const Rect.fromLTWH(16, 56, 34, 5), 2.5,
        Colors.white.withOpacity(0.12));
    _fillCircle(canvas, const Offset(82, 30), 13,
        palette.secondary.withOpacity(0.55));
    _fillCircle(canvas, const Offset(82, 30), 5,
        Colors.white.withOpacity(0.5));
    _fillRRect(canvas, const Rect.fromLTWH(16, 70, 22, 8), 4,
        palette.accent.withOpacity(0.35));
  }

  void _cupertinoMotif(Canvas canvas, ArtworkPalette palette) {
    _strokeRRect(canvas, const Rect.fromLTWH(28, 8, 44, 84), 12,
        Colors.white.withOpacity(0.26), 1.4);
    _fillRRect(canvas, const Rect.fromLTWH(35, 16, 30, 5), 2.5,
        Colors.white.withOpacity(0.24));
    _fillRRect(canvas, const Rect.fromLTWH(35, 28, 24, 4), 2,
        palette.accent.withOpacity(0.5));
    _fillRRect(canvas, const Rect.fromLTWH(34, 42, 32, 16), 8,
        palette.accent.withOpacity(0.4));
    _fillCircle(canvas, const Offset(58, 50), 6, Colors.white.withOpacity(0.8));
    _fillRRect(canvas, const Rect.fromLTWH(38, 68, 24, 4), 2,
        Colors.white.withOpacity(0.18));
    _fillRRect(canvas, const Rect.fromLTWH(38, 76, 16, 4), 2,
        Colors.white.withOpacity(0.10));
  }

  void _layoutMotif(Canvas canvas, ArtworkPalette palette) {
    _strokeRRect(canvas, const Rect.fromLTWH(8, 10, 84, 80), 8,
        Colors.white.withOpacity(0.22), 1.3);
    _strokeRRect(canvas, const Rect.fromLTWH(20, 22, 60, 56), 6,
        palette.accent.withOpacity(0.6), 1.4);
    _fillRRect(canvas, const Rect.fromLTWH(32, 34, 36, 32), 5,
        palette.secondary.withOpacity(0.22));
    _fillRRect(canvas, const Rect.fromLTWH(42, 44, 16, 12), 4,
        Colors.white.withOpacity(0.5));
    _line(canvas, const Offset(8, 50), const Offset(20, 50),
        Colors.white.withOpacity(0.4), 1.2);
    _line(canvas, const Offset(80, 50), const Offset(92, 50),
        Colors.white.withOpacity(0.4), 1.2);
  }

  void _textMotif(Canvas canvas, ArtworkPalette palette) {
    final painter = TextPainter(
      text: TextSpan(
        text: 'Aa',
        style: TextStyle(
          color: Colors.white.withOpacity(0.86),
          fontSize: 48,
          fontWeight: FontWeight.w700,
          letterSpacing: -3,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    painter.paint(canvas, const Offset(10, 6));

    _fillRRect(canvas, const Rect.fromLTWH(10, 62, 80, 7), 3.5,
        palette.accent.withOpacity(0.55));
    _fillRRect(canvas, const Rect.fromLTWH(10, 76, 58, 6), 3,
        Colors.white.withOpacity(0.20));
    _fillRRect(canvas, const Rect.fromLTWH(10, 88, 68, 5), 2.5,
        Colors.white.withOpacity(0.12));
  }

  void _inputMotif(Canvas canvas, ArtworkPalette palette) {
    _strokeRRect(canvas, const Rect.fromLTWH(8, 12, 84, 26), 7,
        palette.accent.withOpacity(0.7), 1.4);
    _fillRRect(canvas, const Rect.fromLTWH(16, 22, 34, 6), 3,
        Colors.white.withOpacity(0.4));
    _line(canvas, const Offset(70, 18), const Offset(70, 32),
        palette.secondary.withOpacity(0.95), 2);
    _strokeRRect(canvas, const Rect.fromLTWH(12, 54, 18, 18), 5,
        Colors.white.withOpacity(0.35), 1.4);
    _line(canvas, const Offset(15, 63), const Offset(20, 68),
        palette.accent, 2.2);
    _line(canvas, const Offset(20, 68), const Offset(28, 59),
        palette.accent, 2.2);
    _fillRRect(canvas, const Rect.fromLTWH(58, 56, 30, 16), 8,
        palette.accent.withOpacity(0.45));
    _fillCircle(canvas, const Offset(80, 64), 6, Colors.white.withOpacity(0.9));
    _fillRRect(canvas, const Rect.fromLTWH(12, 84, 76, 6), 3,
        Colors.white.withOpacity(0.16));
  }

  void _interactionMotif(Canvas canvas, ArtworkPalette palette) {
    const center = Offset(50, 52);
    _strokeCircle(canvas, center, 32, palette.accent.withOpacity(0.16), 1.6);
    _strokeCircle(canvas, center, 22, palette.accent.withOpacity(0.36), 1.8);
    _strokeCircle(canvas, center, 12, palette.accent.withOpacity(0.72), 2);
    _fillCircle(canvas, center, 5, Colors.white.withOpacity(0.92));
    _line(canvas, const Offset(50, 8), const Offset(50, 20),
        Colors.white.withOpacity(0.28), 1.4);
    _line(canvas, const Offset(50, 84), const Offset(50, 96),
        Colors.white.withOpacity(0.28), 1.4);
    _line(canvas, const Offset(6, 52), const Offset(18, 52),
        Colors.white.withOpacity(0.28), 1.4);
    _line(canvas, const Offset(82, 52), const Offset(94, 52),
        Colors.white.withOpacity(0.28), 1.4);
  }

  void _scrollingMotif(Canvas canvas, ArtworkPalette palette) {
    _fillRRect(canvas, const Rect.fromLTWH(8, 10, 74, 20), 6,
        Colors.white.withOpacity(0.14));
    _fillRRect(canvas, const Rect.fromLTWH(8, 38, 60, 20), 6,
        palette.accent.withOpacity(0.28));
    _fillRRect(canvas, const Rect.fromLTWH(8, 66, 74, 20), 6,
        Colors.white.withOpacity(0.10));
    _fillRRect(canvas, const Rect.fromLTWH(14, 38, 18, 20), 4,
        palette.secondary.withOpacity(0.45));
    _fillRRect(canvas, const Rect.fromLTWH(38, 45, 24, 6), 3,
        Colors.white.withOpacity(0.34));
    _fillRRect(canvas, const Rect.fromLTWH(88, 8, 5, 82), 2.5,
        Colors.white.withOpacity(0.12));
    _fillRRect(canvas, const Rect.fromLTWH(88, 30, 5, 30), 2.5,
        palette.accent.withOpacity(0.8));
  }

  void _animationMotif(Canvas canvas, ArtworkPalette palette) {
    final path = Path()
      ..moveTo(8, 82)
      ..quadraticBezierTo(34, 82, 50, 52)
      ..quadraticBezierTo(66, 22, 92, 20);
    _dashedPath(canvas, path, Colors.white.withOpacity(0.3), 1.4);

    _fillRRect(canvas, const Rect.fromLTWH(12, 68, 14, 14), 4,
        palette.accent.withOpacity(0.4));
    _fillRRect(canvas, const Rect.fromLTWH(43, 40, 16, 16), 5,
        palette.accent.withOpacity(0.7));
    _fillRRect(canvas, const Rect.fromLTWH(76, 10, 18, 18), 6,
        palette.secondary.withOpacity(0.85));
    _fillCircle(canvas, const Offset(20, 24), 4, Colors.white.withOpacity(0.3));
    _fillCircle(canvas, const Offset(34, 16), 2.5, Colors.white.withOpacity(0.2));
  }

  void _asyncMotif(Canvas canvas, ArtworkPalette palette) {
    final arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withOpacity(0.14);
    canvas.drawArc(
      Rect.fromCircle(center: const Offset(50, 36), radius: 22),
      -math.pi / 2,
      math.pi * 1.55,
      false,
      arcPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: const Offset(50, 36), radius: 22),
      -math.pi / 2,
      math.pi * 0.72,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..strokeCap = StrokeCap.round
        ..color = palette.accent,
    );
    _fillRRect(canvas, const Rect.fromLTWH(10, 72, 80, 8), 4,
        Colors.white.withOpacity(0.12));
    _fillRRect(canvas, const Rect.fromLTWH(10, 72, 48, 8), 4,
        palette.accent.withOpacity(0.8));
    _fillRRect(canvas, const Rect.fromLTWH(24, 88, 52, 4), 2,
        Colors.white.withOpacity(0.16));
  }

  void _paintingMotif(Canvas canvas, ArtworkPalette palette) {
    canvas.save();
    canvas.translate(38, 38);
    canvas.rotate(-0.28);
    _fillRRect(canvas, const Rect.fromLTWH(-24, -24, 48, 48), 8,
        palette.accent.withOpacity(0.35));
    canvas.restore();

    canvas.save();
    canvas.clipPath(
      Path()..addOval(Rect.fromCircle(center: const Offset(62, 62), radius: 26)),
    );
    _fillRect(canvas, const Rect.fromLTWH(28, 28, 60, 60),
        palette.secondary.withOpacity(0.35));
    for (double x = 24; x < 96; x += 10) {
      _line(canvas, Offset(x, 28), Offset(x + 18, 92),
          Colors.white.withOpacity(0.16), 2);
    }
    canvas.restore();

    _strokeCircle(canvas, const Offset(62, 62), 26,
        Colors.white.withOpacity(0.34), 1.4);
    _fillCircle(canvas, const Offset(30, 72), 9, Colors.white.withOpacity(0.22));
  }

  void _assetsMotif(Canvas canvas, ArtworkPalette palette) {
    _strokeRRect(canvas, const Rect.fromLTWH(10, 10, 80, 52), 8,
        Colors.white.withOpacity(0.26), 1.4);
    _fillRRect(canvas, const Rect.fromLTWH(16, 16, 68, 40), 6,
        palette.accent.withOpacity(0.16));

    final mountains = Path()
      ..moveTo(18, 52)
      ..lineTo(38, 28)
      ..lineTo(52, 44)
      ..lineTo(62, 34)
      ..lineTo(80, 52)
      ..close();
    canvas.drawPath(mountains, Paint()..color = palette.accent.withOpacity(0.6));
    _fillCircle(canvas, const Offset(68, 25), 5,
        palette.secondary.withOpacity(0.85));

    _strokeRRect(canvas, const Rect.fromLTWH(12, 72, 18, 18), 5,
        Colors.white.withOpacity(0.34), 1.2);
    _strokeRRect(canvas, const Rect.fromLTWH(41, 72, 18, 18), 5,
        palette.accent.withOpacity(0.65), 1.2);
    _strokeRRect(canvas, const Rect.fromLTWH(70, 72, 18, 18), 5,
        Colors.white.withOpacity(0.24), 1.2);
    _fillCircle(canvas, const Offset(21, 81), 3, Colors.white.withOpacity(0.6));
    _line(canvas, const Offset(46, 81), const Offset(54, 81),
        palette.accent, 1.8);
    _fillRRect(canvas, const Rect.fromLTWH(75, 78, 8, 8), 2,
        Colors.white.withOpacity(0.35));
  }

  void _stylingMotif(Canvas canvas, ArtworkPalette palette) {
    _fillCircle(canvas, const Offset(36, 42), 20, palette.accent.withOpacity(0.5));
    _fillCircle(canvas, const Offset(56, 34), 20,
        palette.secondary.withOpacity(0.42));
    _fillCircle(canvas, const Offset(48, 54), 20, Colors.white.withOpacity(0.14));
    _strokeRRect(canvas, const Rect.fromLTWH(14, 76, 72, 14), 7,
        Colors.white.withOpacity(0.2), 1.2);
    _fillRRect(canvas, const Rect.fromLTWH(18, 80, 30, 6), 3,
        Colors.white.withOpacity(0.55));

    final painter = TextPainter(
      text: TextSpan(
        text: 'Aa',
        style: TextStyle(
          color: Colors.white.withOpacity(0.82),
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    painter.paint(canvas, const Offset(68, 76));
  }

  void _accessibilityMotif(Canvas canvas, ArtworkPalette palette) {
    canvas.save();
    canvas.clipRect(const Rect.fromLTWH(0, 0, 50, 100));
    canvas.drawRect(
      const Rect.fromLTWH(0, 0, 100, 100),
      Paint()..color = Colors.white.withOpacity(0.055),
    );
    canvas.restore();

    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = Colors.white.withOpacity(0.82);

    canvas.drawCircle(const Offset(50, 18), 9, stroke);
    canvas.drawLine(const Offset(50, 30), const Offset(50, 60), stroke);
    canvas.drawLine(const Offset(30, 42), const Offset(70, 42), stroke);
    canvas.drawLine(const Offset(50, 60), const Offset(34, 84), stroke);
    canvas.drawLine(const Offset(50, 60), const Offset(66, 84), stroke);
    _strokeCircle(canvas, const Offset(50, 50), 42,
        palette.accent.withOpacity(0.28), 1.4);
  }

  void _heroMotif(Canvas canvas, ArtworkPalette palette) {
    _strokeRRect(canvas, const Rect.fromLTWH(20, 8, 58, 84), 12,
        Colors.white.withOpacity(0.24), 1.4);
    _fillRRect(canvas, const Rect.fromLTWH(26, 16, 46, 8), 4,
        Colors.white.withOpacity(0.22));
    _fillRRect(canvas, const Rect.fromLTWH(26, 30, 46, 30), 6,
        palette.accent.withOpacity(0.34));
    _fillRRect(canvas, const Rect.fromLTWH(32, 37, 22, 6), 3,
        Colors.white.withOpacity(0.5));
    _fillRRect(canvas, const Rect.fromLTWH(32, 48, 32, 4), 2,
        Colors.white.withOpacity(0.24));
    _fillRRect(canvas, const Rect.fromLTWH(26, 66, 20, 16), 4,
        palette.secondary.withOpacity(0.38));
    _fillRRect(canvas, const Rect.fromLTWH(50, 66, 22, 16), 4,
        Colors.white.withOpacity(0.12));

    _fillRRect(canvas, const Rect.fromLTWH(58, 40, 36, 26), 7,
        Colors.white.withOpacity(0.12));
    _strokeRRect(canvas, const Rect.fromLTWH(58, 40, 36, 26), 7,
        Colors.white.withOpacity(0.2), 1.2);
    _fillRRect(canvas, const Rect.fromLTWH(64, 47, 24, 4), 2,
        Colors.white.withOpacity(0.5));
    _fillRRect(canvas, const Rect.fromLTWH(64, 55, 14, 4), 2,
        palette.accent.withOpacity(0.6));

    _fillCircle(canvas, const Offset(82, 78), 12,
        palette.accent.withOpacity(0.75));
    _line(canvas, const Offset(77, 78), const Offset(87, 78),
        Colors.white.withOpacity(0.9), 2);
    _line(canvas, const Offset(82, 73), const Offset(82, 83),
        Colors.white.withOpacity(0.9), 2);
  }

  // ---------------------------------------------------------------------------
  // Small canvas helpers.
  // ---------------------------------------------------------------------------

  void _fillRect(Canvas canvas, Rect rect, Color color) {
    canvas.drawRect(rect, Paint()..color = color);
  }

  void _fillRRect(Canvas canvas, Rect rect, double radius, Color color) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      Paint()..color = color,
    );
  }

  void _strokeRRect(
    Canvas canvas,
    Rect rect,
    double radius,
    Color color,
    double width,
  ) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = width
        ..color = color,
    );
  }

  void _fillCircle(Canvas canvas, Offset center, double radius, Color color) {
    canvas.drawCircle(center, radius, Paint()..color = color);
  }

  void _strokeCircle(
    Canvas canvas,
    Offset center,
    double radius,
    Color color,
    double width,
  ) {
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = width
        ..color = color,
    );
  }

  void _line(
    Canvas canvas,
    Offset from,
    Offset to,
    Color color,
    double width,
  ) {
    canvas.drawLine(
      from,
      to,
      Paint()
        ..color = color
        ..strokeWidth = width
        ..strokeCap = StrokeCap.round,
    );
  }

  void _dashedPath(Canvas canvas, Path path, Color color, double width) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..color = color;
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final next = math.min(distance + 5, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance += 9;
      }
    }
  }

  void _paintVignette(Canvas canvas, Size size, Rect rect) {
    final vignette = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.black.withOpacity(0.06),
          Colors.black.withOpacity(0.30),
        ],
        stops: const [0.45, 0.75, 1],
      ).createShader(rect);
    canvas.drawRect(rect, vignette);

    final bottom = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.black.withOpacity(0.34),
        ],
      ).createShader(
        Rect.fromLTWH(0, size.height * 0.58, size.width, size.height * 0.42),
      );
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.58, size.width, size.height * 0.42),
      bottom,
    );
  }

  @override
  bool shouldRepaint(covariant _CatalogArtworkPainter oldDelegate) {
    return oldDelegate.categoryId != categoryId ||
        oldDelegate.seed != seed ||
        oldDelegate.variant != variant ||
        oldDelegate.palette != palette;
  }
}

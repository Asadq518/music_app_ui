import 'package:flutter/material.dart';

import 'colors.dart';

class CustomSliderMarkShape extends SliderComponentShape {
  final double tickMarkRadius;

  CustomSliderMarkShape({
    required this.tickMarkRadius,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(tickMarkRadius, tickMarkRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final paint = Paint()
      ..shader = RadialGradient(
        stops: const [0.3, .9, 1],
        colors: [
          MyColors.btnGradentDark,
          MyColors.btnGradentlight,
          MyColors.btnGradentDark,
        ],
      ).createShader(Rect.fromCircle(
        center: center,
        radius: tickMarkRadius,
      ));
    canvas.drawCircle(center, tickMarkRadius, paint);
    canvas.drawCircle(
        center, tickMarkRadius / 3, Paint()..color = Colors.amber.shade600);
  }
}

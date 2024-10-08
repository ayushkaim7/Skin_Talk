import 'dart:math';

import 'package:flutter/material.dart';

class HollowPieChart extends StatelessWidget {
  final List<PieSlice> slices;

  const HollowPieChart({
    Key? key,
    required this.slices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(56), // Adjust size as needed
      painter: HollowPieChartPainter(slices: slices),
    );
  }
}

class PieSlice {
  final Color color;
  final double value;

  PieSlice({required this.color, required this.value});
}

class HollowPieChartPainter extends CustomPainter {
  final List<PieSlice> slices;

  HollowPieChartPainter({required this.slices});

  @override
  void paint(Canvas canvas, Size size) {
    double total = 0;
    slices.forEach((slice) {
      total += slice.value;
    });

    double startAngle = -pi / 2; // Start angle (top)
    double endAngle = startAngle;

    final radius = size.width / 2;
    final center = size.center(Offset.zero);

    for (int i = 0; i < slices.length; i++) {
      final Paint slicePaint = Paint()
        ..color = slices[i].color
        ..style = PaintingStyle.fill;

      final sweepAngle = 2 * pi * (slices[i].value / total);
      endAngle += sweepAngle;

      final outerRect = Rect.fromCircle(center: center, radius: radius);
      final innerRect = Rect.fromCircle(center: center, radius: radius * 0.83);

      // Draw outer arc
      canvas.drawArc(
        outerRect,
        startAngle,
        sweepAngle,
        true,
        slicePaint,
      );

      // Draw inner arc
      canvas.drawArc(
        innerRect,
        startAngle,
        sweepAngle,
        true,
        Paint()..color = Colors.white,
      );

      // Calculate position for percentage text
      final percentageText = '';
      final textPainter = TextPainter(
        text: TextSpan(
            text: percentageText, style: TextStyle(color: Colors.black)),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      )..layout();
      final textOffset = Offset(
        center.dx +
            radius * 0.8 * cos(startAngle + sweepAngle / 2) -
            textPainter.width / 2,
        center.dy +
            radius * 0.8 * sin(startAngle + sweepAngle / 2) -
            textPainter.height / 2,
      );

      textPainter.paint(canvas, textOffset);

      startAngle = endAngle;
    }

    // Draw center text
    final totalText = '${slices[0].value.toInt()}';
    final textPainter = TextPainter(
      text: TextSpan(
          text: totalText,
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout();
    final textOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

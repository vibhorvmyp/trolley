import 'package:flutter/material.dart';

class VCutRectanglePainter extends CustomPainter {
  final Color color;

  VCutRectanglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, 0) // Start at top-left corner
      ..lineTo(size.width, 0) // Draw a line to the 80% width point at the top
      ..lineTo(size.width * 0.8,
          size.height * 0.5) // Draw a line to the middle of the right side
      ..lineTo(size.width,
          size.height) // Draw a line to the 80% width point at the bottom
      ..lineTo(0, size.height) // Draw a line to the bottom-left corner
      ..close(); // Close the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

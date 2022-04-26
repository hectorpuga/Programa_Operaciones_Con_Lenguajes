import 'package:flutter/material.dart';

class HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color.fromARGB(234, 55, 13, 133);
    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 10;

    final path = Path();

    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.5, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);

    path.moveTo(size.width * 0.65, size.height);

    path.quadraticBezierTo(
        size.width * 0.65, size.height * 0.85, size.width, size.height * 0.80);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HomePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(HomePainter oldDelegate) => false;
}

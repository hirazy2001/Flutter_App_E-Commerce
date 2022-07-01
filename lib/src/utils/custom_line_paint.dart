import 'package:flutter/material.dart';

class CustomLinePaint extends CustomPainter{
  final double size;

  CustomLinePaint({required this.size});

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
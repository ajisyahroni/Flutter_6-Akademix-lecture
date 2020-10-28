import 'package:flutter/material.dart';

class SpecialCardBackground extends CustomPainter {
  final int flex;
  bool specialOrnament = false;

  // color
  Color color;
  Color colorWithOpacity;
  List<Color> gradientcolor;

  // constructor
  SpecialCardBackground(
      {@required this.color, @required this.flex, this.specialOrnament}) {
    colorWithOpacity = color.withOpacity(0.2);
    gradientcolor = [
      color,
      Color.fromRGBO(188, 238, 249, 0) //paten
    ];
  }

  @override
  void paint(Canvas canvas, Size size) {
    // init
    double width = size.width;
    double height = size.height;
    // end init

    // shape as bg
    final shapeBgPaint = Paint()
      ..color = colorWithOpacity
      ..style = PaintingStyle.fill;

    final shapeBgBound = Rect.fromLTWH(0, 0, (width / flex) + 8, height);
    final shapeBgPath = Path()
      ..moveTo(shapeBgBound.left, shapeBgBound.top)
      ..lineTo(shapeBgBound.topRight.dx, shapeBgBound.topRight.dy)
      ..quadraticBezierTo(
          shapeBgBound.centerRight.dx + 35,
          shapeBgBound.centerRight.dy,
          shapeBgBound.bottomRight.dx,
          shapeBgBound.bottomRight.dy)
      ..lineTo(shapeBgBound.bottomLeft.dx, shapeBgBound.bottomLeft.dy)
      ..lineTo(shapeBgBound.topLeft.dx, shapeBgBound.topLeft.dy);

    canvas.drawPath(shapeBgPath, shapeBgPaint);

    // shape as main
    final shapePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final shapeBound = Rect.fromLTWH(0, 0, width / flex, height);
    final shapePath = Path()
      ..moveTo(shapeBound.left, shapeBound.top)
      ..lineTo(shapeBound.topRight.dx, shapeBound.topRight.dy)
      ..quadraticBezierTo(
          // shapeBound.centerRight.dx * 1.5,
          shapeBound.centerRight.dx + 35,
          shapeBound.centerRight.dy,
          shapeBound.bottomRight.dx,
          shapeBound.bottomRight.dy)
      ..lineTo(shapeBound.bottomLeft.dx, shapeBound.bottomLeft.dy)
      ..lineTo(shapeBound.topLeft.dx, shapeBound.topLeft.dy);

    canvas.drawPath(shapePath, shapePaint);

    // quarter circle left
    // init fixed size screen
    final double fixedWidth = 50.0;
    final double fixedHeight = 50.0;

    final quarterCircleBound = Rect.fromLTWH(0, 0, fixedWidth, fixedHeight);
    final quarterCirclePaint = Paint()
      ..shader = LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: gradientcolor)
          .createShader(quarterCircleBound)
      ..style = PaintingStyle.fill;

    final quarterCirclePath = Path()
      ..moveTo(quarterCircleBound.left, quarterCircleBound.top)
      ..lineTo(quarterCircleBound.topRight.dx, quarterCircleBound.topRight.dy)
      ..quadraticBezierTo(
          quarterCircleBound.bottomRight.dx * 0.9,
          quarterCircleBound.bottomRight.dy * 0.9,
          quarterCircleBound.bottomLeft.dx,
          quarterCircleBound.bottomLeft.dy)
      ..lineTo(
          quarterCircleBound.bottomLeft.dx, quarterCircleBound.bottomLeft.dy);

    canvas.drawPath(quarterCirclePath, quarterCirclePaint);

    // right quarter circle
    if (specialOrnament == true) {
      final rightQuarterCirclePainter = Paint()
        ..color = Color(0xffFA8E40)
        ..style = PaintingStyle.fill;
      final rightQuarterCirclePath = Path()
        ..moveTo(width, 0)
        ..lineTo(width - fixedWidth, 0)
        ..quadraticBezierTo(
            width - fixedWidth * 0.9, fixedHeight * 0.9, width, fixedHeight);
      canvas.drawPath(rightQuarterCirclePath, rightQuarterCirclePainter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

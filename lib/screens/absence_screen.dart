/**
 * screen untuk menampilkan halaman absensi 
 * status : on progress
 */

import 'package:akademix/extensions/hex_color.dart';
import 'package:akademix/utilities/constant.dart';
import 'package:akademix/widgets/akademix_main_navigation.dart';
import 'package:akademix/widgets/dashboard/akademix_days_scrolling.dart';
import 'package:akademix/widgets/debug/grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AbsenceScreen extends StatefulWidget {
  @override
  _AbsenceScreenState createState() => _AbsenceScreenState();
}

class _AbsenceScreenState extends State<AbsenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Card(
              child: Stack(
                children: [
                  CustomPaint(
                    child: Container(),
                    painter:
                        RectangleCircleUnionAsBg(HexColor.fromHex('#D5F8FF')),
                  ),
                  CustomPaint(
                    child: Container(),
                    painter: RectangleCircleUnion(HexColor.fromHex('#00B4D8')),
                  ),
                  CustomPaint(
                    child: Container(),
                    painter: QuarterCircleGradient([
                      HexColor.fromHex('#BCEEF9'),
                      Color.fromARGB(0, 188, 238, 249)
                    ]),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'IPA-0',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '32',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Text(
                                'Siswa',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '2/14',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Text(
                                'Pertemuan',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuarterCircleTopRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class QuarterCircleGradient extends CustomPainter {
  final List<Color> gradientColor;
  QuarterCircleGradient(this.gradientColor);

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBound = Rect.fromLTWH(0, 0, size.width / 9, size.height / 2);
    final paint = Paint()
      ..shader = LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: gradientColor)
          .createShader(shapeBound)
      ..style = PaintingStyle.fill;

    final backgroundPath = Path()
      ..moveTo(shapeBound.left, shapeBound.top)
      ..lineTo(shapeBound.topRight.dx, shapeBound.topRight.dy)
      ..quadraticBezierTo(
          shapeBound.bottomRight.dx * 0.9,
          shapeBound.bottomRight.dy * 0.9,
          shapeBound.bottomLeft.dx,
          shapeBound.bottomLeft.dy)
      ..lineTo(shapeBound.bottomLeft.dx, shapeBound.bottomLeft.dy);

    canvas.drawPath(backgroundPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RectangleCircleUnion extends CustomPainter {
  final Color bgColor;

  RectangleCircleUnion(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    num degToRad(num deg) => deg * (3.14 / 180);

    final shapeBound = Rect.fromLTWH(0, 0, size.width / 3, size.height);
    final backgroundPath = Path()
      ..moveTo(shapeBound.left, shapeBound.top)
      ..lineTo(shapeBound.topRight.dx, shapeBound.topRight.dy)
      ..quadraticBezierTo(
          shapeBound.centerRight.dx * 1.25,
          shapeBound.centerRight.dy,
          shapeBound.bottomRight.dx,
          shapeBound.bottomRight.dy)
      ..lineTo(shapeBound.bottomLeft.dx, shapeBound.bottomLeft.dy)
      ..lineTo(shapeBound.topLeft.dx, shapeBound.topLeft.dy);

    canvas.drawPath(backgroundPath, paint);
    // lesson 1
    // Offset start = Offset(0, size.height / 2);
    // Offset end = Offset(size.width, size.height / 3);

    // canvas.drawLine(start, end, paint);

    // lesson 2
    // var path = Path();
    // path.moveTo(0, size.height / 2);
    // path.lineTo(size.width / 2, size.height / 2);
    // canvas.drawPath(path, paint);

    // Offset center = Offset(size.width / 2, size.height / 2);
    // canvas.drawCircle(center, 100, paint);

    // var path = Path();
    // path.addOval(Rect.fromCircle(
    //     radius: 100, center: Offset(size.width / 2, size.height / 2)));
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
    // throw UnimplementedError();
  }
}

class RectangleCircleUnionAsBg extends CustomPainter {
  final Color bgColor;

  RectangleCircleUnionAsBg(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    final shapeBound = Rect.fromLTWH(0, 0, size.width / 2.85, size.height);
    final backgroundPath = Path()
      ..moveTo(shapeBound.left, shapeBound.top)
      ..lineTo(shapeBound.topRight.dx, shapeBound.topRight.dy)
      ..quadraticBezierTo(
          shapeBound.centerRight.dx * 1.25,
          shapeBound.centerRight.dy,
          shapeBound.bottomRight.dx,
          shapeBound.bottomRight.dy)
      ..lineTo(shapeBound.bottomLeft.dx, shapeBound.bottomLeft.dy)
      ..lineTo(shapeBound.topLeft.dx, shapeBound.topLeft.dy);

    canvas.drawPath(backgroundPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

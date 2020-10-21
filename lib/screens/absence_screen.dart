import 'package:akademix/extensions/hex_color.dart';
import 'package:akademix/utilities/constant.dart';
import 'package:akademix/widgets/main_navigation.dart';
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
      body: Container(
        child: CustomPaint(
          child: Container(),
          painter: RectangleCircleUnion(),
        ),
      ),
      // body: Stack(
      //   children: [
      //     Text('lore'),
      //     Container(child: lengganankuIcon),
      //     // Center(
      //     //   child: Text('ipsum'),
      //     // ),
      //     // Container(
      //     //   margin: EdgeInsets.only(bottom: 17),
      //     //   width: double.infinity,
      //     //   child: Align(
      //     //       alignment: Alignment.bottomCenter, child: MainNavigation()),
      //     // )
      //   ],
      // ),
    );
  }
}

class quarterCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = HexColor.fromHex('#00B4D8')
      ..style = PaintingStyle.fill;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RectangleCircleUnion extends CustomPainter {
  final double widthOfContainer;
  final double heightOfContainer;
  RectangleCircleUnion({this.widthOfContainer, this.heightOfContainer});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = HexColor.fromHex('#00B4D8')
      ..style = PaintingStyle.fill;

    num degToRad(num deg) => deg * (3.14 / 180);

    final shapeBound = Rect.fromLTWH(0, 0, size.width / 2, size.height / 2);
    final backgroundPath = Path()
      ..moveTo(shapeBound.left, shapeBound.top)
      ..lineTo(shapeBound.topRight.dx, shapeBound.topRight.dy)
      ..quadraticBezierTo(
          shapeBound.centerRight.dx * 1.5,
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
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = HexColor.fromHex('#D5F8FF')
      ..style = PaintingStyle.fill;

    num degToRad(num deg) => deg * (3.14 / 180);

    final shapeBound = Rect.fromLTWH(0, 0, size.width / 2, size.height / 2);
    final backgroundPath = Path()
      ..moveTo(shapeBound.left, shapeBound.top)
      ..lineTo(shapeBound.topRight.dx, shapeBound.topRight.dy)
      ..quadraticBezierTo(
          shapeBound.centerRight.dx * 1.5,
          shapeBound.centerRight.dy,
          shapeBound.bottomRight.dx,
          shapeBound.bottomRight.dy)
      ..lineTo(shapeBound.bottomLeft.dx, shapeBound.bottomLeft.dy)
      ..lineTo(shapeBound.topLeft.dx, shapeBound.topLeft.dy);

    canvas.drawPath(backgroundPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
    // throw UnimplementedError();
  }
}

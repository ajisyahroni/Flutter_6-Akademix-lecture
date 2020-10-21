import 'package:akademix/extensions/hex_color.dart';
import 'package:flutter/material.dart';

class AkademixTimeDecoration extends StatelessWidget {
  final String startTime;

  const AkademixTimeDecoration({Key key, this.startTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.red, spreadRadius: -12.0, blurRadius: 5)
                ],
                gradient: LinearGradient(colors: [
                  Theme.of(context).primaryColor,
                  HexColor.fromHex('#ffffff')
                ], begin: Alignment.bottomLeft, end: Alignment.topRight))),
        Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      offset: Offset.fromDirection(-5, 7),
                      spreadRadius: 1,
                      color: Colors.black26,
                      blurRadius: 4)
                ],
                color: Colors.white)),
        Text(
          //BINDING HERE
          startTime,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class AkademixPresencePercentage extends StatelessWidget {
  final int masuk;
  final int izin;
  final int sakit;
  int alfa;
  double marginHorizontal = 4.0;

  final int totalPertemuan;
  AkademixPresencePercentage(
      {@required this.masuk,
      @required this.izin,
      @required this.sakit,
      @required this.totalPertemuan}) {
    alfa = totalPertemuan - (masuk + izin + sakit);
  }

  List<Color> arrayOfColor = [
    Color(0xff82DC57),
    Color(0xff5890E3),
    Color(0xffFA8E40),
    Color(0xffEB6A6A)
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - (marginHorizontal * 2);
    List<double> fractionalPresence = [
      (masuk / totalPertemuan) * width,
      (izin / totalPertemuan) * width,
      (sakit / totalPertemuan) * width,
      (alfa / totalPertemuan) * width,
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
      width: double.infinity,
      child: Row(
        children: [
          for (var i = 0; i < fractionalPresence.length; i++)
            Container(
              width: fractionalPresence[i],
              decoration: BoxDecoration(
                  color: arrayOfColor[i],
                  borderRadius: i == 0
                      ? BorderRadius.horizontal(left: Radius.circular(10))
                      : i == fractionalPresence.length - 1
                          ? BorderRadius.horizontal(right: Radius.circular(10))
                          : BorderRadius.all(Radius.circular(0))),
              height: 20,
            ),
        ],
      ),
    );
  }
}

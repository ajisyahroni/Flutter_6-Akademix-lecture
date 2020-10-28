/**
 * ====================================
 *  MAIN NAVIGATION is a widget that used to navigate between page
 *  by : ajik
 *  widget ini berkaitan dengan extensi warna
 * ====================================
 */

import 'package:flutter/material.dart';

class MainNavigation extends StatelessWidget {
  final double _bottomPosition;
  MainNavigation(this._bottomPosition);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          bottom: _bottomPosition,
          duration: Duration(milliseconds: 200),
          child: Container(
              height: 82,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 7),
                        blurRadius: 10)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // REKAP
                    _buildButton(context, 'Rekap', 'assets/img/briefcase.png',
                        () {
                      print('rekap');
                    }),

                    // CENTER ICON
                    _buildCenterButton(context, () {
                      print('tengah click');
                    }),

                    // Nilai
                    _buildButton(context, 'Nilai', 'assets/img/pen_tool.png',
                        () {
                      print('nilai click');
                    })
                  ],
                ),
              )),
        ),
      ],
    );
  }

  // center button function
  Widget _buildCenterButton(BuildContext context, Function callback) {
    return Container(
      child: ButtonTheme(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(0),
        minWidth: 0,
        height: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: FlatButton(
          onPressed: callback,
          child: Image.asset(
            'assets/img/book_open.png',
            width: 24,
            height: 24,
          ),
        ),
      ),
      width: 63,
      height: 63,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(100)),
    );
  }

  // button widget function
  Widget _buildButton(
      BuildContext context, String text, String icon, Function callback) {
    return ButtonTheme(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.all(0),
      minWidth: 50,
      height: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: FlatButton(
          onPressed: callback,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: 24,
                width: 24,
              ),
              Text(
                text,
                style: TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              )
            ],
          )),
    );
  }
}

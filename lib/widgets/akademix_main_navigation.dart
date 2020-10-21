/**
 * ====================================
 *  MAIN NAVIGATION is a widget that used to navigate between page
 *  by : ajik
 *  widget ini berkaitan dengan extensi warna
 * ====================================
 */

import 'package:akademix/extensions/hex_color.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //TODO : RESPONSIVE
        // static-figma
        // height: 82,
        height: 82,
        width: 247,
        // ___________
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // REKAP
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.ac_unit,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      print('klsdfkl');
                    },
                  ),
                  _buildText('Rekap')
                ],
              ),

              // CENTER ICON
              Container(
                child: Icon(
                  Icons.access_alarms,
                  color: Colors.white,
                ),
                width: 63,
                height: 63,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100)),
              ),

              // Nilai
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: Theme.of(context).primaryColor,
                  ),
                  _buildText('Nilai')
                ],
              )
            ],
          ),
        ));
  }

  Widget _buildText(text) {
    return Text(
      text,
      style: TextStyle(
          color: HexColor.fromHex('#787878'),
          fontFamily: 'SegoeUI',
          fontSize: 14,
          fontWeight: FontWeight.w300),
    );
  }
}

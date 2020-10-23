/**
 * ====================================
 *  DAY SCROLLING IS A WIDGET WHICH CONTAIN BUNCH OF A DAY BUTTON
 *  widget ini berkaitan dengan model days
 *  by : ajik
 * ====================================
 */

import 'package:akademix/models/days.dart';
import 'package:flutter/material.dart';

List<Days> listOfWeekday = [
  Days(text: 'Senin', weekday: 1),
  Days(text: 'Selasa', weekday: 2),
  Days(text: 'Rabu', weekday: 3),
  Days(text: 'Kamis', weekday: 4),
  Days(text: 'Jumat', weekday: 5),
  Days(text: 'Sabtu', weekday: 6),
];
int nowadays = DateTime.now().weekday;

class DaysScrolling extends StatefulWidget {
  @override
  _DaysScrollingState createState() => _DaysScrollingState();
}

class _DaysScrollingState extends State<DaysScrolling> {
  void changenowadays(int buttonIndex) {
    print(buttonIndex);
    setState(() {
      nowadays = buttonIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listOfWeekday.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            child: nowadays == listOfWeekday[index].weekday
                ? FlatButton(
                    child: Text(
                      listOfWeekday[index].text,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      changenowadays(listOfWeekday[index].weekday);
                    },
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.zero,
                            topRight: Radius.circular(30.0))),
                  )
                : OutlineButton(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        style: BorderStyle.solid),
                    child: Text(
                      listOfWeekday[index].text,
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                    onPressed: () {
                      changenowadays(listOfWeekday[index].weekday);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.zero,
                            topRight: Radius.circular(30.0))),
                  ));
      },
    );
  }
}

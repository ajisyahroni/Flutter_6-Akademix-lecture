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

class DaysScrolling extends StatelessWidget {
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
                    onPressed: () {},
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
                    onPressed: () {},
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

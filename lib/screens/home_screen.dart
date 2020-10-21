import 'package:akademix/extensions/hex_color.dart';
import 'package:akademix/widgets/days_scrolling.dart';
import 'package:akademix/widgets/main_navigation.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // cp
    // print(nowadays == listOfWeekday[3].weekday);
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text(
          'Akademix',
          style: TextStyle(color: Colors.white),
        ),
        // actions: <Widget>[
        //   BackdropToggleButton(
        //     icon: AnimatedIcons.list_view,
        //   )
        // ],
      ),
      frontLayer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                    child: BackdropToggleButton(
                        color: Colors.grey, icon: AnimatedIcons.home_menu)),
                Expanded(
                  child: DaysScrolling(),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 9,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.red,
                                                spreadRadius: -12.0,
                                                blurRadius: 5)
                                          ],
                                          gradient: LinearGradient(
                                              colors: [
                                                Theme.of(context).primaryColor,
                                                HexColor.fromHex('#ffffff')
                                              ],
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight))),
                                  Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                offset:
                                                    Offset.fromDirection(-5, 7),
                                                spreadRadius: 1,
                                                color: Colors.black26,
                                                blurRadius: 4)
                                          ],
                                          color: Colors.white)),
                                  Text(
                                    '07:00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  )
                                ],
                              ),
                              Text(
                                'Ruang VII',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '12-IPA-9',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
            Align(alignment: Alignment.bottomCenter, child: MainNavigation()),
          ],
        ),
      ),
      backLayer: Center(
        child: Text('back layer'),
      ),
    );
  }
}

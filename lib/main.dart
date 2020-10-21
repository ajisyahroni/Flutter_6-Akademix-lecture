import 'package:akademix/extensions/hex_color.dart';
import 'package:akademix/screens/absence_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // initialRoute: '/absence',
      routes: <String, WidgetBuilder>{
        // '/home': (BuildContext ctx) => HomeScreen(),
        // '/absence': (BuildContext ctx) => AbsenceScreen()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: HexColor.fromHex('#FA8E40'),
        primaryColor: HexColor.fromHex('#00B4D8'),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

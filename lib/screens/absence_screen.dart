import 'package:akademix/widgets/akademix_main_navigation.dart';
import 'package:akademix/widgets/akademix_special_card_bg.dart';
import 'package:akademix/widgets/grade/akademix_presence_percentage.dart';
import 'package:flutter/rendering.dart';

/**
 * screen untuk menampilkan halaman absensi 
 * status : on progress
 */

import 'package:flutter/material.dart';

class AbsenceScreen extends StatefulWidget {
  @override
  _AbsenceScreenState createState() => _AbsenceScreenState();
}

class _AbsenceScreenState extends State<AbsenceScreen> {
  ScrollController _scrollController;
  double _bottomPosition = 10;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.reverse:
          setState(() {
            _bottomPosition = -100;
          });
          break;
        case ScrollDirection.forward:
          setState(() {
            _bottomPosition = 10;
          });
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      floatingActionButton: MainNavigation(_bottomPosition),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          AkademixPresencePercentage(
            totalPertemuan: 50,
            masuk: 10,
            izin: 3,
            sakit: 7,
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: CustomPaint(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'IPA-0',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '32',
                                style: TextStyle(
                                    color: Color.fromRGBO(92, 92, 92, 1),
                                    fontSize: 20),
                              ),
                              Text(
                                'Siswa',
                                style: TextStyle(
                                    color: Color.fromRGBO(92, 92, 92, 1),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '2/14',
                                style: TextStyle(
                                    color: Color.fromRGBO(92, 92, 92, 1),
                                    fontSize: 20),
                              ),
                              Text(
                                'Pertemuan',
                                style: TextStyle(
                                    color: Color.fromRGBO(92, 92, 92, 1),
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    painter: SpecialCardBackground(
                        color: Color(0xFF00B4D8), flex: 3),
                  ),
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}

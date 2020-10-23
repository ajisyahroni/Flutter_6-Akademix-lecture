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

class _AbsenceScreenState extends State<AbsenceScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  AnimationController _hideFABAnimationController;

  @override
  void initState() {
    super.initState();
    _hideFABAnimationController = AnimationController(
        vsync: this, value: 1, duration: Duration(milliseconds: 200));

    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.reverse:
          _hideFABAnimationController.reverse();
          break;
        case ScrollDirection.forward:
          _hideFABAnimationController.forward();
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
      floatingActionButton: FadeTransition(
        opacity: _hideFABAnimationController,
        child: ScaleTransition(
          scale: _hideFABAnimationController,
          child: MainNavigation(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Container(
            child: AkademixPresencePercentage(
              totalPertemuan: 50,
              masuk: 10,
              izin: 1,
              sakit: 7,
            ),
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
          // Card(
          //   child: CustomPaint(
          //     child: Container(
          //       padding: EdgeInsets.symmetric(horizontal: 10.0),
          //       width: double.infinity / 2,
          //       height: 100,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'UTS',
          //                 style: TextStyle(fontSize: 14, color: Colors.white),
          //               ),
          //               Text(
          //                 '25/6/20',
          //                 style: TextStyle(fontSize: 12, color: Colors.white),
          //               ),
          //             ],
          //           ),
          //           Text(
          //             '80',
          //             style: TextStyle(
          //                 fontSize: 24, color: Color.fromRGBO(92, 92, 92, 1)),
          //           ),
          //         ],
          //       ),
          //     ),
          //     painter: SpecialCardBackground(color: Color(0xFFFA8E40), flex: 2),
          //   ),
          // )
        ],
      ),
    );
  }
}

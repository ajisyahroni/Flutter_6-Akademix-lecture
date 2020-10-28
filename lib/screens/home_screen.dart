import 'package:akademix/extensions/hex_color.dart';
import 'package:akademix/widgets/dashboard/akademix_time_decoration.dart';
import 'package:akademix/widgets/dashboard/akademix_days_scrolling.dart';
import 'package:akademix/widgets/akademix_main_navigation.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text(
          'Akademix',
          style: TextStyle(color: Colors.white),
        ),
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

                /**
                 * ==============================
                 * SEKUMPULAN BUTTON HARI
                 * senin selasa rabu kamis jumat sabtu
                 * ==============================
                 */
                Expanded(
                  child: DaysScrolling(),
                ),
                /**
                 * ==============================
                 * END HERE
                 * ==============================
                 */

                SizedBox(
                  height: 20,
                ),

                // LIST VIEW DARI JADWAL
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
                              AkademixTimeDecoration(startTime: '07:30'),
                              Text(
                                'Ruang VI',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '12-IPA-01',
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

            /**
             * =========================
             * MAIN NAVIGATION DISINI
             * =========================
             */
            // Align(alignment: Alignment.bottomCenter, child: MainNavigation()),
          ],
        ),
      ),
      backLayer: Center(
        child: Text('back layer'),
      ),
    );
  }
}

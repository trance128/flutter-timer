import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/presentation_data.dart';
import '../screens/options_screen.dart';
import '../screens/timer_screen.dart';
import '../screens/stopwatch_screen.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PresentationData presentationData =
        Provider.of<PresentationData>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: presentationData.bottomBarIndex,
      elevation: 0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      backgroundColor: Colors.black,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.timer,
            color: Colors.white,
          ),
          title: Text(
            'Stopwatch',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.slow_motion_video, color: Colors.white),
          title: Text(
            'Timer',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          title: Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
      onTap: (index) {
        presentationData.setBottomBarIndex(index);

        switch (index) {
          case 0:
            {
              // stop watch screen
              print("Case 0");
              Navigator.of(context).pushNamed(StopwatchScreen.routeName);
              break;
            }
          case 1:
            {
              // timer screen
              print("Case 1");
              Navigator.of(context).pushReplacementNamed(TimerScreen.routeName);
              break;
            }
          case 2:
            {
              // options screen
              print("Case 2");
              Navigator.of(context).pushNamed(OptionsScreen.routeName);
              break;
            }
        }
      },
    );
  }
}

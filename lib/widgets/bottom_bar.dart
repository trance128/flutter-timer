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
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).primaryColor,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      backgroundColor: Theme.of(context).accentColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.timer,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            'Stopwatch',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.slow_motion_video, color: Theme.of(context).primaryColor),
          title: Text(
            'Timer',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            "Settings",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
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

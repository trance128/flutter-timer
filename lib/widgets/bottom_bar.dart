import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/presentation_data.dart';
import '../screens/options_screen.dart';
import '../screens/timer_screen.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PresentationData presentationData = Provider.of<PresentationData>(context);

    return BottomNavigationBar(
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
            Icons.tune,
            color: presentationData.bottomBarIndex == 0 ? Colors.grey : Colors.white,
          ),
          title: Text(
            "Settings",
            style: TextStyle(
              color: presentationData.bottomBarIndex == 0 ? Colors.grey : Colors.white,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.pause,
          ),
          title: const Text("Pause"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.replay,
          ),
          title: const Text("Reset"),
        )
      ],
      onTap: (index) {
        presentationData.setBottomBarIndex(index);

        switch (index) {
          case 0:
            {
              // TODO display options screen
              print("Case 0");
              Navigator.of(context).pushNamed(OptionsScreen.routeName);
              break;
            }
          case 1:
            {
              // TODO pause timer
              print("Case 1");
              Navigator.of(context).pushReplacementNamed(TimerScreen.routeName);
              break;
            }
          case 2:
            {
              // TODO reset timer
              print("Case 2");
            }
        }
      },
    );
  }
}

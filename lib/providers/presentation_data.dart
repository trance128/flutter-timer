import 'package:flutter/foundation.dart';

class PresentationData with ChangeNotifier {
  bool _timerStarted = false;
  bool get timerStarted => _timerStarted;

  void toggleTimerStarted() {
    _timerStarted = !_timerStarted;
    notifyListeners();
  }

  int _bottomBarIndex = 1;
  int get bottomBarIndex => _bottomBarIndex;

  void setBottomBarIndex(int index) {
    _bottomBarIndex = index;
    notifyListeners();
  }
}
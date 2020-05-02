import 'package:flutter/foundation.dart';

class PresentationData with ChangeNotifier {
  bool _timerStarted = false;
  bool get timerStarted => _timerStarted;
  bool _stopwatchStarted = false;

  void toggleTimerStarted() {
    _timerStarted = !_timerStarted;
    notifyListeners();
  }

  int _bottomBarIndex = 1;
  int get bottomBarIndex => _bottomBarIndex;
  bool get stopwatchStarted => _stopwatchStarted;

  void setBottomBarIndex(int index) {
    _bottomBarIndex = index;
    notifyListeners();
  }

  void startStopwatch() {
    _stopwatchStarted = true;
    notifyListeners();
  }
}
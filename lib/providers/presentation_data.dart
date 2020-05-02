import 'package:flutter/foundation.dart';

class PresentationData with ChangeNotifier {
  bool _timerStarted = false;
  bool get timerStarted => _timerStarted;
  bool _stopwatchStarted = false;
  bool _stopwatchPaused = false;

  int _bottomBarIndex = 1;
  int get bottomBarIndex => _bottomBarIndex;
  bool get stopwatchStarted => _stopwatchStarted;
  bool get stopwatchPaused => _stopwatchPaused;

  void setBottomBarIndex(int index) {
    _bottomBarIndex = index;
    notifyListeners();
  }

  void startStopwatch() {
    _stopwatchStarted = true;
    notifyListeners();
  }

  void togglePauseStopwatch() {
    _stopwatchPaused = !_stopwatchPaused;
    notifyListeners();
  }

  void toggleTimerStarted() {
    _timerStarted = !_timerStarted;
    notifyListeners();
  }
}

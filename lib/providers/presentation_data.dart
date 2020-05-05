import 'dart:async';

import 'package:flutter/foundation.dart';

class PresentationData with ChangeNotifier {
  bool _timerStarted = false;
  bool _stopwatchStarted = false;
  bool _stopwatchPaused = false;
  String _returnString;
  String _startingString = '00:00';
  Timer swTimer;
  int _bottomBarIndex = 1;

  Stopwatch _sw = Stopwatch();

  bool get timerStarted => _timerStarted;
  int get bottomBarIndex => _bottomBarIndex;
  bool get stopwatchStarted => _stopwatchStarted;
  bool get stopwatchPaused => _stopwatchPaused;
  String get elapsedTime => _returnString;

  void setBottomBarIndex(int index) {
    _bottomBarIndex = index;
    notifyListeners();
  }

  void startStopwatch() {
    _returnString = _startingString;
    _stopwatchStarted = true;
    _sw.start();
    _continuousUpdateTimeString();

    notifyListeners();
  }

  void togglePauseStopwatch() {
    _stopwatchPaused = !_stopwatchPaused;

    if (!_stopwatchPaused) {
      _sw.start();
      _continuousUpdateTimeString();
    } else {
      _sw.stop();
      _cancelTimer();
    }

    notifyListeners();
  }

  void toggleTimerStarted() {
    _timerStarted = !_timerStarted;
    notifyListeners();
  }

  // formats _sw.elapsed into string, displaying correct amount of 0's in minutes and seconds
  String buildElapsedTimeString() {
    String returnSeconds() {
      int _secondsOnly = _sw.elapsed.inSeconds % 60;
      return _secondsOnly < 10 ? '0$_secondsOnly' : '$_secondsOnly';
    }

    return _sw.elapsed.inSeconds < 60
        ? '00:${returnSeconds()}'
        : _sw.elapsed.inMinutes < 10
            ? '0${_sw.elapsed.inMinutes}:${returnSeconds()}'
            : '${_sw.elapsed.inMinutes}:${returnSeconds()}';
  }

  // sets a timer that updates our returned String, elapsedTime
  _continuousUpdateTimeString() async {
    swTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      _returnString = buildElapsedTimeString();
      // TODO remove print when done
      print('Doing my thing');
      notifyListeners();
    });
  }

  void _cancelTimer() async {
    Timer(Duration(milliseconds: 1), () => swTimer.cancel());
  }

  void resetStopwatch() {
    _cancelTimer();
    _stopwatchStarted = false;
    _stopwatchPaused = false;
    _sw.reset();
    notifyListeners();
  }
}

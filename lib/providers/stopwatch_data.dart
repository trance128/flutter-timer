import 'dart:async';

import 'package:flutter/foundation.dart';

class StopwatchData with ChangeNotifier {
  bool _stopwatchStarted = false;
  bool _stopwatchPaused = false;
  String _returnString;
  String _startingString = '00:00';
  Timer _swTimer;
  Stopwatch _sw = Stopwatch();

  bool get stopwatchStarted => _stopwatchStarted;
  bool get stopwatchPaused => _stopwatchPaused;
  String get elapsedTime => _returnString;

  int _bottomBarIndex = 1;
  int get bottomBarIndex => _bottomBarIndex;

  void setBottomBarIndex(int index) {
    _bottomBarIndex = index;
    notifyListeners();
  }

  void startStopwatch() {
    _returnString = _startingString;
    _stopwatchStarted = true;
    _stopwatchPaused = false;
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
      _cancelSWTimer();
    }

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
  void _continuousUpdateTimeString() async {
    _swTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      _returnString = buildElapsedTimeString();
      // TODO remove print when done
      print('Doing my thing');
      notifyListeners();
    });
  }

  void _cancelSWTimer() async {
    _swTimer.cancel();
  }

  void resetStopwatch() {
    _cancelSWTimer();
    _stopwatchStarted = false;
    _stopwatchPaused = false;
    _sw.reset();
    notifyListeners();
  }
}

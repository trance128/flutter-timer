import 'dart:async';

import 'package:flutter/foundation.dart';

class PresentationData with ChangeNotifier {
  bool _stopwatchStarted = false;
  bool _stopwatchPaused = false;
  String _returnString;
  String _startingString = '00:00';
  Timer _swTimer;
  Stopwatch _sw = Stopwatch();

  bool get stopwatchStarted => _stopwatchStarted;
  bool get stopwatchPaused => _stopwatchPaused;
  String get elapsedTime => _returnString;

  bool _timerStarted = false;
  bool _timerPaused = false;
  String _timerReturnString;
  Timer _timeTimer;
  int _startingMinutes;
  int _startingSeconds;
  int _totalTime; // in seconds
  Stopwatch _timer = Stopwatch();

  bool get timerStarted => _timerStarted;
  bool get timerPaused => _timerPaused;
  String get timeLeft => _timerReturnString;

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

  void startTimer(int minutes, int seconds) {
    print('$minutes');
    print('$seconds');
    _startingMinutes = minutes;
    _startingSeconds = seconds;
    _totalTime = minutes * 60 + seconds;
    _timerStarted = true;
    _timerPaused = false;
    _timer.start();
    _timerReturnString = buildTimerString();
    _continuousUpdateTimer();

    notifyListeners();
  }

  void togglePauseTimer() {
    _timerPaused = !_timerPaused;

    if (!_timerPaused) {
      _timer.start();
      _continuousUpdateTimer();
    } else {
      _timer.stop();
      _cancelTimer();
    }

    notifyListeners();
  }

  // calculates the remaining time and displays formats it nicely for display
  String buildTimerString() {
    int remainingSeconds = (_totalTime - _timer.elapsed.inSeconds);
    int remainingMinutes = remainingSeconds ~/ 60;
    remainingSeconds = remainingSeconds % 60;

    String returnSeconds() {
      return remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
    }

    return remainingMinutes < 10
        ? '0$remainingMinutes:${returnSeconds()}'
        : '$remainingMinutes:${returnSeconds()}';
  }

  void _continuousUpdateTimer() async {
    _timeTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      _timerReturnString = buildTimerString();
      if (_isTimerFinished()) {
        // TODO make timer do something when it's finished
        _cancelTimer();
      }
      print("Timer doing it's thing");
      notifyListeners();
    });
  }

  bool _isTimerFinished() {
    return _totalTime <= _timer.elapsed.inSeconds;
  }

  void _cancelTimer() {
    _timeTimer.cancel();
  }

  void resetTimer() {
    _cancelSWTimer();
    _timerStarted = false;
    _timerPaused = false;
    _timer.reset();
    notifyListeners();
  }
}

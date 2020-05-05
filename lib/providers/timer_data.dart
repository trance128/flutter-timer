import 'dart:async';

import 'package:flutter/foundation.dart';

class TimerData with ChangeNotifier {
  bool _timerStarted = false;
  bool _timerPaused = false;
  String _timerReturnString;
  Timer _timeTimer;
  int _totalTime; // in seconds
  Stopwatch _timer = Stopwatch();

  bool get timerStarted => _timerStarted;
  bool get timerPaused => _timerPaused;
  String get timeLeft => _timerReturnString;

  void startTimer(int minutes, int seconds) {
    print('$minutes');
    print('$seconds');
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

    String returnSecondsTimer() {
      return remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
    }

    return remainingMinutes < 10
        ? '0$remainingMinutes:${returnSecondsTimer()}'
        : '$remainingMinutes:${returnSecondsTimer()}';
  }

  void _continuousUpdateTimer() async {
    _timeTimer = Timer.periodic(Duration(milliseconds: 500), (t) {
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
    _cancelTimer();
    _timerStarted = false;
    _timerPaused = false;
    _timer.reset();
    _totalTime = null;
    notifyListeners();
  }
}

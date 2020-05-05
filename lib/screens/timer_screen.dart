import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:numberpicker/numberpicker.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/play_button.dart';
import '../widgets/reset_button.dart';
import '../providers/timer_data.dart';

class TimerScreen extends StatefulWidget {
  static const String routeName = '/timer-screen';

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _minutes;
  int _seconds;

  Widget _buildPlayingPortrait(
      BuildContext context, TimerData timerData) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: buildResetButton(context, timerData.resetTimer, swScreen: false),
        ),
        Expanded(
          flex: 13,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Text(
                      timerData.timerPaused ? 'Paused' : '',
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).errorColor),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(50),
                          child: Text(
                            timerData.timeLeft,
                            style: Theme.of(context).textTheme.display2,
                          ),
                        ),
                        onTap: () => timerData.togglePauseTimer(),
                      ),
                      Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNumberPicker(BuildContext context, TimerData timerData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: playButton(context, false),
          onPressed: () => timerData.startTimer(_minutes ?? 25, _seconds ?? 0),
        ),
        Container(
          height: 155,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumberPicker.integer(
                itemExtent: 50.0,
                initialValue: 25,
                minValue: 0,
                maxValue: 59,
                infiniteLoop: true,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Theme.of(context).accentColor),
                    top: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                onChanged: (newValue) => setState(() => _minutes = newValue),
              ),
              Text(':', style: Theme.of(context).textTheme.body1),
              NumberPicker.integer(
                zeroPad: true,
                itemExtent: 50.0,
                initialValue: 00,
                minValue: 0,
                maxValue: 59,
                infiniteLoop: true,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Theme.of(context).accentColor),
                    top: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                onChanged: (newValue) => setState(() => _seconds = newValue),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlayingLandscape(
      BuildContext context, TimerData timerData) {
    return Column(children: <Widget>[
      Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Center(
                  child: Text(
                    timerData.timerPaused ? 'Paused' : '',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).errorColor),
                  ),
                ),
              ),
            ),
            buildResetButton(context, timerData.resetTimer, swScreen: false),
          ],
        ),
      ),
      Expanded(
        child: InkWell(
          child: Text(
            timerData.timeLeft,
            style: Theme.of(context).textTheme.display1,
          ),
          onTap: () => timerData.togglePauseTimer(),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final timerData = Provider.of<TimerData>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: timerData.timerStarted
              ? MediaQuery.of(context).orientation == Orientation.portrait
                  ? _buildPlayingPortrait(context, timerData)
                  : _buildPlayingLandscape(context, timerData)
              : _buildNumberPicker(context, timerData),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
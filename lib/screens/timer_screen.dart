import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:numberpicker/numberpicker.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/play_button.dart';
import '../widgets/reset_button.dart';
import '../providers/presentation_data.dart';

class TimerScreen extends StatefulWidget {
  static const String routeName = '/timer-screen';

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _minutes;
  int _seconds;

  Widget _buildPlayingPortrait(
      BuildContext context, PresentationData presentationData) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: buildResetButton(context, presentationData, swScreen: false),
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
                      presentationData.timerPaused ? 'Paused' : '',
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
                            presentationData.timeLeft,
                            style: Theme.of(context).textTheme.display2,
                          ),
                        ),
                        onTap: () => presentationData.togglePauseTimer(),
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

  Widget _buildNumberPicker(BuildContext context, PresentationData presentationData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: playButton(context, false),
          onPressed: () => presentationData.startTimer(_minutes ?? 25, _seconds ?? 0),
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

  @override
  Widget build(BuildContext context) {
    final presentationData = Provider.of<PresentationData>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: presentationData.timerStarted
              ? MediaQuery.of(context).orientation == Orientation.portrait
                  ? _buildPlayingPortrait(context, presentationData)
                  : Container() //_buildPlayingLandscape(context, presentationData)
              : _buildNumberPicker(context, presentationData),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
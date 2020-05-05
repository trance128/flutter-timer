import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/play_button.dart';
import '../widgets/reset_button.dart';
import '../providers/stopwatch_data.dart';

class StopwatchScreen extends StatelessWidget {
  static const String routeName = '/stopwatch-screen';

  // builds the stopwatch screen once play has been pressed
  Widget _buildPlayingPortrait(
      BuildContext context, StopwatchData stopwatchData) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: buildResetButton(context, stopwatchData.resetStopwatch),
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
                      stopwatchData.stopwatchPaused ? 'Paused' : '',
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
                            stopwatchData.elapsedTime,
                            style: Theme.of(context).textTheme.display2,
                          ),
                        ),
                        onTap: () => stopwatchData.togglePauseStopwatch(),
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

  Widget _buildPlayingLandscape(
      BuildContext context, StopwatchData stopwatchData) {
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
                    stopwatchData.stopwatchPaused ? 'Paused' : '',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).errorColor),
                  ),
                ),
              ),
            ),
            buildResetButton(context, stopwatchData.resetStopwatch),
          ],
        ),
      ),
      Expanded(
        child: InkWell(
          child: Text(
            stopwatchData.elapsedTime,
            style: Theme.of(context).textTheme.display1,
          ),
          onTap: () => stopwatchData.togglePauseStopwatch(),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final stopwatchData = Provider.of<StopwatchData>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: stopwatchData.stopwatchStarted
              ? MediaQuery.of(context).orientation == Orientation.portrait
                  ? _buildPlayingPortrait(context, stopwatchData)
                  : _buildPlayingLandscape(context, stopwatchData)
              : FlatButton(
                  child: playButton(context),
                  onPressed: () => stopwatchData.startStopwatch()),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

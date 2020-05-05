import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/play_button.dart';
import '../providers/presentation_data.dart';

class StopwatchScreen extends StatelessWidget {
  static const String routeName = '/stopwatch-screen';

  Widget _buildResetButton(
      BuildContext context, PresentationData presentationData) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        padding: const EdgeInsets.only(
          right: 20,
        ),
        icon: Icon(
          Icons.replay,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
        onPressed: presentationData.resetStopwatch,
      ),
    );
  }

  // builds the stopwatch screen once play has been pressed
  // displays timer, can click to pause / unpause
  Widget _buildPlayingPortrait(
      BuildContext context, PresentationData presentationData) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _buildResetButton(context, presentationData),
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
                      presentationData.stopwatchPaused ? 'Paused' : '',
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
                            presentationData.elapsedTime,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                        onTap: () => presentationData.togglePauseStopwatch(),
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
      BuildContext context, PresentationData presentationData) {
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
                    presentationData.stopwatchPaused ? 'Paused' : '',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).errorColor),
                  ),
                ),
              ),
            ),
            _buildResetButton(context, presentationData),
          ],
        ),
      ),
      Expanded(
        child: InkWell(
          child: Text(
            presentationData.elapsedTime,
            style: Theme.of(context).textTheme.display1,
          ),
          onTap: () => presentationData.togglePauseStopwatch(),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final presentationData = Provider.of<PresentationData>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SafeArea(
        child: Center(
          child: presentationData.stopwatchStarted
              ? MediaQuery.of(context).orientation == Orientation.portrait
                  ? _buildPlayingPortrait(context, presentationData)
                  : _buildPlayingLandscape(context, presentationData)
              : FlatButton(
                  child: playButton(context),
                  onPressed: () => presentationData.startStopwatch()),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

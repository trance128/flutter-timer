import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/play_button.dart';
import '../providers/presentation_data.dart';

class StopwatchScreen extends StatelessWidget {
  static const String routeName = '/stopwatch-screen';

  // builds the stopwatch screen once play has been pressed
  // displays timer, can click to pause / unpause
  Widget _buildPlaying(
      BuildContext context, PresentationData presentationData) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
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
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
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
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height * 0.075)),
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(20),
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

  @override
  Widget build(BuildContext context) {
    final presentationData = Provider.of<PresentationData>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SafeArea(
        child: Center(
          child: presentationData.stopwatchStarted
              ? _buildPlaying(context, presentationData)
              : FlatButton(
                  child: playButton(context),
                  onPressed: () => presentationData.startStopwatch()),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

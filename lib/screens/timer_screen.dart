import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/play_button.dart';
import '../providers/presentation_data.dart';

class TimerScreen extends StatelessWidget {
  static const String routeName = '/timer-screen';

  Widget placeholderText(BuildContext context) {
    return Text(
      "I'm a Timer Screen",
      textAlign: TextAlign.center,
      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 50),
    );
  }

  @override
  Widget build(BuildContext context) {
    final presentationData = Provider.of<PresentationData>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
        child: playButton(context),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

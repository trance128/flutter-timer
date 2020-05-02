import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/play_button.dart';
import '../providers/presentation_data.dart';

class StopwatchScreen extends StatelessWidget {
  static const String routeName = '/stopwatch-screen';

  Widget PlaceholderText() {
    return Text(
      "I'm a Timer Screen",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 50),
    );
  }

  @override
  Widget build(BuildContext context) {
    final presentationData = Provider.of<PresentationData>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: playButton(context),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

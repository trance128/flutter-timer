import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';
import '../providers/presentation_data.dart';

class TimerScreen extends StatelessWidget {
  static const String routeName = '/timer-screen';

  Widget playButton(BuildContext context) {
    return Icon(
      Icons.play_circle_outline,
      color: Colors.white,
      size: MediaQuery.of(context).orientation == Orientation.portrait
          ? (MediaQuery.of(context).size.width * 0.8)
          : (MediaQuery.of(context).size.height * 0.7),
    );
  }

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

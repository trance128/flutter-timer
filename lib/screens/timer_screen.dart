import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';

class TimerScreen extends StatelessWidget {
  static const String routeName = '/timer-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("I'm a Timer Screen"),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

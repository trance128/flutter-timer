import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';

class OptionsScreen extends StatelessWidget {
  static const String routeName = '/options-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'I\'m an options screen',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';

class OptionsScreen extends StatelessWidget {
  static const String routeName = '/options-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
        child: Text('I\'m an options screen'),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

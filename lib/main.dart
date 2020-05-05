import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/presentation_data.dart';
import './screens/timer_screen.dart';
import './screens/options_screen.dart';
import './screens/stopwatch_screen.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PresentationData>(
          create: (_) => PresentationData(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.black,
            accentColor: Colors.white,
            textTheme: TextTheme(
              // use display2 for portrait orientation
              display2: TextStyle(
                fontSize: 100,
                color: Colors.white,
              ),
              // use display1 for landscape
              display1: TextStyle(
                fontSize: 175,
                color: Colors.white,
              ),
              body1: TextStyle(
                fontSize: 30,
                color: Colors.grey[200],
              ),
              headline: TextStyle(
                fontSize: 40,
                color: Colors.grey[200],
              ),
            ),
          ),
          home: StopwatchScreen(),
          routes: {
            StopwatchScreen.routeName: (context) => StopwatchScreen(),
            TimerScreen.routeName: (context) => TimerScreen(),
            OptionsScreen.routeName: (context) => OptionsScreen(),
          }),
    );
  }
}

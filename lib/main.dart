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
            primaryColor: Colors.white,
            accentColor: Colors.black,
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

// Center(
//             child: Text(
//               "25:00",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 100,
//               ),
//             ),
//           ),

import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            "25:00",
            style: TextStyle(
              color: Colors.white,
              fontSize: 100,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.tune,
              ),
              title: Text("Settings"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.pause,
              ),
              title: Text("Pause"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.replay,
              ),
              title: Text("Reset"),
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            switch(index) {
              case 0: {
                print("Case 0");
                break;
              }
              case 1: {
                print("Case 1");
                break;
              }
              case 2: {
                print("Case 2");
              }
            }
          }
        ),
      ),
    );
  }
}

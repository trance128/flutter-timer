import 'package:flutter/material.dart';

/// Returns correctly sized play button.  Expects the BuildContext, and an optional large = true
Widget playButton(BuildContext context, [bool large = true]) {
  double getSize() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return large ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width * 0.2;
    } else {
      return large ? MediaQuery.of(context).size.height * 0.7 : MediaQuery.of(context).size.height * 0.5;
    }
  }

  return Icon(Icons.play_circle_filled, color: Colors.white, size: getSize()); 
}
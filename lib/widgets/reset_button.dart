import 'package:flutter/material.dart';

import '../providers/presentation_data.dart';

Widget buildResetButton(
      BuildContext context, PresentationData presentationData, {bool swScreen = true}) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        padding: const EdgeInsets.only(
          right: 20,
        ),
        icon: Icon(
          Icons.replay,
          color: Theme.of(context).accentColor,
          size: 30,
        ),
        onPressed: swScreen ? presentationData.resetStopwatch : (){},
      ),
    );
  }
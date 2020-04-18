import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purpleAccent,
        child: SpinKitChasingDots(
          color: Colors.white30,
          size: 50.0,
        ));
  }
}

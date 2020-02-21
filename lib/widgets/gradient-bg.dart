import 'package:flutter/material.dart';
import '../styles/styles.dart';

class GradientBg extends StatefulWidget {
  @override
  _GradientBgState createState() => _GradientBgState();
}

class _GradientBgState extends State<GradientBg> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          // image: AssetImage("lib/assets/bgs/bg-signup.png"),
          image: AssetImage("../assets/bgs/bg-signup.png"),
          fit: BoxFit.cover,
          height: screenHeight(context),
          width: screenWidth(context),
        ),
        Image(
          image: AssetImage("../assets/bgs/bg-gradient.png"),
          fit: BoxFit.cover,
          height: screenHeight(context),
          width: screenWidth(context),
        ),
      ],
    );
  }
}

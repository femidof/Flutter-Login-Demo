import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loginscreen/screens/authenticate/SignUpScreen.dart';
import 'package:loginscreen/screens/authenticate/loginscreen.dart';
import 'package:loginscreen/styles/transitions/slide-transitions.dart';

class LoginStart extends StatefulWidget {
  @override
  _LoginStartState createState() => _LoginStartState();
}

class _LoginStartState extends State<LoginStart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Background Image Example'),
      // ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            //THIS IS A VISUAL STACK FOR BACKGROUND

            Center(
              child: new Image.asset(
                'assets/img/landing.jpg',
                width: size.width,
                height: size.height,
                fit: BoxFit.fill,
              ),
            ),

            // THIS IS FOR THE BLUR BACKGROUND

            Center(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: new Container(
                  decoration:
                      new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 100.0),
                  Text(
                    'DEMO APP',
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          color: Colors.blue,
                          blurRadius: 10.0,
                          offset: Offset(5.0, 5.0),
                        ),
                        Shadow(
                          color: Colors.red,
                          blurRadius: 10.0,
                          offset: Offset(-5.0, 5.0),
                        ),
                      ],
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.pink[100],
                    ),
                  ),
                  const SizedBox(height: 250.0),

                  MaterialButton(
                    // autofocus: true,
                    splashColor: Colors.blue[200],
                    height: 55,
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.push(
                          context, SlideRightRoute(page: SignUpScreen()));
                      // context,
                      // SlideLeftRoute(page: null));
                    },
                    color: Color(0XFFFFB953),
                    textColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      'SIGN UP'.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        letterSpacing: 2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 100.0),
                  //
                  MaterialButton(
                    // autofocus: true,
                    splashColor: Colors.blueAccent,
                    height: 55,
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.push(
                          context, SlideLeftRoute(page: LoginScreen()));
                    },
                    color: Color(0XFF8783BF),
                    textColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      'LOGIN'.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

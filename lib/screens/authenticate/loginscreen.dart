import 'package:flutter/material.dart';
// import 'package:loginscreen/screens/authenticate/authenticate.dart';
import '../../services/auth.dart';
import 'package:loginscreen/shared/loading.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  // text field state

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text('Hello',
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                        child: Text('There',
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                        child: Text('.',
                            style: TextStyle(
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purpleAccent)),
                      )
                    ],
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (value) =>
                                value.isEmpty ? "Enter an Email" : null,
                            onChanged: (value) {
                              setState(() => email = value);
                            },
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent))),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            validator: (value) => value.length < 6
                                ? "Enter a password 6+ character long"
                                : null,
                            onChanged: (value) {
                              setState(() => password = value);
                            },
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple))),
                            obscureText: true,
                          ),
                          // SizedBox(height: 5.0), //-----------------
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 15.0, left: 20.0),
                            child: InkWell(
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Text(error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0)),
                          SizedBox(height: 15.0),
                          // SizedBox(height: 40.0),
                          Container(
                            height: 40.0,
                            child: GestureDetector(
                              onTap: () async {
                                // print(email);
                                // print(password);
                                if (_formkey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error = 'Error While trying to Sign In';
                                      loading = false;
                                    });
                                  } else {
                                    Navigator.pop(context);
                                  }
                                }
                                // dynamic result = await _auth.signInAnon();
                                // if (result == null) {
                                //   print('error signing in');
                                // } else {
                                //   print('signed in');
                                //   print(result.uid);
                                //   Navigator.pop(context);
                                // }
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.purple[900],
                                color: Colors.deepPurpleAccent,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'login'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            height: 40.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.black87,
                                color: Colors.white60,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'back'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20.0),
                        ],
                      ),
                    )),
                // SizedBox(height: 15.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(
                //       'New to Spotify ?',
                //       style: TextStyle(fontFamily: 'Montserrat'),
                //     ),
                //     SizedBox(width: 5.0),
                //     InkWell(
                //       onTap: () {
                //         Navigator.of(context).pushNamed('/signup');
                //       },
                //       child: Text(
                //         'Register',
                //         style: TextStyle(
                //             color: Colors.green,
                //             fontFamily: 'Montserrat',
                //             fontWeight: FontWeight.bold,
                //             decoration: TextDecoration.underline),
                //       ),
                //     )
                //   ],
                // )
              ],
            ));
  }
}

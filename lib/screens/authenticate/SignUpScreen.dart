import 'package:flutter/material.dart';
import 'package:loginscreen/services/auth.dart';
import 'package:loginscreen/shared/loading.dart';
import 'package:loginscreen/styles/transitions/slide-transitions.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  // text field state

  String email = '';
  String password = '';
  String passwordHint = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Form(
              key: _formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Expanded(
                      flex: null,
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                              child: Text(
                                '.',
                                style: TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purpleAccent),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: null,
                      child: Container(
                          padding: EdgeInsets.only(
                              top: 35.0, left: 20.0, right: 20.0),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (value) =>
                                    value.isEmpty ? "Enter an email" : null,
                                onChanged: (value) {
                                  //Email
                                  email = value;
                                },
                                decoration: InputDecoration(
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),

                                    // hintText: 'EMAIL',

                                    // hintStyle: ,

                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.purpleAccent))),
                              ),
                              SizedBox(height: 5.0),
                              TextFormField(
                                validator: (value) => value.length < 6
                                    ? "Enter a password 6+ character"
                                    : null,
                                onChanged: (value) {
                                  //Password
                                  setState(() {
                                    password = value;
                                  });
                                },
                                decoration: InputDecoration(
                                    labelText: 'PASSWORD ',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.purpleAccent))),
                                // this is to hide password
                                obscureText: true,
                              ),
                              SizedBox(height: 5.0),
                              TextFormField(
                                validator: (value) => value.isEmpty
                                    ? "Enter a password hint"
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    passwordHint = value;
                                  });
                                },
                                decoration: InputDecoration(
                                    labelText: 'PASSWORD HINT ',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.purpleAccent))),
                              ),
                              SizedBox(height: 50.0),
                              Container(
                                height: 40.0,
                                child: GestureDetector(
                                  onTap: () async {
                                    // await ;
                                    // print(email);
                                    // print(password);
                                    // print(passwordCheck);
                                    if (_formkey.currentState.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      // print(email);
                                      // print(password);
                                      // print(passwordCheck);
                                      dynamic result = await _auth
                                          .registerWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          error = 'please insert a valid email';
                                          loading = false;
                                        });
                                      } else {
                                        Navigator.pop(
                                            context, SlideBottomRoute());
                                      }
                                    }
                                  },
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.purpleAccent,
                                    color: Colors.deepPurpleAccent,
                                    elevation: 7.0,
                                    child: Center(
                                      child: Text(
                                        'SIGNUP',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                height: 40.0,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                      color: Colors.transparent,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Center(
                                      child: Text('Go Back'.toUpperCase(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat')),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(error,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14.0)),
                            ],
                          )),
                    ),

                    // SizedBox(height: 15.0),

                    // Row(

                    //   mainAxisAlignment: MainAxisAlignment.center,

                    //   children: <Widget>[

                    //     Text(

                    //       'New to Spotify?',

                    //       style: TextStyle(

                    //         fontFamily: 'Montserrat',

                    //       ),

                    //     ),

                    //     SizedBox(width: 5.0),

                    //     InkWell(

                    //       child: Text('Register',

                    //           style: TextStyle(

                    //               color: Colors.green,

                    //               fontFamily: 'Montserrat',

                    //               fontWeight: FontWeight.bold,

                    //               decoration: TextDecoration.underline)),

                    //     )

                    //   ],

                    // )
                  ]),
            ),
          );
  }
}

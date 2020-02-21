import 'package:flutter/material.dart';
import 'package:loginscreen/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        elevation: 10.0,
        title: Center(child: Text("TESTING")),
        titleSpacing: 3.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Welcome",
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            FlatButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Text('sign out'.toUpperCase()),
              color: Colors.purpleAccent[100],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:loginscreen/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
// Import 'package:provider/Provider.dart';

void main() => runApp(BaseStart());

class BaseStart extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),

        // theme: ThemeData.light().copyWith(
        //   primaryColor: Colors.yellowAccent,
        //   textTheme: TextTheme(
        //     body1: TextStyle(color: Colors.white),
        //   ),
        // ),
        home: Wrapper(),
      ),
    );
  }
}

//

// MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Login Demo',
//       theme: ThemeData.light().copyWith(
//         primaryColor: Colors.yellowAccent,
//         textTheme: TextTheme(
//           body1: TextStyle(color: Colors.white),
//         ),
//       ),
//       home:  Wrapper(),
//     );

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginscreen/components/drawer.dart';
import 'package:loginscreen/shared/loading.dart';
import 'package:loginscreen/services/auth.dart';

class MainPage extends DrawerContent {
  MainPage({Key key, this.title});
  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.title),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HiddenDrawerController _drawerController;
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _drawerController = HiddenDrawerController(
      initialPage: MainPage(
        title: 'main',
      ),
      items: [
        DrawerItem(
          text: Text('HOME', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: MainPage(
            title: 'HOME',
          ),
        ),
        DrawerItem(
          text: Text(
            'Category',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.photo_album, color: Colors.white),
          page: MainPage(
            title: 'Category',
          ),
        ),
        DrawerItem(
          text: Text(
            'Bookmarks',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.favorite, color: Colors.white),
          page: MainPage(
            title: 'Bookmarks',
          ),
        ),
        // DrawerItem(
        //   text: Text(
        //     'Bookmark',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   icon: Icon(Icons.notifications, color: Colors.white),
        //   page: MainPage(
        //     title: 'Notification',
        //   ),
        // ),
        DrawerItem(
          text: Text(
            'Invite',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.insert_invitation, color: Colors.white),
          page: MainPage(
            title: 'invite',
          ),
        ),
        DrawerItem(
          text: Text(
            'SETTINGS',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: MainPage(
            title: 'SETTINGS',
          ),
        ),
        DrawerItem(
          text: Text(
            'LOG OUT',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.exit_to_app, color: Colors.white),
          page: MainPage(
            title: 'Wrapper',
          ),
          onPressed: () async {
            loading = true;
            await _auth.signOut();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: HiddenDrawer(
              controller: _drawerController,
              header: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Container(
                      // height: 75,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red, width: 5)),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                            'https://scontent.fktm7-1.fna.fbcdn.net/v/t1.0-9/48405358_683680282028761_2233474687176802304_n.jpg?_nc_cat=111&_nc_oc=AQnJcz3nmJPgqG0Koen6EyPPOQktub5ubjD7KdFTstGLQRNrKupGp3hOZ-twJGEK2fM&_nc_ht=scontent.fktm7-1.fna&oh=caed7075e39bcdcd38b333395161516d&oe=5DD670D5',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'APP NAME',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.deepPurple[500],
                    Colors.purple[500],
                    Colors.purple
                  ],
                  // tileMode: TileMode.repeated,
                ),
              ),
            ),
          );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.deepPurple[100],
  //       elevation: 10.0,
  //       title: Center(child: Text("TESTING")),
  //       titleSpacing: 3.0,
  //     ),
  //     body: Center(
  //       child: Column(
  //         children: <Widget>[
  //           Text(
  //             "Welcome",
  //             style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
  //           ),
  //           FlatButton(
  //             onPressed: () async {
  //               await _auth.signOut();
  //             },
  //             child: Text('sign out'.toUpperCase()),
  //             color: Colors.purpleAccent[100],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  // @override
}

// void finalState();

import 'package:flutter/material.dart';
import 'package:humming_task/main.dart';
import 'package:humming_task/screens/home.dart';
import 'package:humming_task/screens/profile.dart';
import 'package:humming_task/screens/videos.dart';

class drawer extends StatelessWidget {
  const drawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF031c0a),
            ),
            child: Text(''),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 3, 0, 3),
            child: ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MyHomePage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 3, 0, 3),
            child: ListTile(
              title: Text('Videos'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Videos()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 3, 0, 3),
            child: ListTile(
              title: Text('Profile'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Profile()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

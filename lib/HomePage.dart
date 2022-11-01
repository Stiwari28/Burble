// ignore_for_file: unused_local_variable, unused_import

import 'package:burble/ProfilePage.dart';
import 'package:burble/loginpage.dart';
import 'package:burble/settingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Octopi',
      theme: ThemeData(
        fontFamily: 'UbuntuMono',
        primarySwatch: Colors.indigo,
      ),
    );
    return materialApp;
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 10, 55, 93),
                ),
                child: Text('Burble',
                    style: TextStyle(color: Colors.white, fontSize: 50)),
              ),
              ListTile(
                  leading: const Icon(Icons.girl),
                  title: const Text('Profile'),
                  onTap: () {
                    var push = Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new ProfilePage(),
                        ));
                  }),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Setting'),
                  onTap: () {
                    var push = Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new SettingPage(),
                        ));
                  }),
              ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new LoginPage(),
                          ));
                    });
                  }),
              ListTile(
                  leading: const Icon(Icons.mode_comment_rounded),
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  }),
              ListTile(
                  leading: const Icon(Icons.mode_edit_outline_rounded),
                  title: const Text('Send Feedback'),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _feedback(context),
                    );
                  }),
            ],
          ),
        ));
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('About Octopi'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Center(
              child: Text(
                  'Burble is a chat application. It is developed using mobile development technology Dart and Flutter.')),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _feedback(BuildContext context) {
    return new AlertDialog(
      title: const Text('Send Feedback'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Center(
              child: Text(
                  'If you have questions or suggestions, write us on _______________and we will try to figure it all out.')),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

//----------------------------------------------------Search Icon Content---------------------------------------//


  

  


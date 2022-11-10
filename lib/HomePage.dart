// ignore_for_file: unused_local_variable, unused_import, unused_field, override_on_non_overriding_member

import 'package:burble/ProfilePage.dart';
import 'package:burble/loginpage.dart';
import 'package:burble/settingPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'chatRoom.dart';

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
    );
    return materialApp;
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 10, 55, 93),
        ),
        body: isLoading
            ? Center(
                child: Container(
                  height: size.height / 20,
                  width: size.height / 20,
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    height: size.height / 14,
                    width: size.width,
                    alignment: Alignment.center,
                    child: Container(
                      height: size.height / 14,
                      width: size.width / 1.15,
                      child: TextField(
                        controller: _search,
                        decoration: InputDecoration(
                            hintText: "Search",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 6, 38, 64)),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  ElevatedButton(
                    onPressed: onSearch,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 6, 38, 64)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        elevation: MaterialStateProperty.all(15),
                        minimumSize:
                            MaterialStateProperty.all(const Size(150, 40)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )),
                    child: Text(
                      "Search",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  userMap != null
                      ? ListTile(
                          onTap: () {
                            String roomId = chatRoomId(
                                _auth.currentUser!.displayName!,
                                userMap!['name']);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ChatRoom(
                                  chatRoomId: roomId,
                                  userMap: userMap!,
                                ),
                              ),
                            );
                          },
                          leading: Icon(
                            Icons.account_box,
                            color: Color.fromARGB(255, 6, 38, 64),
                          ),
                          title: Text(
                            userMap!['name'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(userMap!['email']),
                          trailing: Icon(
                            Icons.chat,
                            color: Color.fromARGB(255, 6, 38, 64),
                          ),
                        )
                      : Container(),
                ],
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
                  leading: const Icon(
                    Icons.girl,
                    color: Color.fromARGB(255, 6, 38, 64),
                  ),
                  title: const Text('Profile'),
                  onTap: () {
                    var push = Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new ProfilePage(),
                        ));
                  }),
              ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: Color.fromARGB(255, 6, 38, 64),
                  ),
                  title: const Text('Setting'),
                  onTap: () {
                    var push = Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new SettingPage(),
                        ));
                  }),
              ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Color.fromARGB(255, 6, 38, 64),
                  ),
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
                  leading: const Icon(
                    Icons.mode_comment_rounded,
                    color: Color.fromARGB(255, 6, 38, 64),
                  ),
                  title: const Text('App Info'),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  }),
              ListTile(
                  leading: const Icon(
                    Icons.mode_edit_outline_rounded,
                    color: Color.fromARGB(255, 6, 38, 64),
                  ),
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
      title: const Text('App Info'),
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
          child: const Text(
            'Close',
            style: TextStyle(
                color: Color.fromARGB(255, 10, 55, 93),
                fontWeight: FontWeight.bold),
          ),
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
          child: const Text(
            'Close',
            style: TextStyle(
                color: Color.fromARGB(255, 10, 55, 93),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

//----------------------------------------------------Search Icon Content---------------------------------------//


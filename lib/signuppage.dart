import 'package:burble/welcomePage.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/signup.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 150),
            child: Text(
              'Welcome \nBack',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 500),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  elevation: MaterialStateProperty.all(15),
                  minimumSize: MaterialStateProperty.all(const Size(250, 40)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: Color.fromARGB(255, 10, 55, 93),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              backgroundColor: Colors.white,
              foregroundColor: Color.fromARGB(255, 10, 55, 93),
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
        ]),
      ),
    );
  }
}

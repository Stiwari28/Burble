import 'package:burble/HomePage.dart';
import 'package:burble/signuppage.dart';
import 'package:burble/welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgetPasswordPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _clearTextField() {
    // Clear everything in the text field
    _emailController.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
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
            margin: EdgeInsets.only(left: 20, top: 30),
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
          Container(
            margin: EdgeInsets.only(left: 10, top: 360),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: _emailController,
              onChanged: (value) {
                // Call setState to update the UI
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 10, 55, 93),
                ),
                suffixIcon: _emailController.text.isEmpty
                    ? null // Show nothing if the text field is empty
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearTextField,
                      ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 10, 55, 93),
                    width: 1.0,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: Color.fromARGB(255, 6, 38, 64)),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 6, 38, 64),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 420),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 10, 55, 93),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 10, 55, 93),
                    width: 1.0,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: Color.fromARGB(255, 6, 38, 64)),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 6, 38, 64),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 200, top: 480),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color.fromARGB(255, 36, 98, 149),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 540),
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then((value) {
                  print("Logged In");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 6, 38, 64)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  elevation: MaterialStateProperty.all(15),
                  minimumSize: MaterialStateProperty.all(const Size(250, 40)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
              child: Text(
                'Log In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 70, top: 620),
            child: Text(
              'Dont have account ?',
              style: TextStyle(
                  color: Color.fromARGB(255, 36, 98, 149),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 200, top: 605),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: const Text(
                'Sign In',
                style: TextStyle(
                    color: Color.fromARGB(255, 6, 38, 64),
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

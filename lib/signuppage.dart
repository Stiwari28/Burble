import 'package:burble/HomePage.dart';
import 'package:burble/methods.dart';
import 'package:burble/welcomePage.dart';

import 'package:flutter/material.dart';

import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController _email = TextEditingController();
  bool isLoading = false;
  //-------------------------------//
  void _clearTextField() {
    // Clear everything in the text field
    _name.clear();
    // Call setState to update the UI
    setState(() {});
  }

  //-----------------------------------//
  void _clearEmailField() {
    // Clear everything in the text field
    _email.clear();
    // Call setState to update the UI
    setState(() {});
  }

  //---------------------------------//
  void _clearPhoneField() {
    // Clear everything in the text field
    phoneController.clear();
    // Call setState to update the UI
    setState(() {});
  }

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
              'Create \n Account',
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
            margin: EdgeInsets.only(left: 10, top: 320),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: _name,
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
                suffixIcon: _name.text.isEmpty
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
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 6, 38, 64),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 380),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: _email,
              onChanged: (value) {
                // Call setState to update the UI
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 10, 55, 93),
                ),
                suffixIcon: _email.text.isEmpty
                    ? null // Show nothing if the text field is empty
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearEmailField,
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
            margin: EdgeInsets.only(left: 10, top: 440),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: phoneController,
              onChanged: (value) {
                // Call setState to update the UI
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color.fromARGB(255, 10, 55, 93),
                ),
                suffixIcon: phoneController.text.isEmpty
                    ? null // Show nothing if the text field is empty
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearPhoneField,
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
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 6, 38, 64),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 500),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: _password,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 10, 55, 93),
                ),
                prefixIconColor: Color.fromARGB(255, 6, 38, 64),
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
                labelText: 'Create Password',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 6, 38, 64),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 600),
            child: ElevatedButton(
              onPressed: () {
                if (_name.text.isNotEmpty &&
                    _email.text.isNotEmpty &&
                    _password.text.isNotEmpty) {
                  setState(() {
                    isLoading = true;
                  });

                  createAccount(_name.text, _email.text, _password.text)
                      .then((user) {
                    if (user != null) {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MyHomePage()));
                      print("Account Created Successful");
                    } else {
                      print("Login Failed");
                      setState(() {
                        isLoading = false;
                      });
                    }
                  });
                } else {
                  print("Please enter Fields");
                }
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
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 70, top: 670),
            child: Text(
              'Already have account ?',
              style: TextStyle(
                  color: Color.fromARGB(255, 36, 98, 149),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 220, top: 655),
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text(
                'Log In',
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

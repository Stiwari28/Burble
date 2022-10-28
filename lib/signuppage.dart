import 'package:burble/welcomePage.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  //-------------------------------//
  void _clearTextField() {
    // Clear everything in the text field
    nameController.clear();
    // Call setState to update the UI
    setState(() {});
  }

  //-----------------------------------//
  void _clearEmailField() {
    // Clear everything in the text field
    emailController.clear();
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
              'Welcome \nBack',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
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
          Container(
            margin: EdgeInsets.only(left: 10, top: 290),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: nameController,
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
                suffixIcon: nameController.text.isEmpty
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
            margin: EdgeInsets.only(left: 10, top: 340),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: emailController,
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
                suffixIcon: emailController.text.isEmpty
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
            margin: EdgeInsets.only(left: 10, top: 400),
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
            margin: EdgeInsets.only(left: 10, top: 460),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
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
            margin: EdgeInsets.only(left: 50, top: 550),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
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
            margin: EdgeInsets.only(left: 70, top: 600),
            child: Text(
              'Already have account ?',
              style: TextStyle(
                  color: Color.fromARGB(255, 36, 98, 149),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 220, top: 596),
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

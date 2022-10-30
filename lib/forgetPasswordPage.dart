import 'package:burble/signuppage.dart';
import 'package:burble/welcomepage.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPassword();
}

class _ForgetPassword extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _clearTextField() {
    // Clear everything in the text field
    emailController.clear();
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
              'Recover \n Your \nAccount',
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
            margin: EdgeInsets.only(left: 10, top: 380),
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
                labelText: 'Enter your email',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 6, 38, 64),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 480),
            child: ElevatedButton(
              onPressed: () {},
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
                'Send recovery mail ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 80, top: 530),
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text(
                'Go back to login page >>',
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

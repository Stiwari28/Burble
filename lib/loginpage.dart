import 'package:burble/welcomepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              'Create \nAccount',
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
            margin: EdgeInsets.only(left: 30, top: 350),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                prefixIcon: Icon(Icons.person),
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
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 420),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                prefixIcon: Icon(Icons.password),
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
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 200, top: 490),
            child: TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password?',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 560),
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
                'Log In',
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
              'Dont have account ?',
              style: TextStyle(
                  color: Color.fromARGB(255, 36, 98, 149),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 200, top: 596),
            child: TextButton(
              onPressed: () {
                //forgot password screen
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

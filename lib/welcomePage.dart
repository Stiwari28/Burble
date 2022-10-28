import 'package:burble/loginpage.dart';
import 'package:burble/signuppage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/mainpage.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: EdgeInsets.only(left: 30, top: 180),
            child: Text(
              'Welcome to \nBurble',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, top: 340),
            child: Text(
              'Easily Connect with Anyone',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
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
                  shadowColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(10),
                  minimumSize: MaterialStateProperty.all(const Size(250, 40)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Color.fromARGB(255, 10, 55, 93),
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 560),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shadowColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(10),
                  minimumSize: MaterialStateProperty.all(const Size(250, 40)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

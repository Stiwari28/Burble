// ignore_for_file: must_be_immutable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:burble/loginpage.dart';
import 'package:burble/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(duration: 2, goToPage: WelcomePage()),
  ));
}

class SplashScreen extends StatefulWidget {
  int duration = 0;
  Widget goToPage;

  SplashScreen({required this.goToPage, required this.duration});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.widget.duration), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => this.widget.goToPage));
    });

    return AnimatedSplashScreen(
        splash: Column(children: [
          Image.asset(
            'assets/burble.png',
            width: 300,
            height: 300,
          ),
        ]),
        backgroundColor: Color.fromARGB(255, 180, 201, 219),
        nextScreen: WelcomePage(),
        splashIconSize: 380);
  }
}

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
            padding: EdgeInsets.only(left: 30, top: 120),
            child: Text(
              'Welcome to \nBurble',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}

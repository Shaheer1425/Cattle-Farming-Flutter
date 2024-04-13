import 'dart:async';

import 'package:cattlefarming/Screens/signInScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // late Timer _timer;
  void initState() {
    // TODO: implement initState
    super.initState();
    _newTimer();
  }

  void _newTimer() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return SignIn();
      }));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splashScreen.png"),
              fit: BoxFit.cover)),
    ));
  }
}

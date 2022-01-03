import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/modules/welcome/onboarding_screen.dart';
import 'package:summer_app/shared/app_style.dart';

class SplashScreen extends StatefulWidget
{
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(milliseconds: 2500);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const BoardingScreen() ,
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 300.0,
          width: 300.0,
          decoration:  BoxDecoration(
            border: Border.all(
              color: primaryColor,
            ),
            color: primaryColor,
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage("assets/images/new_splash_screen.jpg"),
              fit: BoxFit.cover,
            ),
          ),

        ),
      ),
    );
  }
}

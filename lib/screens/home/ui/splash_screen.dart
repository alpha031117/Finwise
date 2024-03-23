// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/bottom_nav_bar/my_bottom_nav_bar.dart';
import 'package:vhack_finwise_app/screens/login/ui/sign_up_screen.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Set the initial route to SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // After 2 seconds, navigate to the home screen
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.primaryColor,
      body: Center(
        child: Column(

          children: [
            SizedBox(height: 300), // Added SizedBox to create space between the image and the text (line 64
            Container( 
              height:300,
              width: 300,
              child: Image.asset( // Changed 'image' to 'child' and fixed Image.asset syntax
                'assets/VhackLogo.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 130),
            Text(
              textAlign: TextAlign.end,
              'FinWise',
              style: TextStyle( 
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 40,
                fontFamily: GlobalVariables.finwiseFont().fontFamily,
                letterSpacing: 5,
              )
            )
          ],
        ),
      ),
    );
  }
}


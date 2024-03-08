// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   body: Center(
      // child: Text('Settings Screen'),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
                fontFamily: GlobalVariables.titleFont().fontFamily,
                fontWeight: FontWeight.bold,
                color: GlobalVariables.tertiaryColor,
                letterSpacing: 1,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Setting Screen',
          style: TextStyle(
            fontFamily: GlobalVariables.pointFont().fontFamily,
          ),
        ),
      ),
    );
  }
}

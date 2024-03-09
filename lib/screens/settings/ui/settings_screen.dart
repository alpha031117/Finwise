// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
                fontFamily: GlobalVariables.titleFont().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: GlobalVariables.tertiaryColor,
                letterSpacing: 1,
            ),
          ),
        ),
      ),
      body: Row(
        children: <Widget>[
          Image(
            image: AssetImage('assets/profilepic.png'),
          )
        ],
      )
    );
  }
}

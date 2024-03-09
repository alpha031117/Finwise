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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
        child: Row(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Image(
                image: AssetImage('assets/profilepic.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Leon Loo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      fontFamily: GlobalVariables.textFont().fontFamily,
                    )
                    ),
                  Text(
                    'Student in UM',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GlobalVariables.textFont().fontFamily,  
                    )
                    )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

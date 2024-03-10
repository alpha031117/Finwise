// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

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
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.black),
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black),
                    // ),
                    child: Image(
                      image: AssetImage('assets/profilepic.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Leon Loo',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Student In University of 69',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.black),
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // textBaseline: TextBaseline.alphabetic, // Ensure the baseline is aligned with the text
                children: <Widget>[
                  Text(
                    '8869',
                    style: TextStyle(
                      fontSize: 48,
                      fontFamily: GlobalVariables.pointFont().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7E89EB),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      ' pts',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: GlobalVariables.pointFont().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7E89EB),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton(
                onPressed: (){} ,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: GlobalVariables.primaryColor,
                  fixedSize: Size(200,28)
                ), 
                child: Text(
                  'Redeem Rewards',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

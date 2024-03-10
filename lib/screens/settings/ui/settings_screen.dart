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
            displayProfile(),
            SizedBox(height: 10),
            displayPoints(),
            redeemRewardsButton(),
            SizedBox(height: 70),
            buttonList(Icons.border_color, 'Edit Profile'),
            SizedBox(height: 23),
            buttonList(Icons.settings, 'Settings'),
            SizedBox(height: 23),
            buttonList(Icons.help, 'Help & Support'),
            SizedBox(height: 23),
            buttonList(Icons.logout, 'Log Out'),
          ],
        ),
      ),
    );
  }

  Widget displayProfile() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('assets/profilepic.png'),
            ),
          ),
          SizedBox(width: 10),
          Container(
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
    );
}

  Widget displayPoints() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '8869',
            style: TextStyle(
              fontSize: 48,
              fontFamily: GlobalVariables.pointFont().fontFamily,
              fontWeight: FontWeight.w900,
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
    );
  }

  Widget redeemRewardsButton() {
    return Center(
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
    );
  }

  Widget buttonList(IconData buttonIcon, String buttonText) {
    return Center(
      child: Container(
        height: 45,
        width: 330,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.10),
              spreadRadius: 5,
              blurRadius: 5, 
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: Size(330,45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon( 
                  buttonIcon,
                  color: Colors.black,
                  size: 24,
                ),
                SizedBox(width: 10),
                Text(
                  buttonText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 0.0,
                    color: Color(0xFF646464),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}

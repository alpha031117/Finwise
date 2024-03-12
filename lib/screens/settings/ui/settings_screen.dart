// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/user.dart';
import 'package:vhack_finwise_app/screens/settings/ui/redeem_rewards.dart';
import 'package:vhack_finwise_app/screens/settings/ui/edit_profile.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';
import 'package:vhack_finwise_app/data/users.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key});

  final List<MyUser> users = UserDatabase.users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            displayProfile(),
            SizedBox(height: 10),
            displayPoints(),
            redeemRewardsButton(context),
            SizedBox(height: 70),
            buttonList(Icons.border_color, 'Edit Profile', context),
            SizedBox(height: 23),
            buttonList(Icons.settings, 'Settings', context),
            SizedBox(height: 23),
            buttonList(Icons.help, 'Help & Support', context),
            SizedBox(height: 23),
            buttonList(Icons.logout, 'Log Out', context),
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
                    (users[0].username),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (users[0].occupation),
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
            (users[0].points.toString()),
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

  Widget redeemRewardsButton(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => redeemRewards()));
        } ,
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

  Widget buttonList(IconData buttonIcon, String buttonText, BuildContext context) {
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
        child: SingleChildScrollView(
          child: Center(
            child: TextButton(
              onPressed: () {
                switch (buttonText) {
                  case 'Edit Profile':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => editProfile()));
                    break;
                  case 'Settings':
                    break;
                  case 'Help & Support':
                    break;
                  case 'Log Out':
                    break;
                }
              },
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
      ),
    );
  }
  
  
}

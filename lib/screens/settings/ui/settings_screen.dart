// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/user.dart';
import 'package:vhack_finwise_app/screens/home/ui/splash_screen.dart';
import 'package:vhack_finwise_app/screens/settings/ui/redeem_rewards.dart';
import 'package:vhack_finwise_app/screens/settings/ui/edit_profile.dart';
import 'package:vhack_finwise_app/screens/settings/ui/saved_news_screen.dart';
import 'package:vhack_finwise_app/screens/settings/ui/setting.dart';
import 'package:vhack_finwise_app/screens/settings/ui/widgets/test_button.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';
import 'package:vhack_finwise_app/data/users.dart';

import 'widgets/button_list.dart';
import 'widgets/display_points.dart';
import 'widgets/display_profile.dart';
import 'widgets/redeem_rewards.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<MyUser> users = UserDatabase.users;
// Create a method to handle navigation and update points

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
            DisplayProfile(
              users: users,
            ),
            SizedBox(height: 10),
            DisplayPoints(users: users),
            RedeemRewardsButton(context: context),
            SizedBox(height: 70),
            ButtonList(
                buttonIcon: Icons.bookmark,
                buttonText: 'Saved News',
                context: context),
            SizedBox(height: 23),
            ButtonList(
                buttonIcon: Icons.border_color,
                buttonText: 'Edit Profile',
                context: context),
            SizedBox(height: 23),
            ButtonList(
                buttonIcon: Icons.settings,
                buttonText: 'Settings',
                context: context),
            SizedBox(height: 23),
            ButtonList(
                buttonIcon: Icons.logout,
                buttonText: 'Log Out',
                context: context),
          ],
        ),
      ),
    );
  }
}

class ButtonList extends StatelessWidget {
  const ButtonList({
    super.key,
    required this.buttonIcon,
    required this.buttonText,
    required this.context,
  });

  final IconData buttonIcon;
  final String buttonText;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
                    break;
                  case 'Settings':
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SettingPage()));
                    break;
                  case 'Saved News':
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SavedNewsScreen()));
                    break;
                  case 'Log Out':
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreen()));
                    break;
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(330, 60),
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
                      color: Colors.black,
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

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, camel_case_types, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vhack_finwise_app/screens/settings/ui/about_us.dart';
import 'package:vhack_finwise_app/screens/settings/ui/help_center.dart';
import 'package:vhack_finwise_app/screens/settings/ui/privacy_policy.dart';
import 'package:vhack_finwise_app/screens/settings/ui/terms_and_conditions.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';


class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switchValue1 = false;
  bool _switchValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
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
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: ListView(
          children: <Widget>[
            SettingsButton(
              label: 'Notification',
              value: _switchValue1,
              onChanged: (bool value) {
                setState(() {
                  _switchValue1 = value;
                });
              },
              iconData: Icons.notifications,
              space: 145,
            ),
            SizedBox(height: 25),
            SettingsButton(
              label: 'Dark Mode',
              value: _switchValue2,
              onChanged: (bool value) {
                setState(() {
                  _switchValue2 = value;
                });
              },
              iconData: Icons.dark_mode,
              space: 152,
            ),
            SizedBox(height: 25),
            ButtonList(buttonIcon: Icons.language, buttonText: 'Language', context: context, route: 'Language'),
            SizedBox(height: 25),
            ButtonList(buttonIcon: Icons.help, buttonText: 'Help & Support', context: context, route: 'Help & Support'),
            SizedBox(height: 25),
            ButtonList(buttonIcon: Icons.description, buttonText: 'Terms & Conditions', context: context, route: 'Terms & Conditions'),
            SizedBox(height: 25),
            ButtonList(buttonIcon: Icons.policy_outlined, buttonText: 'Privacy Policy', context: context, route: 'Privacy Policy'),
            SizedBox(height: 25),
            ButtonList(buttonIcon: Icons.info, buttonText: 'About Us', context: context, route: 'About Us'),
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
    required this.route,
  });

  final IconData buttonIcon;
  final String buttonText;
  final BuildContext context;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 60, 
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
      child: TextButton(
        onPressed: () {
          switch (route) {
            case 'Help & Support':
              Navigator.push(context, MaterialPageRoute(builder: (context) => HelpCenter()));
              break;
            case 'Terms & Conditions':
              Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditions()));
              break;
            case 'Privacy Policy':
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              break;
            case 'About Us':
              Navigator.push(context, MaterialPageRoute(builder: (context) => aboutUs()));
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
            SizedBox(width: 10),
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
    );
  }
}

class SettingsButton extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData iconData; // Icon data to display the icon
  final double space;

  const SettingsButton({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.iconData, 
    required this.space, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.10),
            spreadRadius: 5,
            blurRadius: 5, 
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              SizedBox(width: 20),
              Icon(
                iconData, 
                color: Colors.black
              ), // The icon
              SizedBox(width: 10), // Space between icon and text
              Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0, // Adjust font size to match design
                ),
              ),
              SizedBox(width: space),
              CupertinoSwitch(
                value: value,
                onChanged: onChanged,
                activeColor: CupertinoColors.systemGreen, // Customize active color
              ),
            ],
          ),
        ],
      ),
    );
  }
}
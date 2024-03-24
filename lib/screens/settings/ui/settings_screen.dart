// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vhack_finwise_app/model/user.dart';
import 'package:vhack_finwise_app/screens/home/ui/splash_screen.dart';
import 'package:vhack_finwise_app/screens/settings/points_bloc/points_bloc.dart';
import 'package:vhack_finwise_app/screens/settings/ui/redeem_rewards_screen.dart';
import 'package:vhack_finwise_app/screens/settings/ui/edit_profile.dart';
import 'package:vhack_finwise_app/screens/settings/ui/saved_news_screen.dart';
import 'package:vhack_finwise_app/screens/settings/ui/setting.dart';

import 'package:vhack_finwise_app/utils/global_variables.dart';
import 'package:vhack_finwise_app/data/users.dart';

import 'widgets/button_list.dart' as MyButtonList;
import 'widgets/display_points.dart';
import 'widgets/display_profile.dart';
import 'widgets/redeem_rewards.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<MyUser> users = UserDatabase.users;
// Create a method to handle navigation and update points
  final PointsBloc pointsBloc = PointsBloc();
  
  @override
  Widget build(BuildContext context) {
    
    pointsBloc.add(PointsInitializePointsEvent());
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
            MyButtonList.ButtonList(
                buttonIcon: Icons.bookmark,
                buttonText: 'Saved News',
                context: context),
            SizedBox(height: 23),
            MyButtonList.ButtonList(
                buttonIcon: Icons.border_color,
                buttonText: 'Edit Profile',
                context: context),
            SizedBox(height: 23),
            MyButtonList.ButtonList(
                buttonIcon: Icons.settings,
                buttonText: 'Settings',
                context: context),
            SizedBox(height: 23),
            MyButtonList.ButtonList(
                buttonIcon: Icons.logout,
                buttonText: 'Log Out',
                context: context),
          ],
        ),
      ),
    );
  }
}

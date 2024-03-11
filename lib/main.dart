import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/settings/ui/redeem_rewards.dart';

import 'screens/bottom_nav_bar/my_bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyBottomNavBar(),
      routes: {
        "/redeemRewards": (context) => redeemRewards(), // Assuming RedeemRewards is the correct widget to navigate to
      },
    );
  }
}

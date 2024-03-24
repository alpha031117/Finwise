import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:vhack_finwise_app/screens/home/ui/splash_screen.dart';
import 'package:vhack_finwise_app/screens/settings/ui/redeem_rewards.dart';
import 'screens/bottom_nav_bar/my_bottom_nav_bar.dart';
import 'simple_bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(const MyApp()));
  
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
      // home: MyBottomNavBar(),
      home: SplashScreen(),
    );
  }
}

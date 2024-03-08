import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vhack_finwise_app/screens/calculator/ui/calculator_screen.dart';
import 'package:vhack_finwise_app/screens/home/ui/home_screen.dart';
import 'package:vhack_finwise_app/screens/leaderboard/ui/leaderboard_screen.dart';
import 'package:vhack_finwise_app/screens/settings/ui/settings_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

//the commented section is for the dark mode
class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/bottom_nav_bar';

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  List<Widget> pages = [
    const HomeScreen(),
    const LeaderBoardScreen(),
    const CalculatorScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    // Color tabShadowColor = Color.fromRGBO(129, 101, 234, 1);

    List<Widget> buildScreens() {
      return [
        const HomeScreen(),
        const LeaderBoardScreen(),
        const CalculatorScreen(),
        const SettingsScreen()
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          inactiveIcon: const Icon(Icons.home_outlined),
          icon: const Icon(Icons.home),
          activeColorPrimary: GlobalVariables.primaryColor,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: const Icon(Icons.leaderboard_outlined),
          icon: const Icon(Icons.leaderboard),
          activeColorPrimary: GlobalVariables.primaryColor,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: const Icon(Icons.calculate_outlined),
          icon: const Icon(Icons.calculate),
          activeColorPrimary: GlobalVariables.primaryColor,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: const Icon(Icons.settings_outlined),
          icon: const Icon(Icons.settings),
          activeColorPrimary: GlobalVariables.primaryColor,
          inactiveColorPrimary: Colors.black,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}


  // return Scaffold(
  //     body: pages.elementAt(_selectedIndex),
  //     bottomNavigationBar: Container(
  //       color: backgroundColor,
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //         child: GNav(
  //           // duration: mode.isDark
  //           //     ? Duration(milliseconds: 0)
  //           //     : Duration(milliseconds: 500),
  //           gap: 8,
  //           color: icon,
  //           activeColor: Theme.of(context).primaryColor,
  //           padding: EdgeInsets.all(16),
  //           tabBackgroundColor: tabColor,
  //           tabs: [
  //             GButton(
  //               // shadow: _selectedIndex == 0 && mode.isDark
  //               //     ? [
  //               //         BoxShadow(
  //               //           color: tabShadowColor,
  //               //           offset: const Offset(
  //               //             0.0,
  //               //             0.0,
  //               //           ),
  //               //           blurRadius: 5.0,
  //               //           spreadRadius: 1.0,
  //               //         ), //BoxShadow
  //               //         //BoxShadow
  //               //       ]
  //               //     : null,
  //               icon: Icons.people,
  //               iconActiveColor: Colors.white,
  //               // text: 'Visitor',
  //               textColor: Colors.white,
  //             ),
  //             GButton(
  //               // shadow: _selectedIndex == 1 && mode.isDark
  //               //     ? [
  //               //         BoxShadow(
  //               //           color: tabShadowColor,
  //               //           offset: const Offset(
  //               //             0.0,
  //               //             0.0,
  //               //           ),
  //               //           blurRadius: 5.0,
  //               //           spreadRadius: 1.0,
  //               //         ), //BoxShadow
  //               //         //BoxShadow
  //               //       ]
  //               //     : null,
  //               icon: Icons.home_outlined,
  //               iconActiveColor: Colors.white,
  //               // text: 'Home',
  //               textColor: Colors.white,
  //             ),
  //             GButton(
  //               // shadow: _selectedIndex == 2 && mode.isDark
  //               //     ? [
  //               //         BoxShadow(
  //               //           color: tabShadowColor,
  //               //           offset: const Offset(
  //               //             0.0,
  //               //             0.0,
  //               //           ),
  //               //           blurRadius: 5.0,
  //               //           spreadRadius: 1.0,
  //               //         ), //BoxShadow
  //               //         //BoxShadow
  //               //       ]
  //               //     : null,
  //               icon: Icons.payment_outlined,
  //               iconActiveColor: Colors.white,
  //               // text: 'Payments',
  //               textColor: Colors.white,
  //             ),
  //             GButton(
  //               // shadow: _selectedIndex == 3 && mode.isDark
  //               //     ? [
  //               //         BoxShadow(
  //               //           color: tabShadowColor,
  //               //           offset: const Offset(
  //               //             0.0,
  //               //             0.0,
  //               //           ),
  //               //           blurRadius: 5.0,
  //               //           spreadRadius: 1.0,
  //               //         ), //BoxShadow
  //               //         //BoxShadow
  //               //       ]
  //               //     : null,
  //               icon: Icons.settings_outlined,
  //               iconActiveColor: Colors.white,
  //               // text: 'Settings',
  //               textColor: Colors.white,
  //             ),
  //           ],
  //           selectedIndex: _selectedIndex,
  //           onTabChange: (index) {
  //             setState(
  //               () {
  //                 _selectedIndex = index;
  //               },
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
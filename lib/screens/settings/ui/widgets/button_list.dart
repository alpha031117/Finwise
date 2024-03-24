import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vhack_finwise_app/screens/login/ui/sign_up_screen.dart';
import '../../../home/ui/splash_screen.dart';
import '../edit_profile.dart';
import '../saved_news_screen.dart';
import '../setting.dart';

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
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(builder: (context) {
                    //     return LoginScreen();
                    //   }),
                    //   (route) => false, // Remove all routes from the stack
                    // );

                    pushNewScreen(context,
                        screen: LoginScreen(), withNavBar: false);

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

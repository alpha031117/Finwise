// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/bottom_nav_bar/my_bottom_nav_bar.dart';
import 'package:vhack_finwise_app/screens/login/ui/sign_up_screen.dart';

import '../../../../utils/global_variables.dart';
import '../login_screen.dart';

class ContinueWithEmailButton extends StatefulWidget {

  ContinueWithEmailButton({
    super.key,
  });

  @override
  State<ContinueWithEmailButton> createState() => _ContinueWithEmailButtonState();
}

class _ContinueWithEmailButtonState extends State<ContinueWithEmailButton> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
        child: Container(
          width: 310,
          height: 50,
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
          child: Center(
            child: Text(
              'Continue with Email',
              style: TextStyle(
                color: GlobalVariables.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

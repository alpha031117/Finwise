// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/home/ui/home_screen.dart';
import 'package:vhack_finwise_app/screens/login/ui/login_screen.dart';
import 'package:vhack_finwise_app/screens/login/ui/validation.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

import 'widget/continue_with_apple.dart';
import 'widget/continue_with_email.dart';
import 'widget/continue_with_google.dart';
import 'widget/divider_line.dart';
import 'widget/logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center( 
            child: SafeArea( 
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[ 
                  SizedBox(height: 100),
                  Logo(),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Get Your Free Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ContinueWithApple(),
                  SizedBox(height: 20),
                  ContinueWithGoogle(),
                  SizedBox(height: 40),
                  DividerLine(text: 'OR',),
                  SizedBox(height: 40),
                  ContinueWithEmailButton(),
                  SizedBox(height: 20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color: GlobalVariables.skyBlueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              )
            )
          ),
        ),
      ),
    );
  }

  Form emailAddressTextField() {
    return Form( 
      child: Column( 
        children: [ 
          Center(
            child: Container(
              width: 310,
              height: 50,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField( 
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        isEmailValid = true;
                      });
                    } else {
                      final isValid = validateEmailAddress(value);
                      if (isValid) {
                        setState(() {
                          isEmailValid = true;
                        });
                      } else {
                        setState(() {
                          isEmailValid = false;
                        });
                      }
                    }
                  },
                  textCapitalization: TextCapitalization.words, // Capitalize first letter of each name
                  decoration: InputDecoration(
                    label: Text('Email Address'),
                    enabledBorder: OutlineInputBorder( 
                      borderSide: BorderSide.none,
                    ), 
                    prefixIcon: Icon(Icons.email),
                    labelStyle: TextStyle( 
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]
      )
    );
  }
}







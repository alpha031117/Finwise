// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/home/ui/home_screen.dart';
import 'package:vhack_finwise_app/screens/login/ui/login_screen.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  logo(),
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
                  continueWithApple(),
                  SizedBox(height: 20),
                  continueWithGoogle(),
                  SizedBox(height: 40),
                  dividerLine(),
                  SizedBox(height: 40),
                  emailAddressTextField(),
                  SizedBox(height: 10),
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
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  continueWithEmailButton()
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

class continueWithEmailButton extends StatelessWidget {
  const continueWithEmailButton({
    super.key,
  });

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

class dividerLine extends StatelessWidget {
  const dividerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 13),
        Container(
          width: 160,
          child: Divider( 
            color: Colors.white,
            thickness: 1,
            endIndent: 10,
          ),
        ),
        Center(
          child: Text( 
            'OR',
            style: TextStyle( 
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        Container(
          width: 160,
          child: Divider( 
            color: Colors.white,
            thickness: 1,
            indent: 10,
          ),
        ),
      ],
    );
  }
}

class continueWithGoogle extends StatelessWidget {
  const continueWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Image.asset(
                  'assets/google.png',
                  height: 35,
                  width: 35,
                ), // The icon
                SizedBox(width: 10), // Space between icon and text
                Text(
                  "Continue with Google",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0, // Adjust font size to match design
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class continueWithApple extends StatelessWidget {
  const continueWithApple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 310,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.black,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  Icons.apple, 
                  color: Colors.white,
                  size: 35,
                ), // The icon
                SizedBox(width: 10), // Space between icon and text
                Text(
                  "Continue with Apple",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0, // Adjust font size to match design
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class logo extends StatelessWidget {
  const logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row( 
        children: [ 
          Container( 
            height: 50,
            width: 50,
            child: Image.asset( 
              'assets/VhackLogo.png',
              fit: BoxFit.contain,
            )
          ),
          Text( 
            'FinWise',
            style: TextStyle( 
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            )
          )
        ]
      ),
    );
  }
}
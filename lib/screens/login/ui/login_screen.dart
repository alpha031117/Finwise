// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vhack_finwise_app/screens/bottom_nav_bar/my_bottom_nav_bar.dart';

import 'package:vhack_finwise_app/screens/home/ui/home_screen.dart';
import 'package:vhack_finwise_app/screens/login/ui/validation.dart';
import 'package:vhack_finwise_app/screens/login/ui/widget/divider_line.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;
  bool _isObscureText = true;

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
                      'Log In to FinWise',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  emailAddressTextField(),
                  SizedBox(height: 20),
                  passwordTextField(),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(right: 35),
                    child: Text( 
                      'Forgot Password?',
                      textAlign: TextAlign.end,
                      style: TextStyle( 
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  logInButton(isEmailValid: isEmailValid),
                  SizedBox(height: 10),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'New user?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Sign Up',
                            style: TextStyle(
                              color: GlobalVariables.skyBlueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 130),
                  DividerLine(text: 'Or onnect with'),
                  SizedBox(height: 20),
                  continueWithApple(),
                  SizedBox(height: 20),
                  continueWithGoogle(),
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                        color: emailController.text.isEmpty ? Colors.black : isEmailValid ? Colors.green : Colors.red,
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

  Form passwordTextField() {
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
                  focusNode: FocusNode(),
                  obscureText: _isObscureText,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector( 
                      child: Icon(_isObscureText ? Icons.visibility : Icons.visibility_off),
                      onTap: () {
                        setState(() {
                          _isObscureText = !_isObscureText;
                        });
                      },
                    ),
                    label: Text('Password'),
                    enabledBorder: OutlineInputBorder( 
                      borderSide: BorderSide.none,
                    ), 
                    prefixIcon: Icon(Icons.lock),
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

class logInButton extends StatefulWidget {
  final bool isEmailValid;

  logInButton({
    super.key,
    required this.isEmailValid,
  });

  @override
  State<logInButton> createState() => _logInButtonState();
}

class _logInButtonState extends State<logInButton> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 

  void _showSnackBar() {
    final snackBar = SnackBar(content: Text('Invalid Email Or Password'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar); // Access the currentState and show the SnackBar
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () { 
          if (widget.isEmailValid == true) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomNavBar()));
          } else {
            _showSnackBar();
          }
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
              'Log In',
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
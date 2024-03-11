// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';
import 'package:vhack_finwise_app/data/users.dart';

import '../../../model/user.dart';



class editProfile extends StatelessWidget {

  final List<MyUser> users = UserDatabase.users;
  editProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        title: Text( 
          'Edit Profile',
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: GlobalVariables.tertiaryColor,
            letterSpacing: 1,
          ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column( 
          children: <Widget>[
            Center(
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('assets/profilepic.png'),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.border_color,
                          color: Colors.black,
                          size: 24
                        ),
                      ),
                    ),
                  )
                ]
              )
            ),
            SizedBox(height: 20),
            Form( 
              child: Column( 
                children: [ 
                  TextFormField( 
                    textCapitalization: TextCapitalization.words, // Capitalize first letter of each name
                    decoration: InputDecoration(
                      hintText: users[0].username,
                      label: Text('Username'),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelStyle: TextStyle( 
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}
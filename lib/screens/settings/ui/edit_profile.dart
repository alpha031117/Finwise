// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';
import 'package:vhack_finwise_app/data/users.dart';
import '../../../model/user.dart';

const List<String> genderList = <String>['Male', 'Female', 'Rather not to say'];
const List<String> occupationList = <String>['Student', 'Working', 'Others'];

class EditProfile extends StatefulWidget {


  const EditProfile({Key? key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final List<MyUser> users = UserDatabase.users;
  String genderFirstValue = genderList.first;
  String occupationFirstValue = occupationList.first;
  String? value;
  bool ischecked1 = false;
  bool ischecked2 = false;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column( 
            children: <Widget>[
              Center(
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/ProfilePicture.png'),
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
                    Container(
                       decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField( 
                          textCapitalization: TextCapitalization.words, // Capitalize first letter of each name
                          decoration: InputDecoration(
                            hintText: users[0].username,
                            label: Text('Username'),
                            enabledBorder: OutlineInputBorder( 
                              borderSide: BorderSide.none,
                            ), 
                            prefixIcon: Icon(Icons.person),
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
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField( 
                          textCapitalization: TextCapitalization.words, // Capitalize first letter of each name
                          decoration: InputDecoration(
                            hintText: users[0].email,
                            label: Text('Email Address'),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.mail),
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
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IntlPhoneField( 
                          initialCountryCode: 'MY',
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: '12-3456789',
                            label: Text('Phone Number'),
                            border: InputBorder.none,
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
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: genderFirstValue,
                          decoration: InputDecoration(
                            hintText: 'Gender',
                            label: Text('Gender'),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.wc),
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
                          items: genderList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle dropdown value change
                            // You can update the dropdownValue variable here
                            genderFirstValue = newValue!;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: occupationFirstValue,
                          decoration: InputDecoration(
                            hintText: 'Occupation',
                            label: Text('Occupation'),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.badge),
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
                          items: occupationList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle dropdown value change
                            // You can update the dropdownValue variable here
                            occupationFirstValue = newValue!;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Divider(color: Colors.grey[300]),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: ischecked1,
                          activeColor: GlobalVariables.primaryColor,
                          onChanged: (bool? value) {
                            setState(() {
                              ischecked1 = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text( 
                            'Yes, I would like to receive latest updates and promotions related to FinWise. ',
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: ischecked2,
                          activeColor: GlobalVariables.primaryColor,
                          onChanged: (bool? value) {
                            setState(() {
                              ischecked2 = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text( 
                            'Yes, I agree that my Personal Data may be shared, based on the following Terms and Conditions with FinWise and shall be used, processed, and treated in accordance to FinWise’s Privacy Policy ',
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: (){
                      } ,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: GlobalVariables.primaryColor,
                        fixedSize: Size(200, 28),
                      ), 
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextButton(
                      onPressed: (){
                      } ,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        // backgroundColor: GlobalVariables.primaryColor,
                        fixedSize: Size(200, 28),
                      ), 
                      child: Text(
                        'Delete My Account',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20)
                  ]
                )
              )
            ]
          )
        ),
      )
    );
  }

}
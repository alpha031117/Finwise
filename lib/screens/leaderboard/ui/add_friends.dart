// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/data/users.dart';
import 'package:vhack_finwise_app/model/user.dart'; // Import the user model
import 'package:vhack_finwise_app/utils/global_variables.dart';

class AddFriend extends StatefulWidget {
  const AddFriend({Key? key}) : super(key: key);

  @override
  State<AddFriend> createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Declare the GlobalKey

  void _showSnackBar() {
    final snackBar = SnackBar(content: Text('Add friend request sent'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar); // Access the currentState and show the SnackBar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Set the key property of Scaffold
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Friends',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: GlobalVariables.textFont().fontFamily,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: UserDatabase.users.length,
                          itemBuilder: (context, index) {
                            MyUser friend = UserDatabase.users[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(friend.profileUrl),
                                    radius: 30,
                                  ),
                                  SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: Text(
                                          friend.username,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: GlobalVariables.secondaryColor,
                                    ),
                                    onPressed: () {
                                      _showSnackBar(); // Show snackbar
                                    },
                                    child: Text(
                                      'Add Friend',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
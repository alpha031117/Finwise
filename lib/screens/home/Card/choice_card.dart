import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/home/ui/global_screen.dart';
import 'package:vhack_finwise_app/screens/home/ui/local_screen.dart';

import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';

class choice_card extends StatelessWidget {
  List<New> newsdata = NewDatabase.newss;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  global_screen(newss:newsdata),
                      ),
                    );
          },
          child: Container(
            width: 135, // Half of screen width
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  // Use Column for vertical arrangement
                  mainAxisSize: MainAxisSize.min, // Restrict card height
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/earth.jpg'),
                      radius: 20,
                    ),
                    SizedBox(height: 10.0), // Adjust spacing as needed
                    Text(
                      'Global',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Spacer(flex: 2),
        GestureDetector(
          onTap: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  local_screen(newss:newsdata),
                      ),
                    );
          },
          child: Container(
            width: 145, // Half of screen width
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  // Use Column for vertical arrangement
                  mainAxisSize: MainAxisSize.min, // Restrict card height
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/local.jpg'),
                      radius: 20,
                    ),
                    Text(
                      'Local',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class choice_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
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
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Spacer(flex: 2),
        Container(
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
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

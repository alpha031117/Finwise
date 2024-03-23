import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/local_screen_news_model.dart';
import 'package:vhack_finwise_app/screens/home/ui/global_screen.dart';
import 'package:vhack_finwise_app/screens/home/ui/local_screen.dart';

import 'package:vhack_finwise_app/model/global_screen_news_model.dart';
import 'package:vhack_finwise_app/data/global_screen_news_data.dart';

import 'package:vhack_finwise_app/model/local_screen_news_model.dart';
import 'package:vhack_finwise_app/data/local_screen_news_data.dart';

class GlobalOrLocalSelection extends StatelessWidget {
  List<GlobalNews> globalnews = GlobalNewsDatabase.globalnews;

  List<LocalNews> localnews = LocalNewsDatabase.localnews;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GlobalScreen(
                  globalnews: globalnews,
                ),
              ),
            );
          },
          child: SizedBox(
            width: 160, // Half of screen width
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
                    SizedBox(width: 15.0), // Adjust spacing as needed
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
        SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LocalScreen(
                  localnews: localnews,
                ),
              ),
            );
          },
          child: Container(
            width: 160, // Half of screen width
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
                    SizedBox(width: 15),
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

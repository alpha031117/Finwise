import 'package:flutter/material.dart';

import '../../../../model/user.dart';

class DisplayProfile extends StatelessWidget {
  const DisplayProfile({
    super.key,
    required this.users,
  });

  final List<MyUser> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('assets/ProfilePicture.png'),
            ),
          ),
          SizedBox(width: 10),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    
                    width: 150,
                    child: Text(
                      (users[0].username),
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    (users[0].occupation),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
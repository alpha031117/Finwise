import 'package:flutter/material.dart';

import '../../../../model/user.dart';
import '../../../../utils/global_variables.dart';

class DisplayPoints extends StatelessWidget {
  const DisplayPoints({
    super.key,
    required this.users,
  });

  final List<MyUser> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            (users[0].points.toString()),
            style: TextStyle(
              fontSize: 48,
              fontFamily: GlobalVariables.pointFont().fontFamily,
              fontWeight: FontWeight.w900,
              color: Color(0xff7E89EB),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              ' pts',
              style: TextStyle(
                fontSize: 20,
                fontFamily: GlobalVariables.pointFont().fontFamily,
                fontWeight: FontWeight.bold,
                color: Color(0xff7E89EB),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

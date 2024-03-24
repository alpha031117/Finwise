import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vhack_finwise_app/data/users.dart';

import '../../../../model/user.dart';
import '../../../../utils/global_variables.dart';
import '../../points_bloc/points_bloc.dart';

class DisplayPoints extends StatefulWidget {
  const DisplayPoints({
    super.key,
    required this.users,
  });

  final List<MyUser> users;

  @override
  State<DisplayPoints> createState() => _DisplayPointsState();
}

class _DisplayPointsState extends State<DisplayPoints> {
  final PointsBloc pointsBloc = PointsBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BlocBuilder<PointsBloc, PointsState>(
            bloc: pointsBloc,
            builder: (context, state) {
              
              if (state is PointsMinusPointsSuccessfulState) {
                final currentPoints = state.currentPoints;
                return Text(
                  (currentPoints),
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: GlobalVariables.pointFont().fontFamily,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff7E89EB),
                  ),
                );
              } else {
                return Text(
                  (UserDatabase.users[0].points.toString()),
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: GlobalVariables.pointFont().fontFamily,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff7E89EB),
                  ),
                );
              }
            },
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

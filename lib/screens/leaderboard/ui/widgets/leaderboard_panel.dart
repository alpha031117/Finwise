import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vhack_finwise_app/model/user.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class LeaderboardPanel extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController; // for the drag handler
  final List<MyUser> users;
  const LeaderboardPanel({
    super.key,
    required this.controller,
    required this.panelController,
    required this.users,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: GlobalVariables.horizontalPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ListView.builder(
        controller: controller,
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ListTile(
              leading: CircleAvatar(
                maxRadius: 25,
                backgroundImage: NetworkImage(users[index].profileUrl),
              ),
              title: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(users[index].username),
                ],
              ),
              trailing: Text(users[index].points.toString()),
            ),
          );
        },
      ),
    );
  }
}

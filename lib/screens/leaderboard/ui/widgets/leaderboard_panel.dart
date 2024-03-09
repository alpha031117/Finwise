import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class LeaderboardPanel extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController; // for the drag handler
  const LeaderboardPanel({
    super.key,
    required this.controller,
    required this.panelController,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: GlobalVariables.horizontalPadding),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: ListView.builder(
        controller: controller,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../utils/global_variables.dart';

class PotentialFutureBalance extends StatelessWidget {
  const PotentialFutureBalance({
    super.key,
    required this.defaultPotentialFutureBalance,
  });

  final String defaultPotentialFutureBalance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'POTENTIAL FUTURE BALANCE',
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontSize: 15,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'RM$defaultPotentialFutureBalance',
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: GlobalVariables.tertiaryColor,
          ),
        ),
      ],
    );
  }
}

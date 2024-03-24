import 'package:flutter/material.dart';

import '../../../../utils/global_variables.dart';
import '../redeem_rewards.dart';
class RedeemRewardsButton extends StatelessWidget {
  const RedeemRewardsButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RedeemRewards()));
        } ,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: GlobalVariables.primaryColor,
          fixedSize: Size(200,28)
        ), 
        child: Text(
          'Redeem Rewards',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

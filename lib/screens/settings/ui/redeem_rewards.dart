// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/data/users.dart';
import 'package:vhack_finwise_app/model/user.dart';
import 'package:vhack_finwise_app/screens/settings/ui/voucher_details.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class redeemRewards extends StatefulWidget {
  const redeemRewards({super.key,});

  @override
  State<redeemRewards> createState() => _redeemRewardsState();
}

class _redeemRewardsState extends State<redeemRewards> {

  final List<MyUser> users = UserDatabase.users;
  final String tngLogoURL = 'https://cdn.moogold.com/2022/06/tng-ewallet-logo-2-scaled.jpg';
  final String shopeeLogoURL = 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Shopee.svg/2560px-Shopee.svg.png';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Redeem Rewards',
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: GlobalVariables.tertiaryColor,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column( 
              children: <Widget>[
                Text('Your credit'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      (users[0].points.toString()),
                      style: TextStyle(
                        fontSize: 50,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    voucher(context, tngLogoURL, 'RM20 TnG Credit', '14,500'),
                    voucher(context, tngLogoURL, 'RM20 TnG Credit', '14,500'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    voucher(context, tngLogoURL, 'RM20 TnG Credit', '14,500'),
                    voucher(context, tngLogoURL, 'RM20 TnG Credit', '14,500'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    voucher(context, tngLogoURL, 'RM20 TnG Credit', '14,500'),
                    voucher(context, tngLogoURL, 'RM20 TnG Credit', '14,500'),
                  ],
                ),
              ],
            ),
          )
        ),
      )
    );
  }

  GestureDetector voucher(BuildContext context, String logoName, String voucherDescription, String points) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => voucherDetails()));
      },
      child: Stack(
        children: <Widget>[
          Container(
            height: 230,
            width: 185,
            child: Image.asset( 
              'assets/VoucherBackgroundImage.png',
              fit: BoxFit.fill,
            ),
          ),
          Column( 
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 23, 0, 6),
                child: Container(
                  height: 50,
                  width: 130,
                  child: Image.network( 
                    logoName,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  voucherDescription,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 50, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      points,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: GlobalVariables.pointFont().fontFamily,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff727070),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        ' pts',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: GlobalVariables.pointFont().fontFamily,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff727070),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  
}
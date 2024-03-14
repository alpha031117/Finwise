// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vhack_finwise_app/data/users.dart';
import 'package:vhack_finwise_app/model/user.dart';
import 'package:vhack_finwise_app/screens/settings/ui/setting.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class redeemRewards extends StatefulWidget {
  const redeemRewards({super.key,});

  @override
  State<redeemRewards> createState() => _redeemRewardsState();
}

class _redeemRewardsState extends State<redeemRewards> {

  final List<MyUser> users = UserDatabase.users;

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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => settingPage()));
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 230,
                            width: 180,
                            child: Image.asset( 
                              'assets/VoucherBackgroundImage.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column( 
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                                child: Container(
                                  height: 70,
                                  width: 130,
                                  child: Image.asset( 
                                    'assets/ShopeeLogo.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                                child: Text(
                                  'RM20 Shopee Voucher',
                                  style: TextStyle(
                                    color: Colors.grey[500],
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
                                      (users[0].points.toString()),
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
                    ),

                    // new voucher
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => settingPage()));
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 230,
                            width: 180,
                            child: Image.asset( 
                              'assets/VoucherBackgroundImage.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 10, 10),
                            child: Text('Voucher 1'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}
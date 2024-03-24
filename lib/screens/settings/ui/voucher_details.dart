// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vhack_finwise_app/screens/settings/points_bloc/points_bloc.dart';
import 'package:vhack_finwise_app/utils/error_handle.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';


class VoucherDetailsScreen extends StatefulWidget {
  final int points;
  final Function(bool) isRedeemed;
  const VoucherDetailsScreen({
    super.key,
    required this.points,
    required this.isRedeemed,
  });

  @override
  State<VoucherDetailsScreen> createState() => _VoucherDetailsScreenState();
}

class _VoucherDetailsScreenState extends State<VoucherDetailsScreen> {
  List<String> bulletList = [
    'RM20 eVhoucher credit to top up to your Tounch n\'Go eWallet.',
    'Not valid with any others discounts and promotions',
    'No cash value.',
    'Merchant\'s Terms and Conditions apply. Visit their website for more information.'
  ];

  final pointsBloc = PointsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalVariables.primaryColor,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: 700,
                    width: 500,
                    child: Image.asset(
                      'assets/VoucherDisplayedImage.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: Container(
                        child: Column(children: <Widget>[
                      Container(
                        height: 100,
                        width: 250,
                        child: Image.asset(
                          'assets/TngLogo.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'RM20 TnG eWallet Reload',
                        style: TextStyle(
                          fontFamily: GlobalVariables.pointFont().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.points.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              fontFamily:
                                  GlobalVariables.pointFont().fontFamily,
                              fontWeight: FontWeight.w900,
                              color: const Color(0xff7E89EB),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              ' pts',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily:
                                    GlobalVariables.pointFont().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff7E89EB),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 280,
                        child: Column(
                          children: bulletList.map((strone) {
                            return Row(children: [
                              Text('\u2022',
                                  style: TextStyle(
                                    fontSize: 20,
                                    height: 3,
                                  )),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  strone,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ]);
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 60),
                      BlocConsumer<PointsBloc, PointsState>(
                        bloc: pointsBloc,
                        listener: (context, state) {
                          if (state is PointsMinusPointsSuccessfulState) {
                            widget.isRedeemed(true);
                            showSnackBar(
                                context: context,
                                text: 'Voucher Redeemed Successfully!');
                            
                          } else if (state
                              is PointsMinusPointsNotSuccessfulState) {
                            final String errorMessage = state.errorMessage;
                            widget.isRedeemed(false);

                            showSnackBar(context: context, text: errorMessage);
                          }
                          Navigator.pop(context);
                        },
                        builder: (context, state) {
                          return TextButton(
                            onPressed: () {
                              // final int currentUserPoints =
                              //     UserDatabase.users[0].points;
                              pointsBloc.add(PointsMinusPointsEvent(
                                  points: widget.points));

                              // if (currentUserPoints < widget.points) {
                              //   showDialog(
                              //       context: context,
                              //       builder: (BuildContext context) {
                              //         return AlertDialog(
                              //           title: Text('Insufficient Points'),
                              //           content: Text(
                              //               'You do not have enough points to redeem this voucher.'),
                              //           actions: <Widget>[
                              //             TextButton(
                              //               onPressed: () {
                              //                 Navigator.of(context).pop();
                              //               },
                              //               child: Text('OK'),
                              //             ),
                              //           ],
                              //         );
                              //       });
                              // } else {
                              //   UserDatabase.users[0].points -= widget.points;

                              // }
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => RedeemRewards()));
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: GlobalVariables.primaryColor,
                                fixedSize: Size(300, 50)),
                            child: Text(
                              'Redeem Now',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Valid until 15 May 2024',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ])),
                  )
                ],
              ),
            ),
          )),
        ));
  }
}

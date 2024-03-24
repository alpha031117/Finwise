import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/settings/ui/voucher_details.dart';

import '../../../../utils/global_variables.dart';

class VoucherWidget extends StatefulWidget {
  final Function(int, bool) passedBackValue;
  bool isRedeemed;
  final String logoName;
  final String voucherDescription;
  final int points;
  VoucherWidget({
    super.key,
    required this.passedBackValue,
    required this.logoName,
    required this.voucherDescription,
    required this.points,
    required this.isRedeemed,
  });

  @override
  State<VoucherWidget> createState() => _VoucherWidgetState();
}

class _VoucherWidgetState extends State<VoucherWidget> {
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        
        print('isRedeemed: ${widget.isRedeemed}');
        widget.isRedeemed
            ? null
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VoucherDetails(
                    points: widget.points,
                    passbackPoints: (passedBackPoints) {
                      
                      widget.passedBackValue(
                        passedBackPoints,
                        true,
                      );
                    },
                  ),
                ),
              );
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 230,
            child: Image.asset(
              'assets/VoucherBackgroundImage.png',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 130,
                child: Image.network(
                  widget.logoName,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.voucherDescription,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.isRedeemed ? 'Redeemed' : widget.points.toString(),
                      style: TextStyle(
                        fontSize:widget.isRedeemed ? 20 : 35,
                        fontFamily: GlobalVariables.pointFont().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: widget.isRedeemed? Colors.red : Color(0xff727070),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.isRedeemed ? '' :' pts',
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

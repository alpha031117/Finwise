import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row( 
        children: [ 
          Container( 
            height: 50,
            width: 50,
            child: Image.asset( 
              'assets/VhackLogo.png',
              fit: BoxFit.contain,
            )
          ),
          Text( 
            'FinWise',
            style: TextStyle( 
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            )
          )
        ]
      ),
    );
  }
}
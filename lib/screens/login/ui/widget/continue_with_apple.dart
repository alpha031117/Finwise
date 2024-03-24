import 'package:flutter/material.dart';

class ContinueWithApple extends StatelessWidget {
  const ContinueWithApple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 310,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.10),
              spreadRadius: 5,
              blurRadius: 5, 
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  Icons.apple, 
                  color: Colors.white,
                  size: 35,
                ), // The icon
                SizedBox(width: 10), // Space between icon and text
                Text(
                  "Continue with Apple",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0, // Adjust font size to match design
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
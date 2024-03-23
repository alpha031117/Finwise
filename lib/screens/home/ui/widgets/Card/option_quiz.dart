import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget(
      {Key? key,
      required this.option,
      required this.color,
      required this.onTap})
      : super(key: key); // Fix the super constructor
  final String option;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250, // Set the desired width

        child: Card(
          color: color,
          child: ListTile(
            title: Text(
              option,

              textAlign: TextAlign.center, // Align text to the center
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

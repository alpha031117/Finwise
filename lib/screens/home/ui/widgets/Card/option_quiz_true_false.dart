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
        alignment: Alignment.center,
        width: 120, // Set the desired width
        height: 60, // Set the desired height
        child: Card(
          color: color,
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1.1,
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                option,
                textAlign: TextAlign.center, // Align text to the center
                style: TextStyle(
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  final String text;
  const DividerLine({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 13),
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.6),
            thickness: 1,
            endIndent: 10,
          ),
        ),
        Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.6),
            thickness: 1,
            indent: 10,
          ),
        ),
      ],
    );
  }
}

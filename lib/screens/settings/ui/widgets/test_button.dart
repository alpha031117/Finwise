import 'package:flutter/material.dart';

class MyButtonTest extends StatelessWidget {
  final Function(bool) onPressed;
  const MyButtonTest({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed(false), child: Text('ok'));
  }
}
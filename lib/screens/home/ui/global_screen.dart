import 'package:flutter/material.dart';

class global_screen extends StatefulWidget {
  const global_screen({super.key});

  @override
  State<global_screen> createState() => _global_screenState();
}

class _global_screenState extends State<global_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(60.0), // specify the preferred height here
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
    );
  }
}
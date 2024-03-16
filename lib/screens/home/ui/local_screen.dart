import 'package:flutter/material.dart';

class local_screen extends StatefulWidget {
  const local_screen({super.key});

  @override
  State<local_screen> createState() => _local_screenState();
}

class _local_screenState extends State<local_screen> {
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
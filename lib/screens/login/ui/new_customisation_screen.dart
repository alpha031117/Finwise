// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/bottom_nav_bar/my_bottom_nav_bar.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class NewsCustomisationScreen extends StatefulWidget {
  const NewsCustomisationScreen({Key? key});

  @override
  State<NewsCustomisationScreen> createState() => _NewsCustomisationScreenState();
}

class _NewsCustomisationScreenState extends State<NewsCustomisationScreen> {

  final List<String> topics = [
    "Technology", "Business", "Entertainment", "Health", "Science", "Sports"
  ];
  List<bool> isClicked = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[ 
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'What Do You Like?',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Tooltip(
                        message: 'This page is still under development, your choices currently will not affected the displayed result.',
                        child: Icon(
                          Icons.help,
                          color: Colors.grey[400],
                          size: 23,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( 
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ), 
                      itemCount: 6,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isClicked[index] = !isClicked[index];
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isClicked[index]
                                    ? Colors.green // Change border color to green when clicked
                                    : GlobalVariables.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  topics[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (isClicked[index])
                                  SizedBox(height: 5),
                                Row( 
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (isClicked[index])
                                      Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ),
                                    if (isClicked[index])
                                      Text(
                                        'Clicked',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                  ]
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // SizedBox(height: 20),
                  GestureDetector(
                    onTap: () { 
                      Navigator.push(context, MaterialPageRoute(builder: (_) => MyBottomNavBar()));
                    },
                    child: Center(
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: GlobalVariables.primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF000000).withOpacity(0.10),
                              spreadRadius: 5,
                              blurRadius: 5, 
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Completed',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
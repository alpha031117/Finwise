// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vhack_finwise_app/screens/settings/ui/setting.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {

  final List<String> faqList = [
    "How to edit my profile information?",
    "What is the use of points?",
    "What can I redeem using my points?",
    "How to play the quiz?",
    "What is leaderboard?",
    "What can I win for if I'm the no.1 in the leaderboard?",
    "Where can I view the saved news?",
    "How to change my password?",
    "How to delete my account?",
    "What is the use of calculators?",
    "What is the function of podcast?",
  ];

  final List<String> topicLists = [
    "Getting Started",
    "Account",
    "Points",
    "Rewards",
    "Quiz",
    "Leaderboard",
    "Saved News",
    "Password",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Help Center',
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: GlobalVariables.tertiaryColor,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding( 
          padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'How can we help you?', 
                  style: TextStyle(
                    fontFamily: GlobalVariables.titleFont().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: .5,
                  ),
                ),
              ),
              SizedBox(height: 5),
              SearchBar( 
                hintText: 'Search Help Center',
                shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              SizedBox(height: 50),
              Text(
                'Topics',
                style: TextStyle(
                  fontFamily: GlobalVariables.titleFont().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: .5,
                ),
              ),
              Container(
                height: 120, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: faqList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FAQCard(category: topicLists[index]),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Most Frequently Asked Questions',
                style: TextStyle(
                  fontFamily: GlobalVariables.titleFont().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: .5,
                ),
              ),
              topicList(context)
            ],
          ),
          )
        )
      );
  }

  Column topicList(BuildContext context) {
    List<Widget> topicWidgets = [];

    for (String topic in faqList) {
      topicWidgets.add(
        GestureDetector(
          onTap: () {
            // Handle onTap action
          },
          child: Container(
            padding: EdgeInsets.all(10),
            width: 400,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.grey[400]!,
                ),
              ),
            ),
            child: Text(
              topic,
              style: TextStyle(
                // fontFamily: GlobalVariables.titleFont().fontFamily,
                // fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: .5,
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: topicWidgets,
    );
  }

}

class FAQCard extends StatelessWidget {
  final String category;

  FAQCard({
    required this.category
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 170, // Adjust width as needed
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 88, 173, 243),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
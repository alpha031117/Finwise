// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {

  final List<String> firstList = [ 
    'Name and contact details, such as, name, email address, postal address, and phone number.',
    'Account credentials, such as, passwords and other security information for authentication and access.',
    'Usage information, such as, behavioral information about how you navigate without out Services and which preferences, interest, etc. Other information shared by you through our website.',
    'Computer, device and connection information, such as, IP address, browser type, operating system, platform type, device type, and connection type.',
  ];

  final List<String> secondList = [
    'Direct interactions, such as, when you register for our Services, upload content, email and contact us',
    'Automated Tracking Technologies, such as cookies, web logs, and internet tags collecting information automatically about your interaction with our services.',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Privacy Policy',
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
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
          child: Container(
            width: 900,
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                paragraphText('FinWise ("we" or "us") wants to inform you about the ways we process your personal information. In this Privacy Policy we explain what personal information we collect, use and disclose. Personal information means any data relating to an individual who can be identified, directly or indirectly, based on that information. This may include information such as names, contact details, (online) identification data, online identifiers, or other characteristics specific to that individual. This Privacy Policy applies when you visit and use our application and services available through our application ("Services").'),
                SizedBox(height: 30),
                titleText('CHILDREN\'S PRIVACY'),
                SizedBox(height: 30),
                paragraphText('Our Services are intended for inviduals over eighteen (18) years of age. We do not target children and do not knowingly correct any personal information from children under the age of thirteen (13). When a user is discloses personal information on our Services, that user is representing to us that he or she is at least eighteen (18) years of age.'),
                SizedBox(height: 30),
                titleText('PERSONAL INFORMATION WE COLLECT'),
                SizedBox(height: 30),
                paragraphText('The type of personal information we collect depends on how you are specifically interacting with us and which Services you are using. Generally, we collect the following categories of personal information: '),
                SizedBox(height: 30),
                bulletList(firstList),
                SizedBox(height: 30),
                titleText('HOW WE COLLECT PERSONAL INFORMATION'),
                SizedBox(height: 30),
                paragraphText('We and our third party service providers may collect personal information from the following sources:'),
                SizedBox(height: 30),
                bulletList(secondList),
                SizedBox(height: 30),
                titleText('HOW LONG WE KEEP YOUR PERSONAL INFORMATION'),
                SizedBox(height: 30),
                paragraphText('Your personal information will be processed to the extent necessary for the performance of our obligations, and for the time necessary to achieve the purposes for which the information is collected in accordance with applicable data protection laws. When we no longer need your personal information, we will take all reasonable steps to remove it from our systems and records or take steps to properly anonymize it so that you can no longer be identified from it.'),
                SizedBox(height: 30),
                titleText('HOW WE PROTECT YOUR PERSONAL INFORMATION'),
                SizedBox(height: 30),
                paragraphText('The security of your personal information is important to us. Taking into account the nature, scope, context, and purposes of processing personal information, as well as the risks to indiciduals of variying likelihood ad severity, we have implemented technical and organizational measures designed to protect the security of personal information. However, please note that no method of transmission over the Internet or method of electronic storage is 100% secure. Therefore, while we strive to use commercially acceptable measures designed to protect personal information, we cannot guarantee its absolute security.'),
                SizedBox(height: 30),
                titleText('WHAT ARE YOUR RIGHTS'),
                SizedBox(height: 30),
                paragraphText('These rights differ based upon local data protection laws in your contry, state, or territory. These rights may include the right to access, to rectify, to delete, to restrict processing, to withdraw your consent in processing, and to get a copy or of your personal information.'),
                SizedBox(height: 30),
                paragraphText('Please contact us to exercise your rights or for any other questions about the handling of your personal information, If you feel we are unresponsive or disagree with out Privacy Policy practices, you can also file a complaint with your national Data Protection Authority.'),
                SizedBox(height: 50),
              ]
            ),
          )
        ),
      )
    );
  }

  Container bulletList(List list) {
    return Container(
      width: 900,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
          children: list.map((strone) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\u2022', 
                  style: TextStyle( 
                    fontFamily: GlobalVariables.textFont().fontFamily,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    strone, 
                    overflow: TextOverflow.visible,
                    style: TextStyle( 
                      fontFamily: GlobalVariables.textFont().fontFamily,
                      fontSize: 12,
                      color: Colors.grey[800],
                      letterSpacing: 1,
                      height: 1.7,
                    ),
                  ),
                ),
              ]
            );
          }).toList(),
        ),
      ),
    );
  }

  Text titleText(String text) {
    return Text(
      text,
      style: TextStyle( 
        fontFamily: GlobalVariables.textFont().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }

  Text paragraphText(String text) {
    return Text(
      text,
      style: TextStyle( 
        fontFamily: GlobalVariables.textFont().fontFamily,
        fontSize: 12,
        color: Colors.grey[800],
        letterSpacing: 1,
        height: 1.7,
      ),
    );
  }
}


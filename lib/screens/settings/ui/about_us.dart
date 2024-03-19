// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({super.key});

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {

  List<String> profilePictures = [
    'https://scontent.cdninstagram.com/v/t51.29350-15/433196352_1699960903863921_773200739982035799_n.jpg?stp=dst-jpg_e35_p720x720&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=0os2-1sSYioAX_df18q&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzMyNDM0OTI5MzY1Njg1MjgyNA%3D%3D.2-ccb7-5&oh=00_AfDS0RMcaYVFzmlLkU4QsE0nXvVcktw76TBO75lyKpOaGA&oe=65FD30CF&_nc_sid=10d13b',
    'https://scontent.cdninstagram.com/v/t51.29350-15/315299653_5350664575042475_299768663378955627_n.webp?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMjgweDEyODAuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=111&_nc_ohc=ijbgwkqWD8QAX9R7h8R&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=Mjk3MDc1NzA2MjAyMDg3NDc3MA%3D%3D.2-ccb7-5&oh=00_AfA9nZ8PNWyqo0-CJ7afO45y7gRE3cFATJOyJtRO-ZWY0A&oe=65FD569B&_nc_sid=10d13b',
    'https://scontent-kul2-1.xx.fbcdn.net/v/t39.30808-6/429522107_3719012941672999_844970636219984471_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=3i20fKM1mucAX9GZs44&_nc_ht=scontent-kul2-1.xx&oh=00_AfCWSQyE6zEfKn1SLnEThJ5bZ00TyYmdwXw7UBjh4CMA2A&oe=65FC1FCC',
    'https://scontent-kul2-1.xx.fbcdn.net/v/t1.6435-9/90111955_2859295837442522_218015396098211840_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=6r_IPjokxjYAX_waaq-&_nc_ht=scontent-kul2-1.xx&oh=00_AfC2ITCFV9-q7EoMo45Tnb2mzAnpv1SYzRPO8dDmebAH_A&oe=661F5619',
  ];

  List<String> profileNames = [
    'Tang Yu Xuan',
    'Song Jia Jian',
    'Alpha Chong',
    'Koo Ming Zhe',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3565EE),
      ),
      body: Material(
        child: SingleChildScrollView( 
          child: Center( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container( 
                  height: 100,
                  width: 500,
                  child: Image.asset(
                    'assets/wave.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container( 
                  child: vision()
                ),
                Container( 
                  color: Colors.grey[100],
                  child: mission()
                ),
                member(),
              ],
            ),
          ),
        ),
      )
    );
  }

  Row vision() {
    return Row( 
      children: <Widget>[ 
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(110, 80, 0, 0),
              child: Container( 
                height: 300,
                width: 300,
                child: Image.asset( 
                  'assets/money.png',
                  fit: BoxFit.fill,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                width: 290,
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    SizedBox(height: 30),
                    Text(
                      'Our Vision',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: GlobalVariables.textFont().fontFamily,
                      )
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Empowering individuals worldwide with financial knowledge and resources to achieve economic freedom and prosperity.',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: GlobalVariables.textFont().fontFamily,
                      )
                    ),
                  ],
                ),
              ),
            ),
          ]
        )
      ]
    );
  }

  Row mission() {
    return Row( 
      children: <Widget>[ 
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              child: Container( 
                height: 300,
                width: 300,
                child: Image.asset( 
                  'assets/card.png',
                  fit: BoxFit.fill,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: Container(
                width: 270,
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [ 
                    SizedBox(height: 70),
                    Text(
                      'Our Mission',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: GlobalVariables.textFont().fontFamily,
                      )
                    ),
                    SizedBox(height: 10),
                    Text(
                      'To democratize financial literacy worldwide by providing real-time news, customizable tools, and interactive quizzes, empowering individuals of all backgrounds to make informed financial decisions and achieve prosperity。',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: GlobalVariables.textFont().fontFamily,
                      )
                    ),
                  ],
                ),
              ),
            ),
          ]
        )
      ]
    );
  }

  Container member() {
    return Container(
      color: Color(0xFFe2eafc),
      child: Column( 
        children: [ 
          SizedBox(height: 50), // Spacing (Top
          Text(
            'Our Team',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: GlobalVariables.textFont().fontFamily,
            )
          ),
          SizedBox(height: 30), // Spacing 
          SizedBox(
            height: 290,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: profilePictures.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 170, // Width of each card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150, // Width of the image container
                          height: 190, // Height of the image container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1), // Border radius to make it square
                            image: DecorationImage(
                              image: NetworkImage(profilePictures[index]),
                              fit: BoxFit.cover, // Fill the square without distortion
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          profileNames[index], // Replace with actual name
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
          SizedBox(height: 20), // Spacing (Bottom
        ],
      ),
    );
  }


}



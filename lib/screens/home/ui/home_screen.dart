import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vhack_finwise_app/data/infos.dart';
import 'package:vhack_finwise_app/model/info.dart';
import 'package:vhack_finwise_app/screens/home/Card/info_card.dart';

import 'package:vhack_finwise_app/screens/home/Card/choice_card.dart';

import 'package:vhack_finwise_app/model/article.dart';
import 'package:vhack_finwise_app/data/articles.dart'; // Import ArticleDatabase
import 'package:vhack_finwise_app/screens/home/Card/article_card.dart';

import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';
import 'package:vhack_finwise_app/screens/home/Card/news_card.dart';

import 'package:vhack_finwise_app/model/article1.dart';
import 'package:vhack_finwise_app/data/articles1.dart';
import 'package:vhack_finwise_app/screens/home/Card/article1_card.dart';

import 'package:vhack_finwise_app/model/quiz.dart';
import 'package:vhack_finwise_app/data/quizz.dart';
import 'package:vhack_finwise_app/screens/home/Card/quiz_card.dart';

import 'package:vhack_finwise_app/model/quiz1.dart';
import 'package:vhack_finwise_app/data/quizz1.dart';
import 'package:vhack_finwise_app/screens/home/Card/quiz_card1.dart';

import 'package:vhack_finwise_app/model/quiz2.dart';
import 'package:vhack_finwise_app/data/quizz2.dart';
import 'package:vhack_finwise_app/screens/home/Card/quiz_card2.dart';
import 'package:vhack_finwise_app/screens/home/ui/new_more_screen.dart';
import 'package:vhack_finwise_app/screens/home/ui/search_screen.dart';

import 'package:vhack_finwise_app/screens/home/ui/new_more_screen.dart';
import 'package:vhack_finwise_app/model/more_screen_model.dart';
import 'package:vhack_finwise_app/data/more_screen_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key); // Fix the super constructor

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    String name = 'Alan';
    final List<New> newss = NewDatabase.newss; // Access articles from data source
    final List<info> infoss = InfoDatabase.infos;
    final List<Article> articless = ArticleDatabase.articless;
    final List<Article1> articles1 = Article1Database.articles1;
    final List<quiz> quizz = QuizDatabase.quizz;
    final List<quiz1> quizz1 = Quiz1Database.quizz1;
    final List<quiz2> quizz2 = Quiz2Database.quizz2;
    final List<more_screen_new> more_screen_newss = MoreScreenNewDatabase.more_screen_newss;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinWise'),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
           child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Hi, $name',
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.blue,
                      onPressed: () => {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    ),
                          
                      },
                    )
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  'WHAT YOU',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3),
                Text(
                  'INTERESTED TODAY ?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                choice_card(), // Assuming you have this widget defined elsewhere
                SizedBox(height: 20),
                Row(children: <Widget>[
                  Text(
                    'Trending',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                    child: Text(
                      'More',
                      style: TextStyle(fontSize: 18.0, color: Colors.blue),
                    ),
                    onPressed: () => {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => new_more_screen(more_screen_newss: more_screen_newss),
                      ),
                    ),
                          
                      },
                  ),
                ]),
                SizedBox(
                  height: 150, // Adjust the height as needed
                  child: news_card(newss: newss),
                ),

                SizedBox(
                  height: 240, // Adjust the height as needed
                  child: info_card(infoss: infoss),
                ),
                SizedBox(height: 15),
                Text(
                    'Articles',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                SizedBox(
                  height: 140, // Adjust the height as needed
                  child: article_card(articless: articless),
                ),
                SizedBox(
                  height: 140, // Adjust the height as needed
                  child: article1_card(articles1: articles1),
                ),
                Text(
                    'Learns &',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                Text(
                  '   Earn Credits ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 350, // Adjust the height as needed
                  child: quiz_card(quizz: quizz),
                ),
                SizedBox(height: 20),
                Text(
                  "You don't just stop there ! :)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 170, // Adjust the height as needed
                  child: quiz_card1(quizz1: quizz1),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 170, // Adjust the height as needed
                  child: quiz_card2(quizz2: quizz2),
                ),
              ]),
        ),
      ),
    );
  }
}

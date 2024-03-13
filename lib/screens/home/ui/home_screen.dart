import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vhack_finwise_app/data/infos.dart';
import 'package:vhack_finwise_app/model/info.dart';
import 'package:vhack_finwise_app/screens/home/Card/info_card.dart';
import 'package:vhack_finwise_app/screens/home/Card/news_card.dart'; // Import corrected file name
import 'package:vhack_finwise_app/screens/home/Card/option_card.dart';
import 'package:vhack_finwise_app/model/article.dart';
import 'package:vhack_finwise_app/data/articles.dart'; // Import ArticleDatabase

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key); // Fix the super constructor

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = 'Alan';
  final List<Article> articless =
      ArticleDatabase.article; // Access articles from data source
  final List<info> infoss = InfoDatabase.infos;
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
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
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
                      onPressed: () => {},
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
                    onPressed: () {
                      print('Click');
                    },
                  ),
                ]),
                SizedBox(
                  height: 150, // Adjust the height as needed
                  child: news_card(articless: articless),
                ),

                SizedBox(
                  height: 200, // Adjust the height as needed
                  child: info_card(infoss: infoss),
                ),

                SizedBox(
                  height: 200, // Adjust the height as needed
                  child: info_card(infoss: infoss),
                ),
              ]),
        ),
      ),
    );
  }
}

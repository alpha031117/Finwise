import 'package:flutter/material.dart';
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
  final List<Article> articless = ArticleDatabase.article; // Access articles from data source
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinWise'),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
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
            Row(
              children: <Widget>[
                Text(
                  'Trending',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                InkWell(
                  child: Text(
                    'More',
                    style: TextStyle(fontSize: 18.0, color: Colors.blue),
                  ),
                  onTap: () {
                    print('Click');
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: news_card(articless: articless), // Use NewsCard widget with articles list
            ),
            
          ],
        ),
      ),
    );
  }
}

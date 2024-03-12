import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vhack_finwise_app/model/article.dart';
import 'package:vhack_finwise_app/model/article.dart';
import 'package:vhack_finwise_app/model/article.dart' ;
import 'package:vhack_finwise_app/data/articles.dart';

class news_card extends StatefulWidget {
  final List<Article> articless; // Pass articles list from parent widget
  news_card({required this.articless}); // Constructor to receive articles

  @override
  State<news_card> createState() => _news_cardState();
}

class _news_cardState extends State<news_card> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded( // Use Expanded to fill remaining space
              child: PageView.builder(
                itemCount: widget.articless.length, // Use articles from widget
                physics: PageScrollPhysics(), // Enable smooth scrolling
                itemBuilder: (context, index) => yourNewsCardWidget(widget.articless[index]), // Build each card
              ),
            ),
           
          ],
        ),
      ),
    );
  }

  Widget yourNewsCardWidget(Article article) {
  return Container(
    padding: EdgeInsets.all(10.0), // Adjust padding as needed
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align content left
      children: [
        Text(
          article.title, // Access title property
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0), // Add spacing between title and other elements
        Text(
          '${article.date.year}-${article.date.month}-${article.date.day}', // Format date
          style: TextStyle(fontSize: 11.0, color: Colors.grey),
        ),        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'By ${article.author}', // Access author property
              style: TextStyle(fontSize: 11.0, color: Colors.grey),
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                print('Article : ${article.title}');
              },
            ),
          ],
          
        ),

      ]
    
    ),
  );
}
  

}


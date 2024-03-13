import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vhack_finwise_app/model/article.dart';
import 'package:vhack_finwise_app/model/article.dart';
import 'package:vhack_finwise_app/model/article.dart';
import 'package:vhack_finwise_app/data/articles.dart';

class news_card extends StatefulWidget {
  final List<Article> articless; // Pass articles list from parent widget
  news_card({required this.articless}); // Constructor to receive articles

  @override
  State<news_card> createState() => _news_cardState();
}

class _news_cardState extends State<news_card> {
  late final PageController _pageController;


  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (_, index) {
              final article = widget.articless[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 6.0),
                width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                        article.title, // Access title property
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                      '${article.date.year}-${article.date.month}-${article.date.day}', // Format date
                      style: TextStyle(fontSize: 11.0, color: Colors.grey),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                        'By ${article.author}', // Access author property
                        style: TextStyle(fontSize: 11.0, color: Colors.grey),
                        ),
                        
          
          
        

                //     Text(
                //       article.title,
                //       style: TextStyle(
                //           fontSize: 20.0, fontWeight: FontWeight.bold),
                //     ),
                //     SizedBox(height: 10.0),
                //     Text(
                //       article.author,
                //       style: TextStyle(fontSize: 16.0),
                //     ),
                  ],
                ),
              );
            },
            itemCount: widget.articless.length,
            physics: PageScrollPhysics(), // Enable smooth scrolling
          ),
        ),
      ],
    );
  }
}

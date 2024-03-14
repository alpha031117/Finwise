import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vhack_finwise_app/model/article.dart';
import 'package:vhack_finwise_app/data/articles.dart';

class article_card extends StatefulWidget {
  final List<Article> articless; // Pass articles list from parent widget
  article_card({required this.articless}); // Constructor to receive articles

  @override
  State<article_card> createState() => _article_cardState();
}

class _article_cardState extends State<article_card> {
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
          height: 140,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (_, index) {
              final articless = widget.articless[index];
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      // Image on the left side
                      Container(
                        width: 110.0, // Adjust image width as needed
                        height: 110.0, // Adjust image height as needed
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: AssetImage('assets/stocks.jpg'), // Use AssetImage for local assets
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      // Title and type on the right side
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              articless.title,
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              maxLines: 2, // Adjust as needed
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              articless.type,
                              style: TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
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

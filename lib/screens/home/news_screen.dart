import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/home/Card/news_card.dart'; // Import corrected file name
import 'package:vhack_finwise_app/screens/home/Card/option_card.dart';
import 'package:vhack_finwise_app/model/article.dart';
import 'package:vhack_finwise_app/data/articles.dart'; // Import ArticleDatabase

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key); // Fix the super constructor

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      
    );
  }
}

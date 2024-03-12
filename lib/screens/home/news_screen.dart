import 'package:flutter/material.dart';


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
  // Leftmost icon button
  leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      // Implement functionality for leftmost icon button
    },
  ),
  // Rightmost icon buttons
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.bookmark_border),
      onPressed: () {
        // Implement functionality for search icon button
      },
    ),
    SizedBox(width: 10), // Space between the icon buttons
    IconButton(
      icon: Icon(Icons.share_rounded),
      onPressed: () {
        // Implement functionality for settings icon button
      },
    ),
  ],
)
      
    );
  }
}

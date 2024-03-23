import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/home/ui/saved_news_screen.dart';
import 'package:vhack_finwise_app/screens/home/ui/saved_global_news_screen.dart';
import 'package:vhack_finwise_app/model/saved_news_model.dart';

class SavedChooseScreen extends StatefulWidget {
  const SavedChooseScreen({Key? key}) : super(key: key);

  @override
  State<SavedChooseScreen> createState() => _SavedChooseScreenState();
}

class _SavedChooseScreenState extends State<SavedChooseScreen> {
  // late final List<News> savedNewsCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SavedGlobalNewsScreen(savedGlobalNews: SavedNewsScreen.savedGlobalNews),
                      ),
                    );
              
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Global Saved Screen',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
                  // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>  news_more_screen(more_screen_newss: widget.more_screen_newss[index]),
                    //   ),
                    // );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Local Saved Screen',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SavedNewssScreen(savedNewsCard: SavedNewsScreen.savedNewsCard),
                      ),
                    );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Saved News Screen',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

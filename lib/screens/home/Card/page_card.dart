import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:vhack_finwise_app/model/page_news_model.dart';
import 'package:vhack_finwise_app/data/page_news_data.dart';

String getfollowers(int followers) {
  if (followers >= 1000) {
    return 'k';
  } else if(followers >= 10000)
    return 'm';
  else{
    return '';
  }
}

double getfollowersNum(int followers) {
  if (followers >= 1000) {
    return followers/1000;
  } else if(followers >= 10000)
    return followers/10000;
  else{
    return followers.toDouble();
  }
}

class page_card extends StatefulWidget {
  final List<PageCard> pages; // Pass articles list from parent widget
  page_card({required this.pages}); // Constructor to receive articles
  @override
  State<page_card> createState() => _page_cardState();
}

class _page_cardState extends State<page_card> {
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
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: widget.pages.map((pages) {
              return Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey[200],
                ),
                child: Row(children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/nvidia.jpg'),
                    radius: 50,
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pages.com,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2, // Adjust as needed
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(width: 8.0),
                            SizedBox(height: 3.0),
                            Text(
                              getfollowersNum(pages.followers).toString()+getfollowers(pages.followers)+' '+'followers' ,
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 2.5,
                          right: 85,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

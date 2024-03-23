import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';
import 'package:vhack_finwise_app/screens/home/ui/widgets/Card/option_news_card.dart';
import 'package:vhack_finwise_app/screens/home/ui/saved_news_screen.dart';
import 'package:vhack_finwise_app/data/saved_news.dart';

import '../../../utils/global_variables.dart';
import 'widgets/coins.dart';
import 'widgets/lazy_to_read.dart';
import 'widgets/top_article_titile_row.dart';

String getfollowers(int followers) {
  if (followers >= 1000) {
    return 'k';
  } else if (followers >= 10000)
    return 'm';
  else {
    return '';
  }
}

double getfollowersNum(int followers) {
  if (followers >= 1000) {
    return followers / 1000;
  } else if (followers >= 10000)
    return followers / 10000;
  else {
    return followers.toDouble();
  }
}

class NewsScreen extends StatefulWidget {
  final News news;
  const NewsScreen({Key? key, required this.news}) : super(key: key);

  @override
  State<NewsScreen> createState() => _news_screenState();
}

class _news_screenState extends State<NewsScreen> {
  int _currentPage = 0;
  bool isPressed = false;
  bool isBookmarked = false;

  late final PageController _pageController;

  void changeColor() {
    setState(() {
      isPressed = true;
    });
  }

  void toggleBookmark() {
    setState(() {
      widget.news.isBookMarked = !widget.news.isBookMarked;
      if (widget.news.isBookMarked) {
        // If bookmarked, add the news to savedNews
        SavedNewsDatabase.addSavedNewsCard(widget.news);
      } else {
        // If unbookmarked, remove the news from savedNews
        SavedNewsDatabase.removeSavedNewsCard(widget.news);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  widget.news.isBookMarked
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: widget.news.isBookMarked ? Colors.blue : null,
                ),
                onPressed: () {
                  toggleBookmark();
                },
              ),
              SizedBox(width: 3), // Space between the icon buttons
              IconButton(
                icon: Icon(Icons.share_rounded),
                onPressed: () {
                  // Implement functionality for settings icon button
                },
              ),
            ],
          ),
        ),
        backgroundColor:
            Colors.grey[200], // Set the background color of the body here
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopArticleTitleRow(widget: widget),
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '${widget.news.title}',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '${widget.news.text}',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[800],
                      fontFamily: GlobalVariables.textFont().fontFamily,
                    ),
                  ),
                ), // Display the specific text (text5 in this case)
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '${widget.news.text2}',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[800],
                      fontFamily: GlobalVariables.textFont().fontFamily,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                LazyToRead(widget: widget),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    width: 330.0, // Adjust image width as needed
                    height: 200.0, // Adjust image height as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(
                            '${widget.news.imagePath}'), // Use AssetImage for local assets
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    widget.news.text3,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[800],
                      fontFamily: GlobalVariables.textFont().fontFamily,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    widget.news.text4,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[800],
                      fontFamily: GlobalVariables.textFont().fontFamily,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    widget.news.text5,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[800],
                      fontFamily: GlobalVariables.textFont().fontFamily,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Divider(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 8.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.news.imagePath),
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
                                  '${widget.news.com}',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2, // Adjust as needed
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(width: 8.0),
                                SizedBox(height: 3.0),
                                Text(
                                  getfollowersNum(widget.news.followers)
                                          .toString() +
                                      getfollowers(widget.news.followers) +
                                      ' ' +
                                      'followers',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey),
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Divider(),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.9, // Adjust width as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: GlobalVariables.tertiaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'True or Nah?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily:
                                      GlobalVariables.titleFont().fontFamily,
                                  fontWeight: FontWeight.bold),
                            ),
                            Coins(20),
                          ],
                        ),
                        Text(
                          widget.news.quiztitle, // Access title property
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: GlobalVariables.titleFont().fontFamily,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Divider(color: Color(0xFF2E457D)),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < widget.news.options.length; i++)
                              OptionWidget(
                                option: widget.news.options.keys.toList()[i],
                                color: isPressed
                                    ? widget.news.options.values.toList()[i] ==
                                            true
                                        ? Colors.green
                                        : Colors.red
                                    : Colors.white,
                                onTap: changeColor,
                              ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }


}

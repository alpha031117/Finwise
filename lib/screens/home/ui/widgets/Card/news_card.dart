import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';
import 'package:vhack_finwise_app/screens/home/ui/news_screen.dart';
import 'package:vhack_finwise_app/data/saved_news.dart';

class NewsCard extends StatefulWidget {
  final List<News> newss; // Pass articles list from parent widget
  NewsCard({required this.newss}); // Constructor to receive articles

  @override
  State<NewsCard> createState() => _news_cardState();
}

class _news_cardState extends State<NewsCard> {
  late final PageController _pageController;
  List<News> newsdata = NewDatabase.newss;

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
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (_, index) {
              final newss = widget.newss[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NewsScreen(news: widget.newss[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.8, // Adjust width as needed
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newss.title, // Access title property directly
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '${newss.date.year}-${newss.date.month}-${newss.date.day}',
                            style:
                                TextStyle(fontSize: 11.0, color: Colors.grey),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'By ${newss.author}',
                                style: TextStyle(
                                    fontSize: 11.0, color: Colors.grey),
                              ),
                              IconButton(
                                icon: Icon(
                                  newss.isBookMarked // Use isBookMarked from newss directly
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color:
                                      newss.isBookMarked ? Colors.blue : null,
                                ),
                                onPressed: () {
                                  setState(() {
                                    newss.isBookMarked = !newss.isBookMarked;
                                    if (newss.isBookMarked) {
                                      // If bookmarked, add the news to savedNews
                                      SavedNewsDatabase.addSavedNewsCard(
                                          widget.newss[index]);
                                    } else {
                                      // If unbookmarked, remove the news from savedNews
                                      SavedNewsDatabase.removeSavedNewsCard(
                                          widget.newss[index]);
                                    }
                                  });
                                  // You may want to save the updated bookmark status here
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: widget.newss.length,
            physics: PageScrollPhysics(), // Enable smooth scrolling
          ),
        ),
      ],
    );
  }
}

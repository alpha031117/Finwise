import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';


class global_screen extends StatefulWidget {
  final List<New> newss; // Pass articles list from parent widget
  const global_screen({required this.newss});

  @override
  State<global_screen> createState() => _global_screenState();
}

class _global_screenState extends State<global_screen> {
  late final PageController _pageController;
  List<New> newsdata = NewDatabase.newss;

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Global news',
                style: TextStyle(
                  color: const Color.fromARGB(255, 5, 44, 102),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 270,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (_, index) {
                    New newsItem = widget.newss[index];
                    return GestureDetector(
                      onTap: () {
                                
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 6.0),
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150, // Adjust image height as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                                image: DecorationImage(
                                  image: AssetImage(newsItem.imagePath), // Use AssetImage for local assets
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newsItem.title,
                                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Author: ${newsItem.author}',
                                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Date: ${newsItem.date.toString()}',
                                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: widget.newss.length,
                  physics: PageScrollPhysics(),
                ),
              ),

              SizedBox(height: 10.0),
              Text(
                'More News',
                style: TextStyle(
                  color: const Color.fromARGB(255, 5, 44, 102),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: widget.newss.length,
                  itemBuilder: (context, index) {
                    New newsItem = widget.newss[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 8.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                                width: 80.0, // Adjust image width as needed
                                height: 80.0, // Adjust image height as needed
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  image: DecorationImage(
                                    image: AssetImage(newsItem.imagePath), // Use AssetImage for local assets
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          SizedBox(width: 12.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newsItem.title,
                                  style: TextStyle(
                                      fontSize: 14.0, fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Date: ${newsItem.date.toString()}',
                                  style:
                                      TextStyle(fontSize: 12.0, color: Colors.grey),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Author: ${newsItem.author}',
                                  style:
                                      TextStyle(fontSize: 12.0, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

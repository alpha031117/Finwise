import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:vhack_finwise_app/model/global_screen_news_model.dart';
import 'package:vhack_finwise_app/data/global_screen_news_data.dart';

import 'package:vhack_finwise_app/screens/home/ui/global_screen_news.dart';

class GlobalScreen extends StatefulWidget {
  final List<GlobalNews> globalnews; // Pass articles list from parent widget

  const GlobalScreen({required this.globalnews});

  @override
  State<GlobalScreen> createState() => _global_screenState();
}

class _global_screenState extends State<GlobalScreen> {
  late final PageController _pageController;
  List<GlobalNews> globalnews = GlobalNewsDatabase.globalnews;

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
        preferredSize: const Size.fromHeight(60.0),
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
                    GlobalNews globalnews = widget.globalnews[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GlobalNewsScreen(
                                globalnews: widget.globalnews[index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 6.0),
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
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12.0)),
                                image: DecorationImage(
                                  image: AssetImage(globalnews
                                      .imagePath), // Use AssetImage for local assets
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    globalnews.title,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Author: ${globalnews.author}',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'Date: ${DateFormat('yyyy-MM-dd').format(globalnews.date)}',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: widget.globalnews.length > 5
                      ? 5
                      : widget.globalnews.length,
                  physics: const PageScrollPhysics(),
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
                  itemCount: widget.globalnews.length > 5
                      ? 5
                      : widget.globalnews.length,
                  itemBuilder: (context, index) {
                    GlobalNews globalnews =
                        widget.globalnews[widget.globalnews.length - 5 + index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GlobalNewsScreen(
                                globalnews: widget.globalnews[index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8),
                            child: Row(
                              children: [
                                Container(
                                  width: 80.0, // Adjust image width as needed
                                  height: 80.0, // Adjust image height as needed
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(globalnews
                                          .imagePath), // Use AssetImage for local assets
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        globalnews.title,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        'Date: ${DateFormat('yyyy-MM-dd').format(globalnews.date)}',
                                        style: TextStyle(
                                            fontSize: 12.0, color: Colors.grey),
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        'Author: ${globalnews.author}',
                                        style: TextStyle(
                                            fontSize: 12.0, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';

class news_card extends StatefulWidget {
  final List<New> newss; // Pass articles list from parent widget
  news_card({required this.newss}); // Constructor to receive articles

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
              final newss = widget.newss[index];
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
                        newss.title, // Access title property
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                      '${newss.date.year}-${newss.date.month}-${newss.date.day}', // Format date
                      style: TextStyle(fontSize: 11.0, color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text
                            (
                            'By ${newss.author}', // Access author property
                            style: TextStyle(fontSize: 11.0, color: Colors.grey),
                            ),
                            IconButton
                            (
                              icon: Icon
                              (
                                widget.newss[index].isBookMarked ? Icons.bookmark : Icons.bookmark_border,
                                  color: widget.newss[index].isBookMarked ? Colors.blue : null,
                              ),
                                onPressed: () 
                                {
                                  setState(() {
                                    widget.newss[index].isBookMarked = !widget.newss[index].isBookMarked;
                                    });
                                  },
                            ),

                          ],
                        ),

                  ],
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

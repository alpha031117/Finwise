import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vhack_finwise_app/data/infos.dart';
import 'package:vhack_finwise_app/model/info.dart';


class info_card extends StatefulWidget {
  final List<info> infoss; // Pass articles list from parent widget
  info_card({required this.infoss}); // Constructor to receive articles

  @override
  State<info_card> createState() => _info_cardState();
}

class _info_cardState extends State<info_card> {

  int _currentPage = 0;
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded( // Use Expanded to fill remaining space
              child: PageView.builder(
                itemCount: widget.infoss.length, // Use articles from widget
                physics: PageScrollPhysics(),
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                }, // Enable smooth scrolling
                itemBuilder: (context, index) =>
                    yourInfoCardWidget(widget.infoss[index]),
              ),
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.infoss.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget yourInfoCardWidget(info info) {
  return Container(
    padding: EdgeInsets.all(10.0), // Adjust padding as needed
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align content left
      children: [
        Text(
          info.title, // Access title property
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0), // Add spacing between title and other elements
        Text(
          '${info.text}', // Format date
          style: TextStyle(fontSize: 11.0, color: Colors.blueGrey),
        ),        
        
      ]
    
    ),
  );
}
  

}


import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vhack_finwise_app/model/info.dart';
import 'package:vhack_finwise_app/data/infos.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

class InfoCard extends StatefulWidget {
  final List<info> infoss; // Pass articles list from parent widget
  InfoCard({required this.infoss}); // Constructor to receive articles

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  int _currentPage = 0;
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

  bool _isTextOverflowing(String text, BuildContext context) {
    final TextSpan span = TextSpan(text: text);
    final TextPainter tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      maxLines: 6,
    );
    tp.layout(maxWidth: MediaQuery.of(context).size.width * 0.8 - 40);
    return tp.didExceedMaxLines;
  }

  void _showFullTextDialog(String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: GlobalVariables.tertiaryColor,
          content: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                text,
                style: TextStyle(
                    fontFamily: GlobalVariables.textFont().fontFamily,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // Wrap SizedBox with Expanded
          child: SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (_, index) {
                final info = widget.infoss[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 0.0),
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjust width as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.blue[500],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                    child: InkWell(
                      onTap: () {
                        if (_isTextOverflowing(info.text, context)) {
                          _showFullTextDialog(info.text);
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            info.title, // Access title property
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '${info.text}',
                            maxLines: 6, // Access author property
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (_isTextOverflowing(
                              info.text, context)) // Removed curly braces
                            ReadMore(),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: widget.infoss.length,
              physics: PageScrollPhysics(),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.infoss.length,
            (index) => Container(
              margin: EdgeInsets.all(3.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}

class ReadMore extends StatelessWidget {
  const ReadMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Read more...',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

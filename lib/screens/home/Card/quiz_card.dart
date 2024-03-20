import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:vhack_finwise_app/data/quizz.dart';

import 'package:vhack_finwise_app/model/quiz.dart';
import 'package:vhack_finwise_app/screens/home/Card/option_quiz.dart';

class quiz_card extends StatefulWidget {
  final List<Quiz> quizz; // Pass articles list from parent widget
  quiz_card({required this.quizz}); // Constructor to receive articles

  @override
  State<quiz_card> createState() => _quiz_cardState();
}

class _quiz_cardState extends State<quiz_card> {
  int _currentPage = 0;
  bool isPressed = false;
  late final PageController _pageController;

  void changeColor() {
    setState(() {
      isPressed = true;
    });
  }

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
    return Column(children: [
      Expanded(
        // Wrap SizedBox with Expanded
        child: SizedBox(
          height: 350,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (_, index) {
              final quizz = widget.quizz[index];
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                width: MediaQuery.of(context).size.width *
                    0.8, // Adjust width as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.blue[500],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 7.0),
                      child: Text(
                        quizz.title, // Access title property
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 0.0),
                      child: const Divider(color: Colors.white),
                    ),
                    SizedBox(height: 5.0),
                    for (int i = 0; i < widget.quizz[index].options.length; i++)
                      Align(
                        alignment: Alignment.center,
                        child: OptionWidget(
                          option: widget.quizz[index].options.keys.toList()[i],
                          color: isPressed
                              ? widget.quizz[index].options.values
                                          .toList()[i] ==
                                      true
                                  ? Colors.green
                                  : Colors.red
                              : Colors.white,
                              onTap: changeColor,
                        ),
                      )
                  ],
                ),
              );
            },
            itemCount: widget.quizz.length,
            physics: PageScrollPhysics(),
          ),
        ),
      ),
    ]);
  }
}

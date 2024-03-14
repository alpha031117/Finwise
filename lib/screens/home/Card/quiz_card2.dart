import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:vhack_finwise_app/data/quizz2.dart';

import 'package:vhack_finwise_app/model/quiz2.dart';
import 'package:vhack_finwise_app/screens/home/Card/option_quiz2.dart';

class quiz_card2 extends StatefulWidget {
  final List<quiz2> quizz2; // Pass articles list from parent widget
  quiz_card2({required this.quizz2}); // Constructor to receive articles

  @override
  State<quiz_card2> createState() => _quiz_card2State();
}

class _quiz_card2State extends State<quiz_card2> {
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
  return Column(
    children: [
      Expanded(
        child: SizedBox(
          height: 170,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (_, index) {
              final quizz2 = widget.quizz2[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color.fromARGB(255, 1, 22, 39),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                      child: Text(
                        quizz2.title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                      child: const Divider(color: Colors.white),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OptionWidget(
                          option: 'True', // Assuming 'True' is always the first option
                          color: isPressed
                              ? widget.quizz2[index].options['True'] == true
                                  ? Colors.green
                                  : Colors.red
                              : Colors.white,
                          onTap: changeColor,
                        ),
                        OptionWidget(
                          option: 'False', // Assuming 'False' is always the second option
                          color: isPressed
                              ? widget.quizz2[index].options['False'] == true
                                  ? Colors.green
                                  : Colors.red
                              : Colors.white,
                          onTap: changeColor,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: widget.quizz2.length,
            physics: PageScrollPhysics(),
          ),
        ),
      ),
    ],
  );
}

}

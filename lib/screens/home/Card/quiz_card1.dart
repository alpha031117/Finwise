import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:vhack_finwise_app/data/quizz1.dart';

import 'package:vhack_finwise_app/model/quiz1.dart';
import 'package:vhack_finwise_app/screens/home/Card/option_quiz1.dart';

class quiz_card1 extends StatefulWidget {
  final List<quiz1> quizz1; // Pass articles list from parent widget
  quiz_card1({required this.quizz1}); // Constructor to receive articles

  @override
  State<quiz_card1> createState() => _quiz_card1State();
}

class _quiz_card1State extends State<quiz_card1> {
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
          height: 350,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (_, index) {
              final quizz1 = widget.quizz1[index];
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
                        quizz1.title,
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
                              ? widget.quizz1[index].options['True'] == true
                                  ? Colors.green
                                  : Colors.red
                              : Colors.white,
                          onTap: changeColor,
                        ),
                        OptionWidget(
                          option: 'False', // Assuming 'False' is always the second option
                          color: isPressed
                              ? widget.quizz1[index].options['False'] == true
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
            itemCount: widget.quizz1.length,
            physics: PageScrollPhysics(),
          ),
        ),
      ),
    ],
  );
}

}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:vhack_finwise_app/model/quiz_news.dart';
import 'package:vhack_finwise_app/data/quiz_news_data.dart';

import 'package:vhack_finwise_app/screens/home/Card/option_news_card.dart';


class quiz_card extends StatefulWidget {
  final List<Quiz> quizz; // Pass articles list from parent widget
  quiz_card({required this.quizz}); // Constructor to receive articles

  @override
  State<quiz_card> createState() => _quiz_cardState();
}

class _quiz_cardState extends State<quiz_card> {
  late final PageController _pageController;
  late List<bool> isOptionPressedList;
  bool isPressed = false;

  @override
  void initState() {
    _pageController = PageController();
    isOptionPressedList = List.generate(widget.quizz.length, (index) => false);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void handleOptionTap(int quizIndex, String option, bool isCorrect) {
    setState(() {
      if (!isOptionPressedList[quizIndex]) {
        isOptionPressedList[quizIndex] = true;
        // Handle the logic for the selected option
        if (isCorrect) {
          // Handle correct option selection (e.g., update score, show correct feedback)
        } else {
          // Handle incorrect option selection (e.g., show incorrect feedback)
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: widget.quizz.asMap().entries.map((entry) {
          final index = entry.key;
          final quiz = entry.value;
           final bool isOptionPressed = isOptionPressedList[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: const Color.fromARGB(255, 9, 72, 124),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  quiz.title,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                SizedBox(
                    height: 10), // Add spacing between question and options
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: quiz.options.keys.map((option) {
                    final bool isCorrect = quiz.options[option] ?? false;
                    final bool isSelected = isOptionPressed && isCorrect;
                    final Color optionColor = isSelected ? Colors.green : (isOptionPressed ? Colors.red : Colors.white); // Set red for incorrect if option is pressed
                    return OptionWidget(
                      option: option,
                      color: optionColor,
                      onTap: () => handleOptionTap(index, option, isCorrect),
                  );
                  }).toList(),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:vhack_finwise_app/model/quiz.dart';
import 'package:vhack_finwise_app/screens/home/Card/option_quiz_true_false.dart';


class QuizTrueFalseCard extends StatefulWidget {
  final Quiz quizz;

  const QuizTrueFalseCard({Key? key, required this.quizz}) : super(key: key);

  @override
  State<QuizTrueFalseCard> createState() => _QuizTrueFalseCardState();

}

class _QuizTrueFalseCardState extends State<QuizTrueFalseCard> {
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
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          padding: const EdgeInsets.symmetric(vertical: 15.0), // Added padding to increase vertical space
              width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color.fromARGB(255, 10, 49, 82),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 7.0),
                    child: Text(
                      widget.quizz.title, // Access title property
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children :[ 
                        OptionWidget(
                        option: widget.quizz.options.keys.toList()[0],
                        color: isPressed
                            ? widget.quizz.options.values
                                        .toList()[0] ==
                                    true
                                ? Colors.green
                                : Colors.red
                            : Colors.white,
                            onTap: changeColor,
                      ),
                      SizedBox(width: 10.0),
                      OptionWidget(
                        option: widget.quizz.options.keys.toList()[1],
                        color: isPressed
                            ? widget.quizz.options.values
                                        .toList()[1] ==
                                    true
                                ? Colors.green
                                : Colors.red
                            : Colors.white,
                            onTap: changeColor,
                      ),
                      ]
                  )
                ],
              ),
    
        ),
      ],
    );
  }
}

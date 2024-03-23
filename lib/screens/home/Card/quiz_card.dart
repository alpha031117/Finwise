import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:vhack_finwise_app/model/quiz.dart';
import 'package:vhack_finwise_app/screens/home/Card/option_quiz.dart';


class QuizCard extends StatefulWidget {
  final Quiz quizz;

  const QuizCard({Key? key, required this.quizz}) : super(key: key);

  @override
  State<QuizCard> createState() => _QuizCardState();

}

class _QuizCardState extends State<QuizCard> {
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
          margin:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              padding: const EdgeInsets.symmetric(vertical: 15.0), // Added padding to increase vertical space
              width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
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
                  for (int i = 0; i < widget.quizz.options.length; i++)
                    Align(
                      alignment: Alignment.center,
                      child: OptionWidget(
                        option: widget.quizz.options.keys.toList()[i],
                        color: isPressed
                            ? widget.quizz.options.values
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
    
        ),
      ],
    );
  }
}

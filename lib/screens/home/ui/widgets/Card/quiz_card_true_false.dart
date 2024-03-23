import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:vhack_finwise_app/model/quiz.dart';
import 'package:vhack_finwise_app/screens/home/ui/widgets/Card/option_quiz_true_false.dart';

import '../../../../../utils/global_variables.dart';
import '../coins.dart';

class QuizTrueFalseCard extends StatefulWidget {
  final Quiz quizz;

  const QuizTrueFalseCard({Key? key, required this.quizz}) : super(key: key);

  @override
  State<QuizTrueFalseCard> createState() => _QuizTrueFalseCardState();
}

class _QuizTrueFalseCardState extends State<QuizTrueFalseCard> {
  bool isPressed = false;
  bool showExplaination = false;
  late final PageController _pageController;

  void changeColor() {
    setState(() {
      isPressed = true;
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          showExplaination = true;
          print(showExplaination);
        });
      });
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
          width:
              MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color.fromARGB(255, 10, 49, 82),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: showExplaination == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'True or Nah?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily:
                                    GlobalVariables.titleFont().fontFamily,
                                fontWeight: FontWeight.bold),
                          ),
                          Coins(20),
                        ],
                      ),
                      Text(
                        widget.quizz.title, // Access title property
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: GlobalVariables.titleFont().fontFamily,
                        ),
                      ),
                      const Divider(color: Color(0xFF2E457D)),
                      SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OptionWidget(
                              option: widget.quizz.options.keys.toList()[0],
                              color: isPressed
                                  ? widget.quizz.options.values.toList()[0] ==
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
                                  ? widget.quizz.options.values.toList()[1] ==
                                          true
                                      ? Colors.green
                                      : Colors.red
                                  : Colors.white,
                              onTap: changeColor,
                            ),
                          ])
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'The explanation for the quiz is currently in progress. We are diligently working on providing comprehensive insights and clarifications to enhance your understanding. Please stay tuned for further updates as we finalize the explanation for the quiz.',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: GlobalVariables.textFont().fontFamily,
                          color: Colors.white),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

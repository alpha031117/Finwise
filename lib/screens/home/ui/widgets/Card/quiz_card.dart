import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:vhack_finwise_app/model/quiz.dart';
import 'package:vhack_finwise_app/screens/home/ui/widgets/Card/option_quiz.dart';
import 'package:vhack_finwise_app/screens/home/ui/widgets/coins.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

import '../../../../../data/quizz.dart';
import '../../../../settings/points_bloc/points_bloc.dart';

class QuizCard extends StatefulWidget {
  final Quiz quizz;

  const QuizCard({Key? key, required this.quizz}) : super(key: key);

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  bool isPressed = false;
  bool showExplaination = false;
  int pointsToAdd = 30;
  late final PageController _pageController;
  final pointsBloc = PointsBloc();
  void addPoints(PointsBloc bloc) {
    bloc.add(PointsAddPointsEvent(pointsToAdd));
  }

  void doneAnswering() {
    setState(() {
      isPressed = true;
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          showExplaination = true;
          print(showExplaination);
        });
      });
    });
    addPoints(pointsBloc);
     // widget.quizz.isAnswered = true;
 
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
    print(showExplaination);
    return Column(
      children: [
        Container(
          width:
              MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: GlobalVariables.primaryColor,
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
                            'Quiz Time!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                                  GlobalVariables.titleFont().toString(),
                            ),
                          ),
                          Coins(30),
                        ],
                      ),
                      Text(
                        widget.quizz.title, // Access title property
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Divider(color: Color(0xFF547BBC)),
                      ),
                      SizedBox(height: 5.0),
                      for (int i = 0; i < widget.quizz.options.length; i++)
                        Align(
                          alignment: Alignment.center,
                          child: OptionWidget(
                            option: widget.quizz.options.keys.toList()[i],
                            color: isPressed
                                ? widget.quizz.options.values.toList()[i] ==
                                        true
                                    ? Colors.green
                                    : Colors.red
                                : Colors.white,
                            onTap: doneAnswering,
                          ),
                        ),
                    ],
                  )
                : Container(
                    width: MediaQuery.of(context).size.width *
                        0.8, // Adjust width as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: GlobalVariables.primaryColor,
                    ),
                    height: 450,
                    child: Center(
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
        ),
      ],
    );
  }
}

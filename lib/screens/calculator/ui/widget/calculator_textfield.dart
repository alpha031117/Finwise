import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/global_variables.dart';

class CalculatorTextField extends StatefulWidget {
  final String title;
  final bool isAnnualReturn;
  final bool radioButton;
<<<<<<< HEAD
  final Function(String)? radioButtonValue;
=======
>>>>>>> e4277d0 (updated new calculator)
  final TextEditingController controller;
  const CalculatorTextField({
    super.key,
    required this.title,
    required this.radioButton,
    required this.isAnnualReturn,
    required this.controller,
<<<<<<< HEAD
    this.radioButtonValue,
=======
>>>>>>> e4277d0 (updated new calculator)
  });

  @override
  State<CalculatorTextField> createState() => _CalculatorTextFieldState();
}

class _CalculatorTextFieldState extends State<CalculatorTextField> {
  int? selectedOption;

<<<<<<< HEAD
  final Map<String, String> titleToTooltipMap = {
    'INITIAL DEPOSIT':
        'This field represents the initial amount you invest at the start of the calculation. The default value is RM1000',
    'CONTRIBUTIONS':
        'Enter the amount you contribute regularly (e.g., monthly) to your investment. The default value is 0.',
    'AVERAGE ANNUAL RETURN':
        'This is the expected average annual percentage return on your investment. The default value is 3%.',
    // Add more title-tooltip pairs as needed
  };
=======
>>>>>>> e4277d0 (updated new calculator)
  @override
  void initState() {
    super.initState();
    selectedOption = widget.radioButton == true ? 1 : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
<<<<<<< HEAD
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: GlobalVariables.titleFont().fontFamily,
                fontSize: 17,
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Tooltip(
              message: titleToTooltipMap[widget.title],
              child: Icon(
                Icons.help,
                color: Colors.grey[200],
                size: 23,
              ),
            )
          ],
=======
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontSize: 17,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
>>>>>>> e4277d0 (updated new calculator)
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 15,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: widget.controller,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
<<<<<<< HEAD
              prefix: widget.isAnnualReturn
                  ? const Text('  %  ')
                  : const Text(' RM  '),
=======
              prefix: widget.isAnnualReturn ? Text('  %  ') : Text(' RM  '),
>>>>>>> e4277d0 (updated new calculator)
              hintStyle: TextStyle(
                color: Colors.grey[300],
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: GlobalVariables.secondaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
<<<<<<< HEAD
        widget.radioButton == true ? showRadioButtons() : const SizedBox(),
      ],
    );
  }

  Row showRadioButtons() {
    return Row(
      children: [
        Row(
          children: [
            Radio<int>(
              value: 1,
              activeColor: GlobalVariables.secondaryColor,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  widget.radioButtonValue!('Annually');
                  selectedOption = value!;
                  print("Button value: $value");
                });
              },
            ),
            const Text('Annually'),
          ],
        ),
        Row(
          children: [
            Radio<int>(
              value: 2,
              activeColor: GlobalVariables.secondaryColor,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  widget.radioButtonValue!('Monthly');
                  selectedOption = value!;
                  print("Button value: $value");
                });
              },
            ),
            const Text('Monthly'),
          ],
        ),
        Row(
          children: [
            Radio<int>(
              activeColor: GlobalVariables.secondaryColor,
              value: 3,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  widget.radioButtonValue!('Quarterly');
                  selectedOption = value!;
                  print("Button value: $value");
                });
              },
            ),
            const Text('Quarterly'),
          ],
        ),
=======
        widget.radioButton == true
            ? Row(
                children: [
                  Row(
                    children: [
                      Radio<int>(
                        value: 1,
                        activeColor: GlobalVariables.secondaryColor,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                            print("Button value: $value");
                          });
                        },
                      ),
                      const Text('Annually'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                        value: 2,
                        activeColor: GlobalVariables.secondaryColor,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                            print("Button value: $value");
                          });
                        },
                      ),
                      const Text('Monthly'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                        activeColor: GlobalVariables.secondaryColor,
                        value: 3,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                            print("Button value: $value");
                          });
                        },
                      ),
                      const Text('Weekly'),
                    ],
                  ),
                ],
              )
            : SizedBox(),
>>>>>>> e4277d0 (updated new calculator)
      ],
    );
  }
}

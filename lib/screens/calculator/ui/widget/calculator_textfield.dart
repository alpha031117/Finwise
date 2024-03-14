import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/global_variables.dart';

class CalculatorTextField extends StatefulWidget {
  final String title;
  final bool isAnnualReturn;
  final bool radioButton;
  final Function(String)? radioButtonValue;
  final TextEditingController controller;
  const CalculatorTextField({
    super.key,
    required this.title,
    required this.radioButton,
    required this.isAnnualReturn,
    required this.controller, this.radioButtonValue,
  });

  @override
  State<CalculatorTextField> createState() => _CalculatorTextFieldState();
}

class _CalculatorTextFieldState extends State<CalculatorTextField> {
  int? selectedOption;

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
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontSize: 17,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
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
              prefix: widget.isAnnualReturn ? Text('  %  ') : Text(' RM  '),
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
                            widget.radioButtonValue!('Weekly');
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
      ],
    );
  }
}

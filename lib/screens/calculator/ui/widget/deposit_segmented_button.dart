import 'package:flutter/material.dart';

import '../../../../utils/global_variables.dart';

class DepositSegmentedButton extends StatefulWidget {
  final Function(String) onValueChanged; // Updated parameter type

  const DepositSegmentedButton({
    super.key,
    required this.onValueChanged,
  });

  @override
  State<DepositSegmentedButton> createState() => _DepositSegmentedButtonState();
}

class _DepositSegmentedButtonState extends State<DepositSegmentedButton> {
  String selectedValue = 'Beginning'; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Deposits made at what point in period?',
              style: TextStyle(
                fontFamily: GlobalVariables.titleFont().fontFamily,
                fontSize: 17,
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 10),
            Tooltip(
              message:
                  'This field represents the initial amount you invest at the start or end of each period.',
              child: Icon(
                Icons.help,
                color: Colors.grey[200],
                size: 23,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SegmentedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.selected)) {
                        return GlobalVariables.secondaryColor;
                      }
                      return Colors.white;
                    },
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.white;
                      }
                      return GlobalVariables.secondaryColor;
                    },
                  ),
                ),
                segments: const [
                  ButtonSegment(
                    value: 'Beginning',
                    label: Text('Beginning'),
                  ),
                  ButtonSegment(
                    value: 'End',
                    label: Text('End'),
                  ),
                ],
                selected: {selectedValue}, // Use local state for selected value
                onSelectionChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue.first;
                    widget.onValueChanged(selectedValue); // Pass value to callback
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
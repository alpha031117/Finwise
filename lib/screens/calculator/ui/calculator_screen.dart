import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/calculator/ui/widget/years_to_grow.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

import 'widget/calculator_textfield.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String defaultPotentialFutureBalance = '6969';
  String selectedContribution = "Annually";
  String yearsToGrow = "10";
  double futureAmount = 0.0;
  int selectedOption = 1;

  TextEditingController initialDepositController = TextEditingController();
  TextEditingController contributionsController = TextEditingController();
  TextEditingController annualReturnController = TextEditingController();

  @override
  void dispose() {
    initialDepositController.dispose();
    contributionsController.dispose();
    annualReturnController.dispose();
    super.dispose();
  }

  //getters for controllers
  //get the string value of the text fields
  String get principal => initialDepositController.text; //P
  String get contributions => contributionsController.text;
  String get interestRate => annualReturnController.text; // r

  void calculate() {
    double totalContribution = 0.0; //initial
    int contributionTimespan = 0; //intial
    switch (selectedContribution) {
      case "Weekly":
        contributionTimespan =
            int.parse(yearsToGrow) * 52; //52 is total weeks in a year
        break;
      case "Monthly":
        contributionTimespan =
            int.parse(yearsToGrow) * 12; // 12 is total months in a year
        break;
      case "Yearly":
        //t
        contributionTimespan = int.parse(yearsToGrow);

        break;
    }
    //total contribution = (contribution * years to grow)
    print('contributions : $contributions');
    totalContribution =
        int.parse(contributions).toDouble() * contributionTimespan;
    print('contributions : $totalContribution');
    //future amount = principal + total contribution
    futureAmount = int.parse(principal) + totalContribution;
    for (int i = 0; i < int.parse(yearsToGrow); i++) {
      futureAmount = futureAmount * (1 + int.parse(interestRate) / 100);
      print('year $i: $futureAmount');
    }

    print('future amount: $futureAmount');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: GlobalVariables.horizontalPadding,
            ),
            child: Column(
              children: [
                //potential return
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Text(
                        'POTENTIAL FUTURE BALANCE',
                        style: TextStyle(
                          fontFamily: GlobalVariables.titleFont().fontFamily,
                          fontSize: 15,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'RM$defaultPotentialFutureBalance',
                        style: TextStyle(
                          fontFamily: GlobalVariables.titleFont().fontFamily,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: GlobalVariables.tertiaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                //graph
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: GlobalVariables.secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //graph description
                Text(
                    'Check out our compound interest calculator to see just how much the power of tme and compound interest can help your money grow',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontFamily: GlobalVariables.titleFont().fontFamily,
                      fontWeight: FontWeight.w400,
                    )),
                const SizedBox(
                  height: 30,
                ),
                //initial deposit
                CalculatorTextField(
                  title: 'INITIAL DEPOSIT',
                  radioButton: false,
                  isAnnualReturn: false,
                  controller: initialDepositController,
                ),
                const SizedBox(
                  height: 20,
                ),
                //contributions
                CalculatorTextField(
                  title: 'CONTRIBUTIONS',
                  radioButton: true,
                  isAnnualReturn: false,
                  controller: contributionsController,
                  radioButtonValue: (value) {
                    setState(() {
                      selectedContribution = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                //years to grow slider
                YearsToGrow(
                    yearsToGrow: yearsToGrow,
                    onChanged: (value) {
                      setState(() {
                        yearsToGrow = value.toString();
                      });
                    }),
                //average annual return
                CalculatorTextField(
                  title: 'AVERAGE ANNUAL RETURN',
                  radioButton: false,
                  isAnnualReturn: true,
                  controller: annualReturnController,
                ),
                const SizedBox(
                  height: 40,
                ),
                //calculate my estimate button
                TextButton(
                    onPressed: () {
                      print(selectedContribution);
                      calculate();
                    },
                    child: Text('Calculate My Estimate'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

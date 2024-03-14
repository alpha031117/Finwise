// ignore_for_file: prefer_const_literals_to_create_immutables, camel_case_types, prefer_const_constructors, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';
import 'dart:math';

class myCalculator extends StatefulWidget {
  const myCalculator({super.key});

  @override
  State<myCalculator> createState() => _myCalculatorState();
}

class Calculation {

  static double calculateFutureInvestmentValue (double initialInvestment, double interestRate, double years, String compoundFrequency) {
    double compoundInterval = 0;
    switch (compoundFrequency) {
      case 'Daily':
        compoundInterval = 365;
        break;
      case 'Monthly':
        compoundInterval = 12;
        break;
      case 'Annually':
        compoundInterval = 1;
        break;
    }
    double futureInvestmentValue = initialInvestment * pow((1 + ((interestRate / 100) / compoundInterval)), (compoundInterval * years));
    return futureInvestmentValue;
  }

}

class _myCalculatorState extends State<myCalculator> {

  TextEditingController initialInvestmantController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController compoundFrequencyController = TextEditingController();

  double initialInvestment = 0;
  double interestRate = 0;
  double years = 0;
  String compoundFrequency = "";
  double futureInvestmentValue = 0;
  List compoundFrequencyList = ['Daily', 'Monthly', 'Annually'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Calculator',
          style: TextStyle(
            fontFamily: GlobalVariables.titleFont().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: GlobalVariables.tertiaryColor,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column( 
            children: <Widget>[
              SizedBox(height: 20),
              Form( 
                child: Column( 
                  children: [ 
                    Container(
                       decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField( 
                          controller: initialInvestmantController,
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.words, // Capitalize first letter of each name
                          decoration: InputDecoration(
                            label: Text('Initisl Investment / Principal (P)'),
                            enabledBorder: OutlineInputBorder( 
                              borderSide: BorderSide.none,
                            ), 
                            prefixIcon: Icon(Icons.attach_money),
                            labelStyle: TextStyle( 
                              color: Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField( 
                          controller: interestRateController,
                          keyboardType: TextInputType.number, 
                          textCapitalization: TextCapitalization.words, // Capitalize first letter of each name
                          decoration: InputDecoration(
                            label: Text('Interest Rate (r)'),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.attach_money),
                            labelStyle: TextStyle( 
                              color: Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField( 
                          controller: yearsController,
                          keyboardType: TextInputType.number, 
                          textCapitalization: TextCapitalization.words, // Capitalize first letter of each name
                          decoration: InputDecoration(
                            label: Text('Years (t)'),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.attach_money),
                            labelStyle: TextStyle( 
                              color: Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: compoundFrequencyList.first,
                          onChanged: (newValue) {
                            setState(() {
                              compoundFrequency = newValue!;
                            });
                          },
                          items: <String>['Daily', 'Monthly', 'Annually']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Compound Frequency (n)',
                            prefixIcon: Icon(Icons.attach_money),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: (){
                        setState(() {
                          initialInvestment = double.parse(initialInvestmantController.text);
                          interestRate = double.parse(interestRateController.text);
                          years = double.parse(yearsController.text);
                          // compoundFrequency = newValue!; 
                          print(compoundFrequency);

                          futureInvestmentValue = Calculation.calculateFutureInvestmentValue(initialInvestment, interestRate, years, compoundFrequency);

                        });
                      } ,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: GlobalVariables.primaryColor,
                        fixedSize: Size(200, 28),
                      ), 
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Initial Investment: $initialInvestment',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),

                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Interest Rate: $interestRate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),

                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Years : $years',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),

                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Compound Frequency: $compoundFrequency',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),

                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Future Investment Value: $futureInvestmentValue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),

                  ],
                )
              )
            ]
          )
        ),
      )
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    initialInvestmantController.dispose();
    super.dispose();
  }
}
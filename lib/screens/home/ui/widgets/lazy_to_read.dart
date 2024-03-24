import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';
import '../news_screen.dart';

class LazyToRead extends StatefulWidget {
  const LazyToRead({
    Key? key,
   
  }) : super(key: key);

  

  @override
  _LazyToReadState createState() => _LazyToReadState();
}

class _LazyToReadState extends State<LazyToRead> {
  bool _isExpanded = false;
  int windowHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150.0, // Adjust image width as needed
          height: 50.0, // Adjust image height as needed
          decoration: BoxDecoration(
            color: GlobalVariables.secondaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(_isExpanded ? 0 : 10),
              bottomLeft: Radius.circular(_isExpanded ? 0 : 10),
            ),
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
                if (_isExpanded) {
                  windowHeight = 300;
                } else {
                  windowHeight = 0;
                }
              });
            },
            child: Text('Too Lazy to read?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontFamily: GlobalVariables.textFont().fontFamily,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        SizedBox(width: 10),
        AnimatedCrossFade(
          alignment: Alignment.bottomLeft,
          duration: Duration(milliseconds: 150),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: SizedBox(), // Empty SizedBox for collapsed state
          secondChild: Container(
            width: double.infinity,
            height: windowHeight.toDouble(),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: GlobalVariables.secondaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "This article provides a simplified version of the original content. Due to the lack of backend implementation, the data is hard-coded for demonstration.\n\nThe content retains essential information but lacks dynamic elements present in the fully implemented version.\n\nThis simplified version aims to convey main ideas effectively, serving as a placeholder until backend functionality is integrated.\n\n Please note that certain features, like real-time updates, are unavailable due to the absence of backend services.\n\n ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontFamily: GlobalVariables.textFont().fontFamily),
                maxLines: 12, // Set the number of lines to show initially
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
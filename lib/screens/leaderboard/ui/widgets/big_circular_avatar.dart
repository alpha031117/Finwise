import 'package:flutter/material.dart';

import '../../../../utils/global_variables.dart';

class BigCircularAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isFirst;
  final String name;
  final String points;

  const BigCircularAvatar(
      {super.key,
      required this.imageUrl,
      required this.isFirst,
      required this.name,
      required this.points});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isFirst == true
            ? Stack(
                children: [
                  Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(107, 148, 255, 1),
                    ),
                  ),
                  Positioned(
                    right: (125 - 100) / 2,
                    top: (125 - 100) / 2,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 80,
          child: Center(
            child: Text(
              maxLines: 1,
              name,
              style: TextStyle(
                fontFamily: GlobalVariables.titleFont().fontFamily,
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 80,
          child: Center(
            child: Text(
              maxLines: 1,
              points,
              style: TextStyle(
                fontFamily: GlobalVariables.titleFont().fontFamily,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

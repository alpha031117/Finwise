import 'package:flutter/material.dart';

class BigCircularAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isFirst;
  final String name;
  final String points;

  const BigCircularAvatar(
      {super.key, required this.imageUrl,
      this.isFirst = false,
      required this.name,
      required this.points});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isFirst
                  ? Color.fromRGBO(107, 148, 255, 1)
                  : Colors.transparent,
              width: isFirst ? 4.0 : 0.0,
            ),
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        Text(name),
        Text(points),
      ],
    );
  }
}

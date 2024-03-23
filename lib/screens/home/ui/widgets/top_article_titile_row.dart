import 'package:flutter/material.dart';

import '../news_screen.dart';

class TopArticleTitleRow extends StatelessWidget {
  const TopArticleTitleRow({
    super.key,
    required this.widget,
  });

  final NewsScreen widget;
String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 4),
          CircleAvatar(
            backgroundImage: AssetImage('${widget.news.imagePath}'),
            radius: 9.5,
          ),
          SizedBox(width: 5),
          Text(
            '${widget.news.com}',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 8,
              ),
              Positioned(
                top: 1.5,
                left: 1.0,
                child: Icon(
                  Icons.check,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(width: 5),
          Container(
            width: 1,
            height: 14,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 5),
          ),
          SizedBox(width: 5),
          Text('5 min Read'),
          SizedBox(width: 5),
          Container(
            width: 1,
            height: 14,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 5),
          ),
          SizedBox(width: 3),
          Text(
            getMonthName(widget.news.date.month) +
                ' ' +
                '${widget.news.date.day}, ${widget.news.date.year}', // Format date
            style:
                TextStyle(fontSize: 14.0, color: Colors.grey[500]),
          ),
        ]);
  }
}

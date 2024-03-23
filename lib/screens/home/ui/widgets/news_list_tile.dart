import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsListTile extends StatelessWidget {
  final dynamic globalOrLocalNews;
  const NewsListTile({
    super.key,
    required this.globalOrLocalNews,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 80.0, // Adjust image width as needed
                height: 80.0, // Adjust image height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage(globalOrLocalNews
                        .imagePath), // Use AssetImage for local assets
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      globalOrLocalNews.title,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Date: ${DateFormat('yyyy-MM-dd').format(globalOrLocalNews.date)}',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Author: ${globalOrLocalNews.author}',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
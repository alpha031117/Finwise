import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/data/news.dart';
import 'package:vhack_finwise_app/screens/home/ui/news_screen_card.dart';


class NewsMoreScreen extends StatefulWidget {
  final List<News> more_screen_newss; // Pass articles list from parent widget
  NewsMoreScreen({required this.more_screen_newss}); // Constructor to receive articles

  @override
  State<NewsMoreScreen> createState() => _new_more_screenState();
}

class _new_more_screenState extends State<NewsMoreScreen> {
  List<News> newsdata = NewDatabase.newss;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(60.0), // specify the preferred height here
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
         backgroundColor:
            Colors.grey[200], // Set the background color of the body here
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0),
              Expanded(
              child: ListView.builder(
                itemCount: newsdata.length > 5 ? 5 : widget.more_screen_newss.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  NewsScreen(news: widget.more_screen_newss[index]),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsdata[index].title,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 5, 49, 85),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '${newsdata [index].date.year}-${newsdata [index].date.month}-${newsdata [index].date.day}',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: const Color.fromARGB(255, 5, 49, 85),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            '${newsdata [index].author}',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: const Color.fromARGB(255, 5, 49, 85),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}